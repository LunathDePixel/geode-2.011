#include <Geode/DefaultInclude.hpp>

#if defined(GEODE_IS_WINDOWS)

#include "../load.hpp"
#include <Windows.h>

#include "loader/LoaderImpl.hpp"
#include "loader/console.hpp"
using namespace geode::prelude;

void updateGeode() {
    const auto workingDir = dirs::getGameDir();
    const auto geodeDir = dirs::getGeodeDir();
    const auto updatesDir = geodeDir / "update";

    bool bootstrapperExists = std::filesystem::exists(workingDir / "GeodeBootstrapper.dll");
    bool updatesDirExists = std::filesystem::exists(geodeDir) && std::filesystem::exists(updatesDir);

    if (!bootstrapperExists && !updatesDirExists)
        return;

    // update updater
    if (std::filesystem::exists(updatesDir) &&
        std::filesystem::exists(updatesDir / "GeodeUpdater.exe"))
        std::filesystem::rename(updatesDir / "GeodeUpdater.exe", workingDir / "GeodeUpdater.exe");

    utils::game::restart();
}

// GD 2.011: copied WinMain prologue + jmp back (built by loadGeode)
static void* g_winMainTrampoline = nullptr;

int WINAPI gdMainHook(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPWSTR lpCmdLine, int nCmdShow) {
    updateGeode();

    int exitCode = geodeEntry(hInstance);
    if (exitCode != 0)
        return exitCode;

    return reinterpret_cast<decltype(&wWinMain)>(g_winMainTrampoline)(hInstance, hPrevInstance, lpCmdLine, nCmdShow);
}

bool loadGeode() {
    // GD 2.011: WinMain is at 0x1A5A40 (called from __tmainCRTStartup 0x5A6BA8) with the same
    // 6-byte prologue as 2.113 (push ebp; mov ebp, esp; and esp, -8), but only 3 bytes of int3
    // padding precede it, so 2.113's in-place trick (prologue copy + jmp written into the 8 bytes
    // before WinMain) does not fit. Instead: copy the prologue into an executable trampoline that
    // jumps back to WinMain+6, and overwrite the prologue with a jmp to gdMainHook (+1 nop).
    constexpr uintptr_t winMainOffset = 0x1a5a40;
    constexpr size_t prologueLength = 6;
    static constexpr uint8_t expected[prologueLength] = { 0x55, 0x8b, 0xec, 0x83, 0xe4, 0xf8 };

    auto winMain = reinterpret_cast<uint8_t*>(geode::base::get() + winMainOffset);
    if (std::memcmp(winMain, expected, prologueLength) != 0)
        return false;

    auto trampoline = static_cast<uint8_t*>(
        VirtualAlloc(nullptr, prologueLength + 5, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE)
    );
    if (!trampoline)
        return false;
    std::memcpy(trampoline, winMain, prologueLength);
    trampoline[prologueLength] = 0xe9;
    auto back = static_cast<int32_t>(
        reinterpret_cast<intptr_t>(winMain + prologueLength) - reinterpret_cast<intptr_t>(trampoline + prologueLength + 5)
    );
    std::memcpy(trampoline + prologueLength + 1, &back, 4);
    g_winMainTrampoline = trampoline;

    uint8_t patchBytes[prologueLength] = { 0xe9, 0, 0, 0, 0, 0x90 };
    auto detour = static_cast<int32_t>(
        reinterpret_cast<intptr_t>(&gdMainHook) - reinterpret_cast<intptr_t>(winMain + 5)
    );
    std::memcpy(patchBytes + 1, &detour, 4);

    DWORD oldProtect;
    if (!VirtualProtect(winMain, prologueLength, PAGE_EXECUTE_READWRITE, &oldProtect))
        return false;
    std::memcpy(winMain, patchBytes, prologueLength);
    VirtualProtect(winMain, prologueLength, oldProtect, &oldProtect);
    FlushInstructionCache(GetCurrentProcess(), winMain, prologueLength);
    return true;
}

DWORD WINAPI upgradeThread(void*) {
    updateGeode();
    return 0;
}

void earlyError(std::string message) {
    // try to write a file and display a message box
    // wine might not display the message box but *should* write a file
    std::ofstream fout("_geode_early_error.txt");
    fout << message;
    fout.close();
    console::messageBox("Unable to Load Geode!", message);
}

DWORD WINAPI sus(void*) {
    ShellExecuteA(nullptr, nullptr, "https://media.tenor.com/cW1jA2hYdfcAAAAC/among-us-funny.gif", nullptr, nullptr, SW_SHOW);
    MessageBoxA(
        nullptr,
        "Red sus. Red suuuus. I\r\n"
        "said red, sus,\r\n"
        "hahahahahaha. Why\r\n"
        "arent you laughing? I\r\n"
        "just made a reference\r\n"
        "to the popular game\r\n"
        "\"Among Us\"! How can\r\n"
        "you not laugh at it?\r\n"
        "Emergency meeting!\r\n"
        "Guys, this here guy\r\n"
        "doesn't laugh at my\r\n"
        "funny Among Us\r\n"
        "memes! Let's beat him\r\n"
        "to death! Dead body\r\n"
        "reported! Skip! Skip!\r\n"
        "Vote blue! Blue was\r\n"
        "not an impostor.\r\n",
        "AMONG US ACTIVATED REAL !!!!!!!!!",
        MB_OK
    );
    return 0;
}
extern "C" __declspec(dllexport) void fake() {
    for (int i = 0; i < 5; i++)
        CreateThread(nullptr, 0, sus, nullptr, 0, nullptr);
}

BOOL WINAPI DllMain(HINSTANCE module, DWORD reason, LPVOID) {
    if (reason != DLL_PROCESS_ATTACH)
        return TRUE;
    // Prevents threads from notifying this DLL on creation or destruction.
    // Kind of redundant for a game that isn't multi-threaded but will provide
    // some slight optimizations if a mod frequently creates and deletes threads.
    DisableThreadLibraryCalls(module);

    try {
        // if we find the old bootstrapper dll, don't load geode, copy new updater and let it do the rest
        auto workingDir = dirs::getGameDir();
        std::error_code error;
        bool oldBootstrapperExists = std::filesystem::exists(workingDir / "GeodeBootstrapper.dll", error);
        if (error) {
            earlyError("There was an error checking whether the old GeodeBootstrapper.dll exists: " + error.message());
            return FALSE;
        }
        else if (oldBootstrapperExists)
            CreateThread(nullptr, 0, upgradeThread, nullptr, 0, nullptr);
        else if (!loadGeode()) {
            earlyError("There was an unknown error hooking the GD main function.");
            return FALSE;
        }
    }
    catch(...) {
        earlyError("There was an unknown error somewhere very very early and this is really really bad.");
        return FALSE;
    }

    return TRUE;
}

#endif

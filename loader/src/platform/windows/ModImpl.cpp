#include <fstream>
#include <Geode/DefaultInclude.hpp>

#include <Geode/loader/Mod.hpp>
#include <loader/ModImpl.hpp>

using namespace geode::prelude;

template <typename T>
T findSymbolOrMangled(HMODULE load, char const* name, char const* mangled) {
    auto res = reinterpret_cast<T>(GetProcAddress(load, name));
    if (!res) {
        res = reinterpret_cast<T>(GetProcAddress(load, mangled));
    }
    return res;
}

char const* getUsefulError(DWORD code) {
    switch (code) {
        case ERROR_MOD_NOT_FOUND:
            return "ERROR_MOD_NOT_FOUND;\n\nThe mod is either missing the DLL "
                   "file or some of its dependencies. Make sure to list all "
                   "other mods you depend on under dependencies in mod.json  "
                   "and that the mod is not built in Debug.\n\n"
                   "If you are not the developer of this mod, report this error "
                   "to them as it is likely not your fault. Also try [updating "
                   "Microsoft Visual C++ Redistributable 2026 (64-bit).](https://aka.ms/vc14/vc_redist.x64.exe)";

        case ERROR_PROC_NOT_FOUND:
            return "ERROR_PROC_NOT_FOUND;\n\nThe mod tried to access "
                   "a function defined in another DLL, but the specified "
                   "function was not found. Make sure the other DLL exports "
                   "the given symbol, and that it is defined in the DLL.\n\n"
                   "If you are not the developer of this mod, report this error "
                   "to them as it is likely not your fault.";

        case ERROR_DLL_INIT_FAILED:
            return "ERROR_DLL_INIT_FAILED;\n\nLikely some global variables "
                   "in the mod threw an exception or otherwise failed. "
                   "ALSO MAKE SURE YOU ARE COMPILING IN RELEASE MODE.\n\n"
                   "If you are not the developer of this mod, report this error "
                   "to them as it is likely not your fault.";

        case 4551:
            return "Blocked by Windows Smart App Control (4551);\n\nWindows prevented "
                    "the mod from loading because it is an unrecognized application. "
                    "This is a security feature in Windows that blocks applications "
                    "from small developers - including most Geometry Dash mods.\n\n"
                    "You can disable Smart App Control in Windows Security settings to make the mod load. "
                    "[Click here to learn more about Smart App Control](https://learn.microsoft.com/en-us/windows/apps/develop/smart-app-control/overview).";
        case 0xc0e90002:
            return "Blocked by Windows Smart App Control (0xc0e90002);\n\nWindows prevented "
                    "the mod from loading because it is an unrecognized application. "
                    "This is a security feature in Windows that blocks applications "
                    "from small developers - including most Geometry Dash mods.\n\n"
                    "You can disable Smart App Control in Windows Security settings to make the mod load. "
                    "[Click here to learn more about Smart App Control](https://learn.microsoft.com/en-us/windows/apps/develop/smart-app-control/overview).";

        default: break;
    }
    return nullptr;
}

std::string getLastWinError() {
    auto err = GetLastError();
    if (!err) return "None (0)";
    auto useful = getUsefulError(err);
    if (useful) return useful;

    return formatSystemError(err);
}

#ifdef GEODE_IS_WINDOWS32
// GD 2.011 port: the index only carries 64-bit Windows builds; say so instead of the loader's
// "%1 is not a valid Win32 application"
static Result<> checkBinaryIs32Bit(std::filesystem::path const& path) {
    std::ifstream f(path, std::ios::binary);
    IMAGE_DOS_HEADER dos{};
    IMAGE_NT_HEADERS32 nt{};
    if (!f.read(reinterpret_cast<char*>(&dos), sizeof(dos)) || dos.e_magic != IMAGE_DOS_SIGNATURE) return Ok();
    f.seekg(dos.e_lfanew);
    if (!f.read(reinterpret_cast<char*>(&nt), 6) || nt.Signature != IMAGE_NT_SIGNATURE) return Ok();
    if (nt.FileHeader.Machine == IMAGE_FILE_MACHINE_AMD64 || nt.FileHeader.Machine == IMAGE_FILE_MACHINE_ARM64) {
        return Err(
            "This mod is built for 64-bit Windows, but this game (GD 2.011) is 32-bit. "
            "It has to be recompiled for 32-bit (x86); the Geode index has no such builds."
        );
    }
    return Ok();
}
#endif

Result<> Mod::Impl::loadPlatformBinary() {
#ifdef GEODE_IS_WINDOWS32
    GEODE_UNWRAP(checkBinaryIs32Bit(this->getBinaryPath()));
#endif
    auto load = LoadLibraryW(this->getBinaryPath().c_str());
    if (load) {
        if (m_platformInfo) {
            delete m_platformInfo;
        }
        m_platformInfo = new PlatformInfo { load };

        auto geodeImplicitEntry = findSymbolOrMangled<void(*)()>(load, "geodeImplicitEntry", "_geodeImplicitEntry@0");
        if (geodeImplicitEntry) {
            geodeImplicitEntry();
        }

        auto geodeCustomEntry = findSymbolOrMangled<void(*)()>(load, "geodeCustomEntry", "_geodeCustomEntry@0");
        if (geodeCustomEntry) {
            geodeCustomEntry();
        }
        return Ok();
    }
    return Err("Unable to load the DLL: " + getLastWinError());
}

void Mod::Impl::addNativeBinariesPath(std::filesystem::path const& path) {
    // https://learn.microsoft.com/en-us/windows/win32/api/libloaderapi/nf-libloaderapi-adddlldirectory#remarks
    static auto runOnce = [] {
        SetDefaultDllDirectories(LOAD_LIBRARY_SEARCH_DEFAULT_DIRS);
        return 0;
    }();
    AddDllDirectory(path.c_str());
}
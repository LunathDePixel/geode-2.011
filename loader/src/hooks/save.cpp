#include <Geode/loader/Loader.hpp>

using namespace geode::prelude;

#include <Geode/modify/AppDelegate.hpp>
#include <Geode/modify/CCApplication.hpp>

namespace {
    void saveModData() {
        log::info("Saving mod data...");
        log::NestScope nest;

        auto begin = std::chrono::high_resolution_clock::now();

        (void)Loader::get()->saveData();

        auto end = std::chrono::high_resolution_clock::now();
        auto time = std::chrono::duration_cast<std::chrono::milliseconds>(end - begin).count();
        log::info("Took {}s", static_cast<float>(time) / 1000.f);
    }
}

struct SaveLoader : Modify<SaveLoader, AppDelegate> {
    GEODE_FORWARD_COMPAT_DISABLE_HOOKS("save moved to CCApplication::gameDidSave()")
    void trySaveGame() {  // GD 2.011 port: no argument in 2.0
        saveModData();
        return AppDelegate::trySaveGame();
    }
};

#if defined(GEODE_IS_WINDOWS) && GEODE_COMP_GD_VERSION >= 22000  // GD 2.011 port: gameDidSave is a 2.2 cocos export

struct FallbackSaveLoader : Modify<FallbackSaveLoader, CCApplication> {
    GEODE_FORWARD_COMPAT_ENABLE_HOOKS("")
    void gameDidSave() {
        saveModData();
        return CCApplication::gameDidSave();
    }
};

#endif

#ifdef GEODE_IS_ANDROID

#include <Geode/modify/FileOperation.hpp>
#include <Geode/loader/Dirs.hpp>

// redirects the save path to what geode knows, in case launcher's fopen hook fails
struct FileOperationOverride : Modify<FileOperationOverride, FileOperation> {
    static gd::string getFilePath() {
        return utils::string::pathToString(dirs::getSaveDir()) + "/";
    }
};

#endif

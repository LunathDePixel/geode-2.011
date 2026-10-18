#pragma once

#include <Geode/ui/General.hpp>
#include <Geode/ui/ScrollLayer.hpp>
#include <Geode/ui/TextArea.hpp>
#include <Geode/ui/IconButtonSprite.hpp>
#include <Geode/ui/NineSlice.hpp>
#ifndef GEODE_IS_WINDOWS32  // GD 2.011 port: SetIDPopup / SetTextPopup are 2.2-only
#include <Geode/binding/SetTextPopupDelegate.hpp>
#include <Geode/binding/SetIDPopupDelegate.hpp>
#endif
#include <Geode/cocos/cocoa/CCObject.h>
#include "list/ModItem.hpp"
#include "list/ModList.hpp"
#include "sources/ModListSource.hpp"
#include "UpdateModListState.hpp"
#include <server/DownloadManager.hpp>
#include <Geode/loader/Setting.hpp>

using namespace geode::prelude;

class ModsStatusNode : public CCNode {
protected:
    enum class DownloadState {
        None,
        SomeCancelled,
        AllDone,
        SomeErrored,
        SomeToBeConfirmed,
        SomeFetching,
        SomeDownloading,
    };

    NineSlice* m_statusBG;
    CCLabelBMFont* m_status;
    CCLabelBMFont* m_statusPercentage;
    Slider* m_progressBar;
    CCNode* m_loadingCircle;
    CCMenu* m_btnMenu;
    CCMenuItemSpriteExtra* m_viewBtn;
    CCMenuItemSpriteExtra* m_cancelBtn;
    CCMenuItemSpriteExtra* m_restartBtn;
    ListenerHandle m_updateStateHandle;
    ListenerHandle m_downloadHandle;
    DownloadState m_lastState = DownloadState::None;
    ListenerHandle m_settingNodeHandle;

    bool init();
    void updateState();

    void onRestart(CCObject*);
    void onViewErrors(CCObject*);
    void onConfirm(CCObject*);
    void onCancel(CCObject*);

public:
    static ModsStatusNode* create();
};

class ModsLayer : public CCLayer GEODE_WINDOWS64(, public SetIDPopupDelegate) GEODE_ANDROID(, public SetIDPopupDelegate) GEODE_MACOS(, public SetIDPopupDelegate) GEODE_IOS(, public SetIDPopupDelegate) {
protected:
    CCNode* m_frame;
    std::vector<CCMenuItemSpriteExtra*> m_tabs;
    ModListSource* m_currentSource = nullptr;
    std::unordered_map<ModListSource*, Ref<ModList>> m_lists;
    CCMenu* m_pageMenu;
    CCLabelBMFont* m_pageLabel;
    CCMenuItemSpriteExtra* m_goToPageBtn;
    ModsStatusNode* m_statusNode;
    ListenerHandle m_updateStateHandle;
    bool m_showSearch = true;
    std::vector<CCMenuItemSpriteExtra*> m_displayBtns;
    ModListDisplay m_modListDisplay;

    bool init();

    void keyDown(enumKeyCodes key, double) override;
    void keyBackClicked() override;
#ifndef GEODE_IS_WINDOWS32
    void setIDPopupClosed(SetIDPopup*, int value) override;
#endif

    void onTab(CCObject* sender);
    void onOpenModsFolder(CCObject*);
    void onAddModFromFile(CCObject*);
    void onRestartGD(CCObject*);
    void onDisplay(CCObject*);
    void onSearch(CCObject*);
    void onGoToPage(CCObject*);
    void onRefreshList(CCObject*);
    void onTheme(CCObject*);
    void onSettings(CCObject*);
    void onKeybinds(CCObject*);
    void onBack(CCObject*);

    void updateState();

public:
    static ModsLayer* create();
    static ModsLayer* scene();

    static server::ServerFuture<InstalledModsUpdateCheck> checkInstalledModsForUpdates();
    static void installModFromFile();

    void gotoTab(ModListSource* src, bool searchingDev = false);
    void refreshList();

public:
    // GD 2.011 port: target of the Geode-made "Go to Page" popup (2.0 has no SetIDPopup)
    void goToPage2011(int page);
};

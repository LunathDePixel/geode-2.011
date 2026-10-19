// geode additions to make stl containers easier
// clang-format off
class GDString {
    void winDtor() = win 0xbcc0;
    GDString& winAssign(GDString const&, size_t, size_t) = win 0xbd00;
    GDString& winAssign(char const*) = win 0xbc60;
    GDString& winAssign(char const*, size_t) = win 0xbe20;

    static uintptr_t macEmptyContainer() {
        return geode::base::get() + 0x6030d0;
    }
    void macCtor(char const*) = mac 0x489fc0;
    void macCtor(GDString const&) = mac 0x489fcc;
    GDString& macAssign(char const*) = mac 0x489f96;
    GDString& macAssign(GDString const&) = mac 0x489f9c;
    void macDestroy() = mac 0x489f78;
}

void testFunction(int a) = mac 0x100000;

class AchievementBar : cocos2d::CCNode {
    static AchievementBar* create(const char* title, const char* desc, const char* icon) = win 0x37160;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x25610;  // 2.0 slot (getTargetScene, types unknown)
    virtual void setTargetScene(cocos2d::CCNode*) = win 0x25620;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    PAD = win 0xc;
}

class AchievementCell : TableViewCell {
    void loadFromDict(cocos2d::CCDictionary*) = mac 0x10eaa0, win 0x46dd0;

    virtual bool init() = win 0xd720;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class AchievementManager : cocos2d::CCNode {
    void getAllAchievements() = mac 0x434d60;
    static AchievementManager* sharedState() = mac 0x424420, win 0x68d0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x6680;  // 2.0 slot (getReportedAchievements, types unknown)
    virtual void setReportedAchievements(cocos2d::CCDictionary*) = win 0x6690;
    virtual void gd20_slot_109() = win 0x66d0;  // 2.0 slot (getDontNotifyAch, types unknown)
    virtual void setDontNotifyAch(bool) = win 0x66e0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    PAD = win 0xc;
    cocos2d::CCDictionary* m_achievements;  // 2.011 +0xf4 (voted)
    PAD = win 0x4;
}


class AchievementNotifier : cocos2d::CCNode {
    void notifyAchievement(const char* title, const char* desc, const char* icon);  // GD 2.011 port: inline body needs m_currentAchievement (no 2.0 offset)


    static AchievementNotifier* sharedState() = mac 0x464e00, win 0xc270;
    void willSwitchToScene(cocos2d::CCScene*) = mac 0x4650b0, win 0xc480;
    void showNextAchievement() = mac 0x464f10, ios 0x13f508, win 0xc340;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    PAD = win 0x4;
    cocos2d::CCArray* m_queue;  // 2.011 +0xec (voted)
}

class AchievementsLayer : GJDropDownLayer {
    void customSetup() = mac 0x1bdea0, win 0x37f20;
    void loadPage(int) = mac 0x1be190, win 0x38220;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class AnimatedGameObject : GameObject, AnimatedSpriteDelegate {
    void playAnimation(int) = mac 0xc93d0;
    void updateChildSpriteColor(cocos2d::_ccColor3B) = mac 0xc8450, win 0x19db60;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

// GD 2.011 port: 2.1-only class, stub
class AnimatedShopKeeper {
}

class AnimatedSpriteDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void animationFinished(const char*) {}
}

class AppDelegate : cocos2d::CCApplication, cocos2d::CCSceneDelegate {
    void bgScale() = mac 0x3aaab0;
    virtual bool applicationDidFinishLaunching() = mac 0x3aa900, win 0x38870;
    virtual void applicationDidEnterBackground() = mac 0x3aabe0, win 0x38bc0;
    virtual void applicationWillEnterForeground() = mac 0x3aac80, win 0x38db0;
    virtual void applicationWillBecomeActive() = mac 0x3aab30, win 0x38b20;
    virtual void applicationWillResignActive() = mac 0x3aab50, win 0x38bb0;
    virtual void trySaveGame() = mac 0x3aaf10, ios 0x1a28f0, win 0x392a0;
    virtual void willSwitchToScene(cocos2d::CCScene*) = mac 0x3aaf40, win 0x39350;
    static AppDelegate* get() {
        return static_cast<AppDelegate*>(cocos2d::CCApplication::sharedApplication());
    }
    bool musicTest();
    void pauseGame() = mac 0x3aab60, win 0x39060;
    void resumeSound();
    void setupGLView() = win 0x38610;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_27() = win 0x384b0;  // 2.0 slot (getPaused, types unknown)
    virtual void setPaused(bool) = win 0x384c0;
    virtual void gd20_slot_29() = win 0x384d0;  // 2.0 slot (getScenePointer, types unknown)
    virtual void setScenePointer(cocos2d::CCNode*) = win 0x384e0;
    virtual void gd20_slot_31() = win 0x384f0;  // 2.0 slot (getLoadingFinished, types unknown)
    virtual void gd20_slot_32() = win 0x38500;  // 2.0 slot (getManagersLoaded, types unknown)
    virtual void setManagersLoaded(bool) = win 0x38510;
    virtual void gd20_slot_34() = win 0x38520;  // 2.0 slot, name unknown
    virtual void gd20_slot_35() = win 0x38530;  // 2.0 slot, name unknown
    virtual void gd20_slot_36() = win 0x38540;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x9c ----
    bool m_unk0;  // 2.011 +0x9c (voted)
    bool m_unk1;  // 2.011 +0x9d (interpolated)
    PAD = win 0x2;
    cocos2d::CCScene* m_runningScene;  // 2.011 +0xa0 (interpolated)
    bool m_loadingFinished;  // 2.011 +0xa4 (accessor)
}

// GD 2.011 port: 2.1-only class, stub
class ArtistCell {
}

class AudioEffectsLayer : cocos2d::CCLayerColor {
    void audioStep(float) = mac 0x271f40, win 0x39770;
    static AudioEffectsLayer* create(gd::string) = mac 0x271a00, win 0x39520;
    void resetAudioVars() = mac 0x271ee0, win 0x39710;
    void goingDown() = win 0x39a20;
    virtual void updateTweenAction(float, const char*) = win 0x39950;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_128() = win 0x39420;  // 2.0 slot, name unknown
    virtual void gd20_slot_129() = win 0x1ef10;  // 2.0 slot (getRainActive, types unknown)
    virtual void setRainActive(bool) = win 0x1ef20;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x194 ----
    int m_unk198;  // 2.011 +0x194 (same own size)
    cocos2d::CCArray* m_unk19C;  // 2.011 +0x198 (same own size)
    cocos2d::CCArray* m_unk1A0;  // 2.011 +0x19c (same own size)
    float m_unk1A4;  // 2.011 +0x1a0 (same own size)
    float m_unk1A8;  // 2.011 +0x1a4 (same own size)
    bool m_unk1AC;  // 2.011 +0x1a8 (same own size)
    PAD = win 0x3;
    float m_unk1B0;  // 2.011 +0x1ac (same own size)
    bool m_unk1B4;  // 2.011 +0x1b0 (same own size)
    PAD = win 0x3;
}

class BoomListView : cocos2d::CCLayer, TableViewDelegate, TableViewDataSource {
    BoomListView() {}
    ~BoomListView() {
        CC_SAFE_RELEASE(m_entries);
    }

    static BoomListView* create(cocos2d::CCArray*, float, float, int, BoomListType) = mac 0x18ecb0;
    bool init(cocos2d::CCArray*, float, float, int, BoomListType) = mac 0x18ee00, ios 0x12c5a8, win 0xd2d0;
    virtual void draw() {}
    virtual void TableViewWillDisplayCellForRowAtIndexPath(CCIndexPath&, TableViewCell*, TableView*) {}
    virtual float cellHeightForRowAtIndexPath(CCIndexPath&, TableView*) = mac 0x18f070, win 0xd500;
    virtual void didSelectRowAtIndexPath(CCIndexPath&, TableView*) {}
    virtual int numberOfRowsInSection(unsigned int, TableView*) = mac 0x18f0b0, win 0xd510;
    virtual unsigned int numberOfSectionsInTableView(TableView*) = mac 0x18f0e0, win 0xd070;
    virtual TableViewCell* cellForRowAtIndexPath(CCIndexPath&, TableView*) = mac 0x18f100, win 0xd520;
    virtual void TableViewCommitCellEditingStyleForRowAtIndexPath(TableView*, TableViewCellEditingStyle, CCIndexPath&) {}
    virtual void TableViewWillReloadCellForRowAtIndexPath(CCIndexPath&, TableViewCell*, TableView*) {}
    inline bool init(cocos2d::CCArray* entries, BoomListType type, float width, float height) {
        return this->init(entries, height, width, 0, type);
    }

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    virtual void setupList() = mac 0x18ef90, win 0xd470;
    virtual TableViewCell* getListCell(const char*) = mac 0x18f200, win 0xd580;
    virtual void loadCell(TableViewCell*, int) = mac 0x18f4a0, win 0xd6a0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x120 ----
    TableView* m_tableView;  // 2.011 +0x120 (manual)
    cocos2d::CCArray* m_entries;  // 2.011 +0x124 (manual)
    BoomListType m_type;  // 2.011 +0x128 (voted)
    float m_height;  // 2.011 +0x12c (interpolated)
    float m_width;  // 2.011 +0x130 (interpolated)
    float m_itemSeparation;  // 2.011 +0x134 (voted)
    int m_currentPage;  // 2.011 +0x138 (manual)
}

class BoomScrollLayer : cocos2d::CCLayer {
    BoomScrollLayer() = mac 0x1e42f0, win 0xdba0;
    void instantMoveToPage(int page) = win 0xeb50;
    void moveToPage(int page) = win 0xec20;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_125() = win 0xdd50;  // 2.0 slot, name unknown
    virtual void gd20_slot_126() = win 0xdd60;  // 2.0 slot (getScrollArea, types unknown)
    virtual void setScrollArea(cocos2d::CCRect) = win 0xdd80;
    virtual void gd20_slot_128() = win 0xdda0;  // 2.0 slot (getMinTouchSpeed, types unknown)
    virtual void gd20_slot_129() = win 0xddb0;  // 2.0 slot, name unknown
    virtual void gd20_slot_130() = win 0xddd0;  // 2.0 slot (getTouchSpeedFast, types unknown)
    virtual void gd20_slot_131() = win 0xdde0;  // 2.0 slot, name unknown
    virtual void gd20_slot_132() = win 0xde00;  // 2.0 slot (getTouchSpeedMid, types unknown)
    virtual void gd20_slot_133() = win 0xde10;  // 2.0 slot, name unknown
    virtual void gd20_slot_134() = win 0xde30;  // 2.0 slot (getDelegate, types unknown)
    virtual void gd20_slot_135() = win 0xde40;  // 2.0 slot, name unknown
    virtual void gd20_slot_136() = win 0xde50;  // 2.0 slot (getMovingToPage, types unknown)
    virtual void gd20_slot_137() = win 0xde60;  // 2.0 slot (getDelegate, types unknown)
    virtual void setOnlyShowOnePage(bool) = win 0xde70;
    virtual void gd20_slot_139() = win 0xde80;  // 2.0 slot (getOnlyShowOnePage, types unknown)
    virtual void setMinimumTouchLengthToSlide(float) = win 0xde90;
    virtual void gd20_slot_141() = win 0xdeb0;  // 2.0 slot (getMinimumTouchLengthToSlide, types unknown)
    virtual void setMinimumTouchLengthToChangePage(float) = win 0xdec0;
    virtual void gd20_slot_143() = win 0xdee0;  // 2.0 slot (getMinimumTouchLengthToChangePage, types unknown)
    virtual void setMarginOffset(float) = win 0xdef0;
    virtual void gd20_slot_145() = win 0xdf10;  // 2.0 slot (getMarginOffset, types unknown)
    virtual void setStealTouches(bool) = win 0xdf20;
    virtual void gd20_slot_147() = win 0xdf30;  // 2.0 slot (getStealTouches, types unknown)
    virtual void setShowPagesIndicator(bool) = win 0xdf40;
    virtual void gd20_slot_149() = win 0xdf50;  // 2.0 slot (getShowPagesIndicator, types unknown)
    virtual void setPagesIndicatorSelectedColor(cocos2d::ccColor4B) = win 0xdf70;
    virtual void gd20_slot_151() = win 0xdf80;  // 2.0 slot (getPagesIndicatorSelectedColor, types unknown)
    virtual void setPagesIndicatorNormalColor(cocos2d::ccColor4B) = win 0xdfa0;
    virtual void gd20_slot_153() = win 0xdfb0;  // 2.0 slot (getPagesIndicatorNormalColor, types unknown)
    virtual void gd20_slot_154() = win 0xdfc0;  // 2.0 slot (getPagesWidthOffset, types unknown)
    virtual void gd20_slot_155() = win 0xdfd0;  // 2.0 slot, name unknown
    virtual void gd20_slot_156() = win 0xdff0;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x118 ----
    PAD = win 0x88;
    int m_page;  // 2.011 +0x1a0 (voted)
}

class ButtonSprite : cocos2d::CCSprite {
    static ButtonSprite* create(
        const char* caption,
        int width,
        int unknown,
        float scale,
        bool absoluteWidth,
        const char* font,
        const char* texture,
        float height
    ) = mac 0x4fa90, ios 0x38c7c, win 0xffa0;

    static ButtonSprite* create(
        cocos2d::CCSprite* topSprite,
        int width,
        int unknown,
        float height,
        float scale,
        bool absoluteWidth,
        const char* texture,
        bool bUnknown
    ) = mac 0x4f1d0, win 0xfc80;

    // Create a ButtonSprite with a top sprite and a texture.
    // @param topSprite The top sprite to add on top of the sprite
    // @param width Sprite width; ignored if `absolute` is false
    // @param absolute Whether to use absolute width or not
    // @param texture The name of the background sprite file (can't be in a spritesheet)
    // @param height The height of the button, leave 0 for automatic
    // @param scale Scale of top sprite
    static ButtonSprite* create(
        cocos2d::CCSprite* topSprite,
        int width,
        bool absolute,
        float height,
        const char* texture,
        float scale
    ) {
        return create(topSprite, width, 0, height, scale, absolute, texture, true);
    }

    // Create a ButtonSprite with text, a font and a texture.
    // @param caption The text of the ButtonSprite
    // @param width Sprite width; ignored if `absolute` is false
    // @param absolute Whether to use absolute width or not
    // @param font The name of the BM font file to use
    // @param texture The name of the background sprite file (can't be in a spritesheet)
    // @param height The height of the button, leave 0 for automatic
    // @param scale Scale of text
    // @returns Pointer to the created ButtonSprite, or nullptr on error
    static ButtonSprite* create(const char* caption, int width, bool absolute, const char* font, const char* texture, float height, float scale) {
        return create(caption, width, 0, scale, absolute, font, texture, height);
    }

    static ButtonSprite* create(char const* caption) {
        return ButtonSprite::create(caption, 0, 0, "goldFont.fnt", "GJ_button_01.png", .0f, 1.f);
    }
    static ButtonSprite* create(char const* caption, const char* font, const char* texture) {
        return ButtonSprite::create(caption, 0, 0, font, texture, .0f, 1.f);
    }
    static ButtonSprite* create(char const* caption, const char* font, const char* texture, float scale) {
        return ButtonSprite::create(caption, 0, 0, font, texture, .0f, scale);
    }
    static ButtonSprite* create(char const*, int, int, float, bool) = mac 0x4fa40;
    void updateBGImage(const char*) = mac 0x502d0, win 0x102c0;
    static ButtonSprite* create(char const*, float) = mac 0x4fa60;
    void setString(const char* txt) = mac 0x4fec0, win 0x10800;
    void updateSpriteBGSize() = mac 0x4f5d0, win 0x103d0;
    void setColor(cocos2d::ccColor3B color) = mac 0x50410, win 0x10bb0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_133() = win 0xfbe0;  // 2.0 slot, name unknown
    virtual void gd20_slot_134() = win 0xfbf0;  // 2.0 slot, name unknown
    virtual void gd20_slot_135() = win 0xfc00;  // 2.0 slot, name unknown
    virtual void gd20_slot_136() = win 0xfc10;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1b8 ----
    PAD = win 0x18;
    cocos2d::CCLabelBMFont* m_label;  // 2.011 +0x1d0 (consistent evidence)
    cocos2d::CCSprite* m_subSprite;  // 2.011 +0x1d4 (consistent evidence)
    cocos2d::CCSprite* m_subBGSprite;  // 2.011 +0x1d8 (consistent evidence)
    cocos2d::extension::CCScale9Sprite* m_BGSprite;  // 2.011 +0x1dc (consistent evidence)
    PAD = win 0x8;
    cocos2d::CCPoint m_spritePosition;  // 2.011 +0x1e8 (consistent evidence)
    PAD = win 0x18;
}

class CCAnimatedSprite : cocos2d::CCSprite {
    void runAnimation(gd::string) = mac 0x1a6430, win 0x118a0;
    void tweenToAnimation(gd::string, float) = mac 0x1a65b0, win 0x119c0;
    static CCAnimatedSprite* createWithType(const char* file) = win 0x10ea0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_133() = win 0x11d40;  // 2.0 slot, name unknown
    virtual void animationFinished(const char*) = win 0x11d10;
    virtual void gd20_slot_135() = win 0x10ce0;  // 2.0 slot (animationFinishedO, types unknown)
    virtual void gd20_slot_136() = win 0x10d20;  // 2.0 slot, name unknown
    virtual void gd20_slot_137() = win 0x10d30;  // 2.0 slot (getSprite, types unknown)
    virtual void setSprite(cocos2d::CCSprite*) = win 0x10d40;
    virtual void gd20_slot_139() = win 0x10d50;  // 2.0 slot (getNormalSprite, types unknown)
    virtual void setNormalSprite(cocos2d::CCSprite*) = win 0x10d60;
    virtual void gd20_slot_141() = win 0x10d70;  // 2.0 slot (getAnimatedSprite, types unknown)
    virtual void gd20_slot_142() = win 0x10d80;  // 2.0 slot (setAnimatedSprite, types unknown)
    virtual void gd20_slot_144() = win 0x10da0;  // 2.0 slot (getDefaultAnimation, types unknown)
    virtual void gd20_slot_143() = win 0x10d90;  // 2.0 slot (getDefaultAnimation, types unknown)
    virtual void setDefaultAnimation(gd::string) = win 0x10de0;
    virtual void gd20_slot_146() = win 0x10e50;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(AnimatedSpriteDelegate*) = win 0x10e60;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1b8 ----
    gd::string m_unknown1;  // 2.011 +0x1b8 (consistent evidence)
    gd::string m_unknown2;  // 2.011 +0x1d0 (consistent evidence)
    PAD = win 0x14;
    gd::string m_unknown3;  // 2.011 +0x1fc (consistent evidence)
}

class CCAnimateFrameCache : cocos2d::CCObject {
    static CCAnimateFrameCache* sharedSpriteFrameCache() = mac 0x2e4df0, win 0x121f0;
    void addSpriteFramesWithFile(const char* file) = win 0x122b0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x18 ----
    cocos2d::CCDictionary* m_unknown1;  // 2.011 +0x18 (same own size)
    cocos2d::CCDictionary* m_unknown2;  // 2.011 +0x1c (same own size)
    cocos2d::CCDictionary* m_unknown3;  // 2.011 +0x20 (same own size)
}

class CCBlockLayer : cocos2d::CCLayerColor {
    inline CCBlockLayer() {}
    virtual bool init() = mac 0x2a59c0, win 0x131f0;
    virtual void draw() = mac 0x2a5c20, win 0x133a0; // same as GJDropDownLayer
    virtual void registerWithTouchDispatcher() = mac 0x2a5ad0, win 0x132b0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void customSetup() = win 0x6320;
 // shared with many
    virtual void enterLayer() = mac 0x2a5aa0, win 0x13290;
    virtual void exitLayer() = mac 0x2a5b40, win 0x13300;
 // same as PauseLayer, EditorPauseLayer
    virtual void showLayer(bool) = mac 0x2a5b90, win 0x13340;
 // same as PauseLayer, EditorPauseLayer
    virtual void hideLayer(bool) = mac 0x2a5ba0, win 0x13350;
 // same as PauseLayer, EditorPauseLayer
    virtual void layerVisible() = mac 0x2a5bc0, win 0x13360;
 // same as GJDropDownLayer
    virtual void layerHidden() = mac 0x2a5be0, win 0x13370;
 // same as PauseLayer, EditorPauseLayer
    virtual void enterAnimFinished() {}
    virtual void disableUI() {}
    virtual void enableUI() {}
    virtual void gd20_slot_138() = win 0x130e0;  // 2.0 slot (getRemoveOnExit, types unknown)
    virtual void setRemoveOnExit(bool) = win 0x130f0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x194 ----
    bool m_unknown;  // 2.011 +0x194 (same own size)
    bool m_unknown2;  // 2.011 +0x195 (same own size)
    PAD = win 0x2;
}

class CCCircleWave : cocos2d::CCNode {
    static CCCircleWave* create(float, float, float, bool) = mac 0xbd270;
    static CCCircleWave* create(float, float, float, bool, bool) = mac 0xbd290, win 0x136e0;
    bool init(float, float, float, bool, bool) = mac 0xbd380, win 0x137b0;
    void followObject(cocos2d::CCNode*, bool) = mac 0xbd670, win 0x139f0;
    callback void updatePosition(float) = mac 0xbd630, win 0x139b0;
    virtual void setPosition(cocos2d::CCPoint const& pos) = mac 0xbd600;
    virtual void removeMeAndCleanup() = mac 0xbdac0, win 0x13d70;
    virtual void draw() = mac 0xbd960, win 0x13bf0;
    virtual void updateTweenAction(float dt, const char* key) = mac 0xbd960, win 0x13a70;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x134a0;  // 2.0 slot (getWidth, types unknown)
    virtual void setWidth(float) = win 0x134b0;
    virtual void gd20_slot_109() = win 0x134d0;  // 2.0 slot (getRadius, types unknown)
    virtual void setRadius(float) = win 0x134e0;
    virtual void gd20_slot_111() = win 0x13500;  // 2.0 slot (getOpacity, types unknown)
    virtual void setOpacity(float) = win 0x13510;
    virtual void gd20_slot_113() = win 0x13530;  // 2.0 slot (getColor, types unknown)
    virtual void setColor(cocos2d::ccColor3B) = win 0x13550;
    virtual void gd20_slot_115() = win 0x13570;  // 2.0 slot, name unknown
    virtual void gd20_slot_116() = win 0x13590;  // 2.0 slot, name unknown
    virtual void gd20_slot_117() = win 0x135b0;  // 2.0 slot (getCircleMode, types unknown)
    virtual void gd20_slot_118() = win 0x135c0;  // 2.0 slot (setCircleMode, types unknown)
    virtual void gd20_slot_119() = win 0x135d0;  // 2.0 slot (getLineWidth, types unknown)
    virtual void setLineWidth(int) = win 0x135e0;
    virtual void gd20_slot_121() = win 0x135f0;  // 2.0 slot (getOpacityMod, types unknown)
    virtual void setOpacityMod(float) = win 0x13600;
    virtual void gd20_slot_123() = win 0x13620;  // 2.0 slot (getBlendAdditive, types unknown)
    virtual void setBlendAdditive(bool) = win 0x13630;
    virtual void gd20_slot_125() = win 0x13640;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(CCCircleWaveDelegate*) = win 0x13650;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    cocos2d::CCNode* m_child;  // 2.011 +0xe8 (consistent evidence)
    PAD = win 0x4;
    float m_currentRadius;  // 2.011 +0xf0 (consistent evidence)
    float m_currentOpacity;  // 2.011 +0xf4 (consistent evidence)
    cocos2d::ccColor3B m_color;  // 2.011 +0xf8 (consistent evidence)
    PAD = win 0x1;
    cocos2d::CCPoint m_circleCenter;  // 2.011 +0xfc (consistent evidence)
    int m_filled;  // 2.011 +0x104 (consistent evidence)
    int m_lineWidth;  // 2.011 +0x108 (consistent evidence)
    float m_opacityMultiplier;  // 2.011 +0x10c (consistent evidence)
    bool m_blendFuncDirty;  // 2.011 +0x110 (consistent evidence)
    PAD = win 0x7;
}

class CCCircleWaveDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void circleWaveWillBeRemoved(CCCircleWave* wave) {}
}

class CCContentLayer : cocos2d::CCLayerColor {
    inline CCContentLayer() {}
    static CCContentLayer* create(cocos2d::ccColor4B const& color, float width, float height) = win 0x13d90;
    virtual void setPosition(cocos2d::CCPoint const& pos) = mac 0x464c60, win 0x13ef0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class CCIndexPath : cocos2d::CCObject {
    static CCIndexPath* CCIndexPathWithSectionRow(int idk1, int idk2) = win 0x2ce90;
    inline CCIndexPath() = default;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x18 ----
    int m_unknown1;  // 2.011 +0x18 (same own size)
    int m_unknown2;  // 2.011 +0x1c (same own size)
}

class CCLightFlash : cocos2d::CCNode {
    static CCLightFlash* create() = mac 0x295870;
    void playEffect(cocos2d::CCPoint, cocos2d::_ccColor3B, float, float, float, float, float, float, float, float, float, float, float, float, float, float, int, bool, bool, float) = mac 0x295900, win 0x14240;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x6680;  // 2.0 slot (getFlashP, types unknown)
    virtual void setFlashP(cocos2d::CCNode*) = win 0x14000;
    virtual void gd20_slot_109() = win 0x14010;  // 2.0 slot (getFlashZ, types unknown)
    virtual void setFlashZ(int) = win 0x14020;
}

class CCMenuItemSpriteExtra : cocos2d::CCMenuItemSprite {
    // GD 2.011 port (v3): 2.2's updateSprite, fit the item to its (re)scaled normal image
    void updateSprite() {
        auto spr = this->getNormalImage();
        if (!spr) return;
        auto size = spr->getScaledContentSize();
        spr->setAnchorPoint({ .5f, .5f });
        spr->setPosition(size / 2);
        this->setContentSize(size);
    }
    void useAnimationType(MenuAnimationType type);  // GD 2.011 port: inline body needs m_animationType, m_startPosition (no 2.0 offset)

    void setDestination(cocos2d::CCPoint const& pos);  // GD 2.011 port: inline body needs m_destPosition (no 2.0 offset)

    void setOffset(cocos2d::CCPoint const& pos);  // GD 2.011 port: inline body needs m_offset (no 2.0 offset)

    void setScale(float scale) {
        this->CCMenuItemSprite::setScale(scale);
        m_baseScale = scale;
    }

    static CCMenuItemSpriteExtra* create(cocos2d::CCNode*, cocos2d::CCNode*, cocos2d::CCObject*, cocos2d::SEL_MenuHandler) = mac 0x1253c0, ios 0xe0740, win 0x15900;
    inline static CCMenuItemSpriteExtra* create(cocos2d::CCNode* sprite, cocos2d::CCObject* target, cocos2d::SEL_MenuHandler callback) {
        return CCMenuItemSpriteExtra::create(sprite, nullptr, target, callback);
    }
    void setSizeMult(float) = mac 0x1255e0, win 0x15ad0;
    CCMenuItemSpriteExtra() = mac 0x32670, win 0x156e0;
    ~CCMenuItemSpriteExtra() = win 0x156e0;
    bool init(
        cocos2d::CCNode* normalImage,
        cocos2d::CCNode* selectedImage,
        cocos2d::CCObject* target,
        cocos2d::SEL_MenuHandler callback
    ) {
        if (!cocos2d::CCMenuItemSprite::initWithNormalSprite(
            normalImage, selectedImage, nullptr, target, callback
        )) return false;

        this->setAnchorPoint({ .5f, .5f });
        this->setContentSize(normalImage->getScaledContentSize());
        normalImage->setPosition(m_obContentSize / 2);

        m_baseScale = 1.f;
        m_animationEnabled = true;
        m_scaleMultiplier = 1.26f;

        return true;
    }
    void activate() = mac 0x125730, win 0x15c10;
    void selected() = mac 0x125840, win 0x15cc0;
    void unselected() = mac 0x125a70, win 0x15d70;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_122() = win 0x14f50;  // 2.0 slot (getScaleVar, types unknown)
    virtual void setScaleVar(float) = win 0x14f60;
    virtual void gd20_slot_124() = win 0x15740;  // 2.0 slot (getOriginalScale, types unknown)
    virtual void setOriginalScale(float) = win 0x15750;
    virtual void gd20_slot_126() = win 0x15770;  // 2.0 slot (getShouldAnimate, types unknown)
    virtual void setShouldAnimate(bool) = win 0x15780;
    virtual void gd20_slot_128() = win 0x15790;  // 2.0 slot (getDarkenClick, types unknown)
    virtual void setDarkenClick(bool) = win 0x157a0;
    virtual void gd20_slot_130() = win 0x157b0;  // 2.0 slot (getVolume, types unknown)
    virtual void setVolume(float) = win 0x157c0;
    virtual void gd20_slot_132() = win 0x157e0;  // 2.0 slot (getClickSound, types unknown)
    virtual void setClickSound(gd::string) = win 0x15820;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x114 ----
    float m_scaleMultiplier;  // 2.011 +0x114 (manual)
    float m_baseScale;  // 2.011 +0x118 (manual)
    bool m_animationEnabled;  // 2.011 +0x11c (manual)
    bool m_colorEnabled;  // 2.011 +0x11d (manual)
    PAD = win 0x2;
    float m_colorDip;  // 2.011 +0x120 (manual)
    gd::string m_unknown2;  // 2.011 +0x124 (manual)
}

class CCMenuItemToggler : cocos2d::CCMenuItem {
    // GD 2.011 port (v3): 2.2's updateSprite
    void updateSprite() {
        m_offButton->updateSprite();
        m_onButton->updateSprite();
        auto size = m_offButton->getContentSize();
        this->setContentSize(size);
        m_offButton->setPosition(size / 2);
        m_onButton->setPosition(size / 2);
    }
    inline CCMenuItemToggler() : CCMenuItem(), m_onButton(nullptr), m_offButton(nullptr), m_toggled(false), m_notClickable(false) {}

    static CCMenuItemToggler* createWithSize(const char* spr1, const char* spr2, cocos2d::CCObject* target, cocos2d::SEL_MenuHandler callback, float scale) {
        auto sprOff = cocos2d::CCSprite::createWithSpriteFrameName(spr1);
        auto sprOn = cocos2d::CCSprite::createWithSpriteFrameName(spr2);
    
        sprOff->setScale(scale);
        sprOn->setScale(scale);
    
        return create(sprOff, sprOn, target, callback);
    }
    static CCMenuItemToggler* createWithStandardSprites(cocos2d::CCObject* target, cocos2d::SEL_MenuHandler callback, float scale) {
        auto sprOff = cocos2d::CCSprite::createWithSpriteFrameName("GJ_checkOff_001.png");
        auto sprOn = cocos2d::CCSprite::createWithSpriteFrameName("GJ_checkOn_001.png");
    
        sprOff->setScale(scale);
        sprOn->setScale(scale);
    
        return create(sprOff, sprOn, target, callback);
    }
    bool isOn() {
        return m_toggled;
    }
    bool isToggled() {
        return m_toggled;
    }
    void setClickable(bool on) {
        m_notClickable = !on;
    }
    void toggleWithCallback(bool on) {
        this->activate();
        this->toggle(on);
    }

    static CCMenuItemToggler* create(cocos2d::CCNode* offSpr, cocos2d::CCNode* onSpr, cocos2d::CCObject* target, cocos2d::SEL_MenuHandler callback) = mac 0x38400, ios 0xf5594, win 0x15e40;
    void setSizeMult(float) = mac 0x38a40;
    void toggle(bool) = mac 0x38950, ios 0xf5848, win 0x16190;
    bool init(cocos2d::CCNode* off, cocos2d::CCNode* on, cocos2d::CCObject* target, cocos2d::SEL_MenuHandler handler) {
        return this->initWithTarget(target, handler) && this->init(off, on);
    }
    bool init(cocos2d::CCNode* off, cocos2d::CCNode* on) = win 0x15f30;
    void activate() = mac 0x38bc0, ios 0xf59ac, win 0x160b0;
    void selected() = mac 0x38b80, win 0x16080;
    void unselected() = mac 0x38c00, win 0x160e0;
    void setEnabled(bool enabled) = mac 0x38c40, win 0x16110;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_115() = win 0x135d0;  // 2.0 slot, name unknown
    virtual void gd20_slot_116() = win 0x15e00;  // 2.0 slot, name unknown
    virtual void gd20_slot_117() = win 0x13620;  // 2.0 slot, name unknown
    virtual void gd20_slot_118() = win 0x14f30;  // 2.0 slot (getDontToggle, types unknown)
    virtual void setDontToggle(bool) = win 0x14f40;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x108 ----
    CCMenuItemSpriteExtra* m_offButton;  // 2.011 +0x108 (same own size)
    CCMenuItemSpriteExtra* m_onButton;  // 2.011 +0x10c (same own size)
    bool m_toggled;  // 2.011 +0x110 (same own size)
    bool m_notClickable;  // 2.011 +0x111 (same own size)
    PAD = win 0x2;
}

class CCMoveCNode : cocos2d::CCNode {
    static CCMoveCNode* create() = mac 0x1842a0, win 0xcb960;
    ~CCMoveCNode() = mac 0x18b2c0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    PAD = win 0x8;
}

class GroupCommandObject : cocos2d::CCNode {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0xc2c40;  // 2.0 slot (getTarget, types unknown)
    virtual void setTarget(cocos2d::CCPoint) = win 0xc2c60;
    virtual void gd20_slot_109() = win 0x25610;  // 2.0 slot (getEasing, types unknown)
    virtual void setEasing(int) = win 0x25620;
    virtual void gd20_slot_111() = win 0x13500;  // 2.0 slot (getDuration, types unknown)
    virtual void setDuration(float) = win 0x13510;
    virtual void gd20_slot_113() = win 0x247c0;  // 2.0 slot (getDeltaTime, types unknown)
    virtual void setDeltaTime(float) = win 0x247d0;
    virtual void gd20_slot_115() = win 0x211c0;  // 2.0 slot (getTargetGroupID, types unknown)
    virtual void setTargetGroupID(int) = win 0xc2c80;
    virtual void gd20_slot_117() = win 0xc2c90;  // 2.0 slot (getValue, types unknown)
    virtual void setValue(cocos2d::CCPoint) = win 0xc2cb0;
    virtual void gd20_slot_119() = win 0xc2cd0;  // 2.0 slot (getDeltaValue, types unknown)
    virtual void setDeltaValue(cocos2d::CCPoint) = win 0xc2cf0;
    virtual void gd20_slot_121() = win 0xc2d10;  // 2.0 slot (getTotalValue, types unknown)
    virtual void setTotalValue(cocos2d::CCPoint) = win 0xc2d30;
    virtual void gd20_slot_123() = win 0xc2d50;  // 2.0 slot (getIsFinished, types unknown)
    virtual void setIsFinished(bool) = win 0xc2d60;
    virtual void gd20_slot_125() = win 0xc2d70;  // 2.0 slot (getLastRound, types unknown)
    virtual void setLastRound(bool) = win 0xc2d80;
    virtual void gd20_slot_127() = win 0xc2d90;  // 2.0 slot (getLockX, types unknown)
    virtual void setLockX(bool) = win 0xc2da0;
    virtual void gd20_slot_129() = win 0xc2db0;  // 2.0 slot (getLockY, types unknown)
    virtual void setLockY(bool) = win 0xc2dc0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    PAD = win 0x10;
    int m_100;  // 2.011 +0xf8 (voted)
    PAD = win 0x1c;
    int m_124;  // 2.011 +0x118 (voted)
    PAD = win 0x8;
}

// GD 2.011 port: 2.1-only class, stub
class CCNodeContainer {
}

class CCScrollLayerExt : cocos2d::CCLayer {
    inline CCScrollLayerExt() {}

    static CCScrollLayerExt* create(cocos2d::CCRect rect, bool vertical) {
        auto pRet = new CCScrollLayerExt(rect);
        if (pRet) {
            pRet->autorelease();
            pRet->m_disableVertical = !vertical;
            pRet->m_disableHorizontal = vertical;
            pRet->m_cutContent = true;
            return pRet;
        }
        CC_SAFE_DELETE(pRet);
        return nullptr;
    }
    float getMinY() {
        return this->getContentSize().height -
            m_contentLayer->getContentSize().height -
            m_scrollLimitTop;
    }
    float getMaxY() {
        return m_scrollLimitBottom;
    }

    // todo: add this back when CCDestructor works and 
    // this no longer causes crashing
    // virtual ~CCScrollLayerExt() = mac 0x2359b0;
    virtual void visit() = mac 0x236550, win 0x18780;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x235ef0, win 0x18210;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x236300, win 0x18570;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x236020, win 0x18310;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x2362a0, win 0x18550;
    virtual void registerWithTouchDispatcher() = mac 0x235eb0, win 0x181e0;
    void moveToTop() = mac 0x235870, win 0x17ce0;
    void moveToTopWithOffset(float) = mac 0x2357d0, win 0x17c60;
    CCScrollLayerExt(cocos2d::CCRect rect) = mac 0x235130, ios 0x21f05c, win 0x17860;
    void scrollLayer(float scroll) = mac 0x236490, win 0x186d0;
    void updateIndicators(float unknown) = win 0x17f50;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void preVisitWithClippingRect(cocos2d::CCRect) = mac 0x2366a0, win 0x188b0;
    virtual void postVisit() = mac 0x236720, win 0x18940;
    virtual void gd20_slot_127() = win 0x17640;  // 2.0 slot (getIsTouch, types unknown)
    virtual void setIsTouch(bool) = win 0x17650;
    virtual void gd20_slot_129() = win 0x17660;  // 2.0 slot (getIsScrolling, types unknown)
    virtual void setIsScrolling(bool) = win 0x17670;
    virtual void gd20_slot_131() = win 0x17680;  // 2.0 slot (getVerticalScrollIndicator, types unknown)
    virtual void setVerticalScrollIndicator(cocos2d::CCLayerColor*) = win 0x17690;
    virtual void gd20_slot_133() = win 0x176a0;  // 2.0 slot (getHorizontalScrollIndicator, types unknown)
    virtual void setHorizontalScrollIndicator(cocos2d::CCLayerColor*) = win 0x176b0;
    virtual void gd20_slot_135() = win 0x176c0;  // 2.0 slot (getScrollDelegate, types unknown)
    virtual void setScrollDelegate(CCScrollLayerExtDelegate*) = win 0x176d0;
    virtual void gd20_slot_137() = win 0xd0e0;  // 2.0 slot (getContentLayer, types unknown)
    virtual void setContentLayer(cocos2d::CCLayerColor*) = win 0xd0f0;
    virtual void gd20_slot_139() = win 0x176e0;  // 2.0 slot (getClipsToBounds, types unknown)
    virtual void setClipsToBounds(bool) = win 0x176f0;
    virtual void gd20_slot_141() = win 0x17700;  // 2.0 slot (getShowsHorizontalScrollIndicator, types unknown)
    virtual void setShowsHorizontalScrollIndicator(bool) = win 0x17710;
    virtual void gd20_slot_143() = win 0x17720;  // 2.0 slot (getShowsVerticalScrollIndicator, types unknown)
    virtual void setShowsVerticalScrollIndicator(bool) = win 0x17730;
    virtual void gd20_slot_145() = win 0x17740;  // 2.0 slot (getLockHorizontal, types unknown)
    virtual void setLockHorizontal(bool) = win 0x17750;
    virtual void gd20_slot_147() = win 0x17760;  // 2.0 slot (getLockVertical, types unknown)
    virtual void setLockVertical(bool) = win 0x17770;
    virtual void gd20_slot_149() = win 0x17780;  // 2.0 slot (getTouchDispatch, types unknown)
    virtual void setTouchDispatch(bool) = win 0x17790;
    virtual void gd20_slot_151() = win 0x177a0;  // 2.0 slot (getTopPadding, types unknown)
    virtual void setTopPadding(float) = win 0x177b0;
    virtual void gd20_slot_153() = win 0x177d0;  // 2.0 slot (getBottomPadding, types unknown)
    virtual void setBottomPadding(float) = win 0x177e0;
    virtual void gd20_slot_155() = win 0x17800;  // 2.0 slot (getMaxOffsetTop, types unknown)
    virtual void setMaxOffsetTop(float) = win 0x17810;
    virtual void gd20_slot_157() = win 0x17830;  // 2.0 slot (getMaxOffsetBottom, types unknown)
    virtual void setMaxOffsetBottom(float) = win 0x17840;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x118 ----
    PAD = win 0x4;
    cocos2d::CCPoint m_touchPosition;  // 2.011 +0x11c (same own size)
    cocos2d::CCPoint m_touchStartPosition;  // 2.011 +0x124 (same own size)
    cocos2d::cc_timeval m_timeValue;  // 2.011 +0x12c (same own size)
    cocos2d::CCTouch* m_touch;  // 2.011 +0x134 (accessor)
    cocos2d::CCLayerColor* m_verticalScrollbar;  // 2.011 +0x138 (same own size)
    cocos2d::CCLayerColor* m_horizontalScrollbar;  // 2.011 +0x13c (same own size)
    CCScrollLayerExtDelegate* m_delegate;  // 2.011 +0x140 (same own size)
    CCContentLayer* m_contentLayer;  // 2.011 +0x144 (same own size)
    bool m_cutContent;  // 2.011 +0x148 (same own size)
    bool m_vScrollbarVisible;  // 2.011 +0x149 (same own size)
    bool m_hScrollbarVisible;  // 2.011 +0x14a (same own size)
    bool m_disableHorizontal;  // 2.011 +0x14b (same own size)
    bool m_disableVertical;  // 2.011 +0x14c (same own size)
    bool m_disableMovement;  // 2.011 +0x14d (same own size)
    PAD = win 0x2;
    float m_scrollLimitTop;  // 2.011 +0x150 (same own size)
    float m_scrollLimitBottom;  // 2.011 +0x154 (same own size)
    float m_peekLimitTop;  // 2.011 +0x158 (same own size)
    float m_peekLimitBottom;  // 2.011 +0x15c (same own size)
}

class CCScrollLayerExtDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void scrllViewWillBeginDecelerating(CCScrollLayerExt*) {}
    virtual void scrollViewDidEndDecelerating(CCScrollLayerExt*) {}
    virtual void scrollViewTouchMoving(CCScrollLayerExt*) {}
    virtual void scrollViewDidEndMoving(CCScrollLayerExt*) {}
    virtual void scrollViewTouchBegin(CCScrollLayerExt*) {}
    virtual void scrollViewTouchEnd(CCScrollLayerExt*) {}
}

class CCSpritePart : CCSpritePlus {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_137() = win 0x16460;  // 2.0 slot (getActiveFrame, types unknown)
    virtual void setActiveFrame(gd::string) = win 0x164a0;
}

class CCSpritePlus : cocos2d::CCSprite {
    virtual bool initWithSpriteFrameName(const char*) = mac 0x248670, win 0x18ad0;
    virtual void setScaleX(float scale) = win 0x18cb0;
    virtual void setScaleY(float scale) = win 0x18d30;
    virtual void setScale(float scale) = win 0x18db0;
    virtual void setPosition(const cocos2d::CCPoint& pos) = win 0x18b10;
    virtual void setRotation(float rotation) = win 0x18b70;
    virtual bool initWithTexture(cocos2d::CCTexture2D* texture) = win 0x18af0;
    static CCSpritePlus* createWithSpriteFrame(cocos2d::CCSpriteFrame* frame);

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void setFlipX(bool flip) = win 0x18bf0;
    virtual void setFlipY(bool flip) = win 0x18c50;
    virtual void gd20_slot_135() = win 0x16260;  // 2.0 slot (getFollowScale, types unknown)
    virtual void setFollowScale(bool) = win 0x16270;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1b8 ----
    cocos2d::CCArray* m_followers;  // 2.011 +0x1b8 (consistent evidence)
    CCSpritePlus* m_followingSprite;  // 2.011 +0x1bc (consistent evidence)
    bool m_hasFollower;  // 2.011 +0x1c0 (consistent evidence)
    bool m_propagateScaleChanges;  // 2.011 +0x1c1 (consistent evidence)
    bool m_propagateFlipChanges;  // 2.011 +0x1c2 (consistent evidence)
}

class CCTextInputNode : cocos2d::CCLayer, cocos2d::CCIMEDelegate, cocos2d::CCTextFieldDelegate {
    inline CCTextInputNode() : cocos2d::CCLayer(), cocos2d::CCIMEDelegate(), cocos2d::CCTextFieldDelegate(), m_caption(), m_allowedChars() {
        m_numberInput = false;
        m_unknown1 = 0;
        m_selected = false;
        m_unknown2 = false;
        m_maxLabelWidth = 0.f;
        m_maxLabelScale = 0.f;
        m_placeholderScale = 0.f;
        m_placeholderColor = cocos2d::ccc3(0,0,0);
        m_textColor = cocos2d::ccc3(0,0,0);
        m_cursor = nullptr;
        m_textField = nullptr;
        m_delegate = nullptr;
        m_maxLabelLength = 0;
        m_placeholderLabel = nullptr;
        m_unknown3 = false;
        m_usePasswordChar = false;
        m_forceOffset = false;
    }
    inline ~CCTextInputNode() {
        if (m_selected) m_textField->detachWithIME();
    }
    void setLabelNormalColor(cocos2d::ccColor3B color) {
        m_textColor = color;
        this->refreshLabel();
    }
    void setLabelPlaceholderColor(cocos2d::ccColor3B color) {
        m_placeholderColor = color;
        this->refreshLabel();
    }
    void setLabelPlaceholderScale(float scale) {
        m_placeholderScale = scale;
        this->refreshLabel();
    }
    void setMaxLabelScale(float scale) {
        m_maxLabelScale = scale;
        this->refreshLabel();
    }
    void setMaxLabelWidth(int length) {
        m_maxLabelLength = length;
        this->refreshLabel();
    }
    void setAllowedChars(gd::string filter) {
        m_allowedChars = filter;
    }
    void forceOffset() {
        m_forceOffset = true;
    }
    void setString(gd::string text) = mac 0x5d3e0, win 0x1d9a0;
    // GD 2.011 port (v2): gd::string like 2.2's, from the text field
    gd::string getString() {
        return m_textField->getString();
    }
    cocos2d::CCTextFieldTTF* getTextField() {
        return m_textField;
    }
    cocos2d::CCLabelBMFont* getPlaceholderLabel() {
        return m_placeholderLabel;
    }

    inline static CCTextInputNode* create(float width, float height, char const* placeholder, char const* fontPath) {
        return CCTextInputNode::create(width, height, placeholder, 0x18, fontPath);
    }
    inline static CCTextInputNode* create(float width, float height, char const* placeholder, int fontSize, char const* fontPath) {
        auto ret = new CCTextInputNode();
        if (ret && ret->init(width, height, placeholder, "Thonburi", fontSize, fontPath)) {
            ret->autorelease();
            return ret;
        }
        CC_SAFE_DELETE(ret);
        return nullptr;
    }
    bool init(float width, float height, const char* caption, const char* thonburi, int maxCharCount, const char* font) = mac 0x5d180, ios 0xe261c, win 0x1d780;

    void refreshLabel() = mac 0x5d730, ios 0xe2af4, win 0x1dc60;
    void updateLabel(gd::string) = mac 0x5d4a0, win 0x1dac0;
    void updateBlinkLabel() = mac 0x5d920, win 0x1ddc0;
    virtual void registerWithTouchDispatcher() = mac 0x5eec0, win 0x1ea30;
    virtual void visit() = mac 0x5d380, win 0x1d930;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x5ec80, win 0x1e870;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void textChanged() = mac 0x5dd70, win 0x1e010;
    virtual void keyboardWillShow(cocos2d::CCIMEKeyboardNotificationInfo&) = mac 0x5dad0, win 0x1deb0;
    virtual void keyboardWillHide(cocos2d::CCIMEKeyboardNotificationInfo&) = mac 0x5dc20, win 0x1df80;
    virtual bool onTextFieldInsertText(cocos2d::CCTextFieldTTF*, char const*, int) = mac 0x5de50, win 0x1e090;
    virtual bool onTextFieldAttachWithIME(cocos2d::CCTextFieldTTF*) = mac 0x5e2c0, win 0x1e460;
    virtual bool onTextFieldDetachWithIME(cocos2d::CCTextFieldTTF*) = mac 0x5e610, win 0x1e6b0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void onClickTrackNode(bool) = mac 0x5dd40, win 0x1dfe0;
    virtual void gd20_slot_126() = win 0x19300;  // 2.0 slot (getClearAtZero, types unknown)
    virtual void setClearAtZero(bool) = win 0x19310;
    virtual void gd20_slot_128() = win 0x19320;  // 2.0 slot, name unknown
    virtual void gd20_slot_129() = win 0xde30;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(TextInputDelegate* delegate) {
        m_delegate = delegate;
    }
    virtual void gd20_slot_131() = win 0x19330;  // 2.0 slot (getCharLimit, types unknown)
    virtual void setCharLimit(int) = win 0x19340;
    virtual void gd20_slot_133() = win 0x19350;  // 2.0 slot (getLabel, types unknown)
    virtual void gd20_slot_134() = win 0x19360;  // 2.0 slot (getProfanityFilter, types unknown)
    virtual void setProfanityFilter(bool) = win 0x19370;
    virtual void gd20_slot_136() = win 0x19380;  // 2.0 slot (getIsPassword, types unknown)
    virtual void setIsPassword(bool) = win 0x19390;
    virtual void gd20_slot_138() = win 0x193a0;  // 2.0 slot (getForceOffset, types unknown)
    virtual void setForceOffset(bool) = win 0x193b0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x120 ----
    bool m_numberInput;  // 2.011 +0x120 (interpolated)
    PAD = win 0x3;
    gd::string m_caption;  // 2.011 +0x124 (manual)
    int m_unknown1;  // 2.011 +0x13c (interpolated)
    bool m_selected;  // 2.011 +0x140 (voted)
    bool m_unknown2;  // 2.011 +0x141 (interpolated)
    PAD = win 0x2;
    gd::string m_allowedChars;  // 2.011 +0x144 (manual)
    float m_maxLabelWidth;  // 2.011 +0x15c (manual)
    float m_maxLabelScale;  // 2.011 +0x160 (manual)
    float m_placeholderScale;  // 2.011 +0x164 (manual)
    cocos2d::ccColor3B m_placeholderColor;  // 2.011 +0x168 (manual)
    cocos2d::ccColor3B m_textColor;  // 2.011 +0x16b (manual)
    PAD = win 0x2;
    cocos2d::CCLabelBMFont* m_cursor;  // 2.011 +0x170 (manual)
    cocos2d::CCTextFieldTTF* m_textField;  // 2.011 +0x174 (manual)
    TextInputDelegate* m_delegate;  // 2.011 +0x178 (accessor)
    int m_maxLabelLength;  // 2.011 +0x17c (interpolated)
    cocos2d::CCLabelBMFont* m_placeholderLabel;  // 2.011 +0x180 (manual)
    bool m_unknown3;  // 2.011 +0x184 (interpolated)
    bool m_usePasswordChar;  // 2.011 +0x185 (interpolated)
    bool m_forceOffset;  // 2.011 +0x186 (accessor)
    PAD = win 0x1;
}

// GD 2.011 port: 2.1-only class, stub
class ChallengesPage {
}

class CheckpointObject : cocos2d::CCNode {
    static CheckpointObject* create() = mac 0x7e7d0, win 0x17e4a0;
    void getObject() = mac 0x7ef50;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x25510;  // 2.0 slot (getPlayerCheck01, types unknown)
    virtual void setPlayerCheck01(PlayerCheckpoint*) = win 0x7c2c0;
    virtual void gd20_slot_109() = win 0x25610;  // 2.0 slot (getPlayerCheck02, types unknown)
    virtual void setPlayerCheck02(PlayerCheckpoint*) = win 0x53df0;
    virtual void gd20_slot_111() = win 0xed040;  // 2.0 slot (getDualMode, types unknown)
    virtual void setDualMode(bool) = win 0xed050;
    virtual void gd20_slot_113() = win 0xed060;  // 2.0 slot (getIsFlipped, types unknown)
    virtual void setIsFlipped(bool) = win 0xed070;
    virtual void gd20_slot_115() = win 0x16a3e0;  // 2.0 slot (getCameraPos, types unknown)
    virtual void setCameraPos(cocos2d::CCPoint) = win 0x16a400;
    virtual void gd20_slot_117() = win 0x14f10;  // 2.0 slot (getActiveEnterEffect, types unknown)
    virtual void gd20_slot_118() = win 0x14f20;  // 2.0 slot (setActiveEnterEffect, types unknown)
    virtual void gd20_slot_119() = win 0x135b0;  // 2.0 slot (getPortalObject, types unknown)
    virtual void setPortalObject(GameObject*) = win 0x135c0;
    virtual void gd20_slot_121() = win 0x16a420;  // 2.0 slot (getTimeStamp, types unknown)
    virtual void setTimeStamp(double) = win 0x16a430;
    virtual void gd20_slot_123() = win 0x16a450;  // 2.0 slot (getColorManagerState, types unknown)
    virtual void setColorManagerState(gd::string) = win 0x16a490;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    GameObject* m_gameObject;  // 2.011 +0xe8 (consistent evidence)
    PlayerCheckpoint* m_player1;  // 2.011 +0xec (consistent evidence)
    PlayerCheckpoint* m_player2;  // 2.011 +0xf0 (consistent evidence)
    bool m_isDual;  // 2.011 +0xf4 (consistent evidence)
    bool m_isFlipped;  // 2.011 +0xf5 (consistent evidence)
    PAD = win 0x2;
    cocos2d::CCPoint m_cameraPos;  // 2.011 +0xf8 (consistent evidence)
    int m_unk104;  // 2.011 +0x100 (consistent evidence)
    GameObject* m_lastPortal;  // 2.011 +0x104 (consistent evidence)
    PAD = win 0xc;
    gd::string m_currentStateString;  // 2.011 +0x114 (consistent evidence)
}

// GD 2.011 port: 2.1-only class, stub
class CollisionBlockPopup {
}

// GD 2.011 port: 2.1-only class, stub
class CollisionTriggerAction {
}

class ColorAction : cocos2d::CCNode {
    static ColorAction* create() = mac 0x17c990, win 0xc6700;
    static ColorAction* create(cocos2d::ccColor3B, cocos2d::ccColor3B, float, double, bool, int, float, float) = mac 0x17cab0, win 0xc6750;
    gd::string getSaveString() = mac 0x17d080, win 0xc6980;
    void setupFromDict(cocos2d::CCDictionary*) = mac 0x17f310, win 0xc7330;
    void setupFromString(gd::string) = mac 0x17f270, win 0xc72a0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0xc30b0;  // 2.0 slot (getCurrentColor, types unknown)
    virtual void setCurrentColor(cocos2d::ccColor3B) = win 0xc30d0;
    virtual void gd20_slot_109() = win 0x134a0;  // 2.0 slot (getCurrentOpacity, types unknown)
    virtual void setCurrentOpacity(float) = win 0x134b0;
    virtual void gd20_slot_111() = win 0x134d0;  // 2.0 slot (getDeltaTime, types unknown)
    virtual void setDeltaTime(float) = win 0x134e0;
    virtual void gd20_slot_113() = win 0xc30f0;  // 2.0 slot (getFromColor, types unknown)
    virtual void setFromColor(cocos2d::ccColor3B) = win 0xc3110;
    virtual void gd20_slot_115() = win 0xc3130;  // 2.0 slot (getToColor, types unknown)
    virtual void setToColor(cocos2d::ccColor3B) = win 0xc3150;
    virtual void gd20_slot_117() = win 0x140b0;  // 2.0 slot (getDuration, types unknown)
    virtual void setDuration(float) = win 0x140c0;
    virtual void gd20_slot_119() = win 0xc3170;  // 2.0 slot (getBlend, types unknown)
    virtual void setBlend(bool) = win 0xc3180;
    virtual void gd20_slot_121() = win 0x135b0;  // 2.0 slot (getCustom, types unknown)
    virtual void setCustom(int) = win 0x135c0;
    virtual void gd20_slot_123() = win 0x135d0;  // 2.0 slot (getIndex, types unknown)
    virtual void setIndex(int) = win 0x135e0;
    virtual void gd20_slot_125() = win 0x135f0;  // 2.0 slot (getFromOpacity, types unknown)
    virtual void setFromOpacity(float) = win 0x13600;
    virtual void gd20_slot_127() = win 0x24840;  // 2.0 slot (getToOpacity, types unknown)
    virtual void setToOpacity(float) = win 0x24850;
    virtual void gd20_slot_129() = win 0xc3190;  // 2.0 slot (getHSVValue, types unknown)
    virtual void setHSVValue(cocos2d::ccHSVValue) = win 0xc31b0;
    virtual void gd20_slot_131() = win 0x7dc70;  // 2.0 slot (getInheritColorIndex, types unknown)
    virtual void setInheritColorIndex(int) = win 0x7dc80;
    virtual void gd20_slot_133() = win 0xc31d0;  // 2.0 slot (getDidProcess, types unknown)
    virtual void setDidProcess(bool) = win 0xc31e0;
    virtual void gd20_slot_135() = win 0xc31f0;  // 2.0 slot (getCopyOpacity, types unknown)
    virtual void setCopyOpacity(bool) = win 0xc3200;
    virtual void gd20_slot_137() = win 0xc3210;  // 2.0 slot (getIgnore, types unknown)
    virtual void setIgnore(bool) = win 0xc3220;
    virtual void gd20_slot_139() = win 0xc3230;  // 2.0 slot (getIgnoreCopyColor, types unknown)
    virtual void setIgnoreCopyColor(bool) = win 0xc3240;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    PAD = win 0x4;
    float m_currentOpacity;  // 2.011 +0xec (accessor)
    float m_deltaTime;  // 2.011 +0xf0 (accessor)
    cocos2d::ccColor3B m_fromColor;  // 2.011 +0xf4 (interpolated)
    cocos2d::ccColor3B m_targetColor;  // 2.011 +0xf7 (interpolated)
    PAD = win 0x2;
    float m_duration;  // 2.011 +0xfc (accessor)
    PAD = win 0x29;
    bool m_copyOpacity;  // 2.011 +0x129 (accessor)
    PAD = win 0x2;
}

class ColorActionSprite : cocos2d::CCSprite {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_133() = win 0xc2e90;  // 2.0 slot (getActiveColor, types unknown)
    virtual void gd20_slot_134() = win 0xc2ea0;  // 2.0 slot, name unknown
    virtual void gd20_slot_135() = win 0xc2ec0;  // 2.0 slot, name unknown
    virtual void gd20_slot_136() = win 0xc2ee0;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1b8 ----
    cocos2d::_ccColor3B m_activeColor;  // 2.011 +0x1b8 (accessor)
    PAD = win 0x5;
}

class ColorChannelSprite : cocos2d::CCSprite {
    void updateBlending(bool) = mac 0x16e1d0, win 0xc3780;
    void updateCopyLabel(int, bool) = mac 0x16ded0, win 0xc34b0;
    void updateOpacity(float) = mac 0x16e080, win 0xc3630;
    void updateValues(ColorAction*) = mac 0x16e2e0, win 0xc3870;
    static ColorChannelSprite* create() = mac 0x16de00, win 0xc33b0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1b8 ----
    cocos2d::CCLabelBMFont* m_copyLabel;  // 2.011 +0x1b8 (same own size)
    cocos2d::CCLabelBMFont* m_opacityLabel;  // 2.011 +0x1bc (same own size)
    cocos2d::CCLabelBMFont* m_blendingDot;  // 2.011 +0x1c0 (same own size)
}

class ColorSelectDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void colorSelectClosed(cocos2d::CCNode*) {}
}

// GD 2.011 port: 2.1-only class, stub
class ColorSelectLiveOverlay {
}

class ColorSelectPopup : FLAlertLayer, cocos2d::extension::ColorPickerDelegate, TextInputDelegate, GJSpecialColorSelectDelegate {
    virtual void colorValueChanged(cocos2d::ccColor3B color) = mac 0x423320, win 0x3cf90;
    ColorSelectPopup() {}
    bool init(EffectGameObject* triggerObj, cocos2d::CCArray* triggerObjs, ColorAction* colorAction) = mac 0x41ee70, win 0x39e40;
    void updateColorValue() = win 0x3cff0;
    void updateCopyColorTextInputLabel() = mac 0x422ed0, win 0x3d910;
    void closeColorSelect(cocos2d::CCObject* sender) = mac 0x421af0, win 0x3ce80;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_144() = win 0x39be0;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(ColorSelectDelegate*) = win 0x39bf0;
    virtual void gd20_slot_146() = win 0x39c00;  // 2.0 slot, name unknown
    virtual void gd20_slot_147() = win 0x39c10;  // 2.0 slot, name unknown
    virtual void gd20_slot_148() = win 0x10e50;  // 2.0 slot, name unknown
    virtual void gd20_slot_149() = win 0x39c20;  // 2.0 slot, name unknown
    virtual void gd20_slot_150() = win 0x39c30;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1d4 ----
    cocos2d::extension::CCControlColourPicker* m_colorPicker;  // 2.011 +0x1d4 (interpolated)
    cocos2d::CCLabelBMFont* m_unk1DC;  // 2.011 +0x1d8 (interpolated)
    cocos2d::CCLabelBMFont* m_label;  // 2.011 +0x1dc (interpolated)
    Slider* m_unk1E4;  // 2.011 +0x1e0 (interpolated)
    Slider* m_slider;  // 2.011 +0x1e4 (interpolated)
    EffectGameObject* m_targetObject;  // 2.011 +0x1e8 (interpolated)
    cocos2d::CCArray* m_targetObjects;  // 2.011 +0x1ec (interpolated)
    CCMenuItemToggler* m_toggler1;  // 2.011 +0x1f0 (interpolated)
    CCMenuItemToggler* m_toggler2;  // 2.011 +0x1f4 (interpolated)
    unsigned int m_rgbLastColor;  // 2.011 +0x1f8 (interpolated)
    cocos2d::CCSprite* m_unk200;  // 2.011 +0x1fc (interpolated)
    cocos2d::CCSprite* m_unk204;  // 2.011 +0x200 (interpolated)
    cocos2d::ccColor3B m_selectedColor;  // 2.011 +0x204 (interpolated)
    PAD = win 0x1;
    GJColorSetupLayer* m_colorSetupLayer;  // 2.011 +0x208 (interpolated)
    float m_fadeTime;  // 2.011 +0x20c (interpolated)
    int m_playerColor;  // 2.011 +0x210 (interpolated)
    bool m_isBlending;  // 2.011 +0x214 (interpolated)
    PAD = win 0x3;
    float m_opacity;  // 2.011 +0x218 (interpolated)
    ColorAction* m_colorAction;  // 2.011 +0x21c (interpolated)
    CCTextInputNode* m_textInput1;  // 2.011 +0x220 (interpolated)
    bool m_unk228;  // 2.011 +0x224 (voted)
    PAD = win 0x4f;
}

class ColorSetupDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void colorSetupClosed(int channel) {}
}

class CommentCell : TableViewCell, LikeItemDelegate, FLAlertLayerProtocol {
    void loadFromComment(GJComment*) = mac 0x111c70, win 0x4c2d0;
    void onConfirmDelete(cocos2d::CCObject* sender) = mac 0x11d100, win 0x4d550;
    void onLike(cocos2d::CCObject* sender) = mac 0x11d000, win 0x4d2e0;
    virtual void FLAlert_Clicked(FLAlertLayer* layer, bool btn) = mac 0x11d540, win 0x4d680;
    virtual void likedItem(LikeItemType type, int id, bool special) = mac 0x11d340, win 0x4d450;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x178 ----
    cocos2d::CCSprite* m_iconSprite;  // 2.011 +0x178 (interpolated)
    cocos2d::CCLabelBMFont* m_likeLabel;  // 2.011 +0x17c (interpolated)
    GJComment* m_comment;  // 2.011 +0x180 (voted)
    bool m_accountComment;  // 2.011 +0x184 (voted)
    PAD = win 0x3;
}

class CommentUploadDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void commentUploadFinished(int) {}
    virtual void commentUploadFailed(int, CommentError) {}
    virtual void commentDeleteFailed(int, int) {}
}

class ConfigureHSVWidget : cocos2d::CCNode {
    bool init(int abs, cocos2d::ccHSVValue val) = mac 0x237310;
    void updateLabels() = mac 0x237df0, win 0x3ec70;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x3dc00;  // 2.0 slot, name unknown
    virtual void gd20_slot_108() = win 0x13620;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    cocos2d::CCLabelBMFont* m_hueLabel;  // 2.011 +0xe8 (consistent evidence)
    cocos2d::CCLabelBMFont* m_saturationLabel;  // 2.011 +0xec (consistent evidence)
    cocos2d::CCLabelBMFont* m_brightnessLabel;  // 2.011 +0xf0 (consistent evidence)
    Slider* m_hueSlider;  // 2.011 +0xf4 (consistent evidence)
    Slider* m_saturationSlider;  // 2.011 +0xf8 (consistent evidence)
    Slider* m_brightnessSlider;  // 2.011 +0xfc (consistent evidence)
    cocos2d::ccHSVValue m_value;  // 2.011 +0x100 (consistent evidence)
    PAD = win 0x4;
}

// GD 2.011 port: 2.1-only class, stub
class CountTriggerAction {
}

class CreateGuidelinesLayer : FLAlertLayer, FLAlertLayerProtocol {
    void doClearGuidelines() = mac 0x299690, win 0x40090;
    void onStop(cocos2d::CCObject* sender) = mac 0x2990f0, win 0x40390;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1cc ----
    PAD = win 0x4;
    LevelSettingsObject* m_levelSettings;  // 2.011 +0x1d0 (interpolated)
    PAD = win 0x1c;
    gd::string m_guidelineString;  // 2.011 +0x1f0 (voted)
}

class CreateMenuItem : CCMenuItemSpriteExtra {
    static CreateMenuItem* create(cocos2d::CCNode*, cocos2d::CCNode*, cocos2d::CCObject*, cocos2d::SEL_MenuHandler) = mac 0x1c580, win 0x73b70;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_134() = win 0x5ce20;  // 2.0 slot (getObjectFrame, types unknown)
    virtual void setObjectFrame(gd::string) = win 0x5ce60;
    virtual void gd20_slot_136() = win 0x5ced0;  // 2.0 slot (getObjectKey, types unknown)
    virtual void setObjectKey(int) = win 0x5cee0;
    virtual void gd20_slot_138() = win 0xdd50;  // 2.0 slot (getPage, types unknown)
    virtual void setPage(int) = win 0x5cef0;
    virtual void gd20_slot_140() = win 0x5cf00;  // 2.0 slot (getTab, types unknown)
    virtual void setTab(int) = win 0x5cf10;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x13c ----
    PAD = win 0x18;
    int m_objectID;  // 2.011 +0x154 (same own size)
    int m_buildTabPage;  // 2.011 +0x158 (same own size)
    int m_buildTab;  // 2.011 +0x15c (same own size)
}

class CreatorLayer : cocos2d::CCLayer {
    void onBack(cocos2d::CCObject*) = win 0x418c0;
    void onChallenge(cocos2d::CCObject*) = mac 0x142960;
    void onLeaderboards(cocos2d::CCObject*) = mac 0x142920, win 0x415b0;
    void onMyLevels(cocos2d::CCObject*) = mac 0x142b70, win 0x414d0;
    void onSavedLevels(cocos2d::CCObject*) = mac 0x142860, win 0x41540;
    void onDailyLevel(cocos2d::CCObject*) = mac 0x142980;
    void onWeeklyLevel(cocos2d::CCObject*) = mac 0x1429a0;
    void onFeaturedLevels(cocos2d::CCObject*) = mac 0x142a20, win 0x41690;
    void onFameLevels(cocos2d::CCObject*) = mac 0x142a80;
    void onMapPacks(cocos2d::CCObject*) = mac 0x1429c0, win 0x417d0;
    void onOnlineLevels(cocos2d::CCObject*) = mac 0x142ae0, win 0x41780;
    void onGauntlets(cocos2d::CCObject*) = mac 0x142b20;
    void onSecretVault(cocos2d::CCObject*);
    void onTreasureRoom(cocos2d::CCObject*);
    virtual bool init() = mac 0x141c10, win 0x40e10;
    static CreatorLayer* create() = mac 0x141b10, win 0x40d20;
    void sceneWillResume() = mac 0x1438F0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

// GD 2.011 port: 2.1-only class, stub
class CurrencyRewardLayer {
}

// GD 2.011 port: 2.1-only class, stub
class CurrencyRewardDelegate {
}

class CustomListView : BoomListView {
    static CustomListView* create(cocos2d::CCArray*, float, float, int, BoomListType) = mac 0x10d410, ios 0x99154, win 0x45e30;
    inline static CustomListView* create(cocos2d::CCArray* entries, BoomListType type, float width, float height) {
        return CustomListView::create(entries, width, height, 0, type);
    }
    virtual TableViewCell* getListCell(const char*) = mac 0x10d560, win 0x45ef0;
    virtual void loadCell(TableViewCell*, int) = mac 0x10e610, win 0x46370;
    virtual void setupList() = mac 0x116e70, win 0x465c0;
    inline CustomListView() {}

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class CustomSongCell : TableViewCell {
    void loadFromObject(SongInfoObject*) = mac 0x110220, win 0x4bde0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class CustomSongLayer : FLAlertLayer, FLAlertLayerProtocol, TextInputDelegate, GJDropDownLayerDelegate {
    bool init(LevelSettingsObject*) = mac 0xf06f0, win 0x516d0;
    void onArtists(cocos2d::CCObject*) = mac 0xf1950;
    void onSongBrowser(cocos2d::CCObject*) = mac 0xf18a0;
    void onSearch(cocos2d::CCObject*) = mac 0xf1ad0, win 0x52670;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_144() = win 0x51450;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(CustomSongLayerDelegate*) = win 0x51460;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1d4 ----
    LevelSettingsObject* m_levelSettings;  // 2.011 +0x1d4 (interpolated)
    CCTextInputNode* m_songIDInput;  // 2.011 +0x1d8 (voted)
    PAD = win 0x8;
}

class CustomSongWidget : cocos2d::CCNode, MusicDownloadDelegate, FLAlertLayerProtocol {
    bool init(SongInfoObject*, LevelSettingsObject*, bool, bool, bool, bool, bool) = mac 0x37be20, win 0x54010;
    void FLAlert_Clicked(FLAlertLayer*, bool) {}
    void loadSongInfoFinished(SongInfoObject*) {}

    void startDownload() = win 0x54f90;
    void startMonitorDownload() = win 0x55030;
    void updatePlaybackBtn() = win 0x55310;
    void updateSongInfo() = win 0x55590;
    void updateSongObject(SongInfoObject* song) = mac 0x37d690, win 0x54ce0;
    void onCancelDownload(cocos2d::CCObject*) = win 0x54d30;
    void onDownload(cocos2d::CCObject*) = win 0x54ec0;
    void onGetSongInfo(cocos2d::CCObject*) = win 0x54e10;
    void onMore(cocos2d::CCObject*) = win 0x54870;
    void onPlayback(cocos2d::CCObject*) = win 0x55140;
    void onSelect(cocos2d::CCObject*) = win 0x550e0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x25610;  // 2.0 slot (getSongObject, types unknown)
    virtual void setSongObject(SongInfoObject*) = win 0x53df0;
    virtual void gd20_slot_109() = win 0x53e30;  // 2.0 slot (getReportSongSelect, types unknown)
    virtual void setReportSongSelect(bool) = win 0x53e40;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xf0 ----
    SongInfoObject* m_songInfo;  // 2.011 +0xf0 (voted)
    cocos2d::CCMenu* m_buttonMenu;  // 2.011 +0xf4 (interpolated)
    cocos2d::CCLabelBMFont* m_songLabel;  // 2.011 +0xf8 (interpolated)
    cocos2d::CCLabelBMFont* m_artistLabel;  // 2.011 +0xfc (interpolated)
    cocos2d::CCLabelBMFont* m_songIDLabel;  // 2.011 +0x100 (interpolated)
    cocos2d::CCLabelBMFont* m_errorLabel;  // 2.011 +0x104 (voted)
    CCMenuItemSpriteExtra* m_downloadBtn;  // 2.011 +0x108 (interpolated)
    CCMenuItemSpriteExtra* m_cancelDownloadBtn;  // 2.011 +0x10c (interpolated)
    CCMenuItemSpriteExtra* m_selectSongBtn;  // 2.011 +0x110 (interpolated)
    CCMenuItemSpriteExtra* m_getSongInfoBtn;  // 2.011 +0x114 (voted)
    CCMenuItemSpriteExtra* m_playMusicBtn;  // 2.011 +0x118 (interpolated)
    CCMenuItemSpriteExtra* m_moreBtn;  // 2.011 +0x11c (interpolated)
    cocos2d::CCSprite* m_sliderGroove;  // 2.011 +0x120 (interpolated)
    cocos2d::CCSprite* m_sliderBar;  // 2.011 +0x124 (interpolated)
    LevelSettingsObject* m_levelSettings;  // 2.011 +0x128 (interpolated)
    bool m_showSelectSongBtn;  // 2.011 +0x12c (interpolated)
    bool m_showPlayMusicBtn;  // 2.011 +0x12d (interpolated)
    bool m_showDownloadButtons;  // 2.011 +0x12e (interpolated)
    bool m_isNotDownloading;  // 2.011 +0x12f (voted)
    bool m_hasDefaultSong;  // 2.011 +0x130 (voted)
    PAD = win 0x3;
    int m_customSongID;  // 2.011 +0x134 (voted)
    PAD = win 0x4;
}

class CustomizeObjectLayer : FLAlertLayer, TextInputDelegate, HSVWidgetPopupDelegate, ColorSelectDelegate, ColorSetupDelegate {
    void onNextColorChannel(cocos2d::CCObject* sender) = mac 0xe0270, win 0x44d80;
    void onSelectColor(cocos2d::CCObject* sender) = mac 0xdfdc0, win 0x45920;
    void onSelectMode(cocos2d::CCObject* sender) = mac 0xdf820, win 0x44eb0;
    int getActiveMode(bool unknown) = mac 0xe0740, win 0x45320;
    void onClose(cocos2d::CCObject*) = mac 0xdf660, win 0x45be0;
    void updateSelected(int channelID) = mac 0xe0970, win 0x459c0;
    bool init(GameObject* target, cocos2d::CCArray* targets) = mac 0xdd560, win 0x41c60;
    void onHSV(cocos2d::CCObject* sender) = mac 0xdfa00, win 0x44860;
    void toggleVisible() = mac 0xe1140, win 0x450b0;
    void highlightSelected(ButtonSprite* target) = mac 0xe0aa0, win 0x45af0;
    void updateCustomColorLabels() = mac 0xdff40, win 0x45830;
    void onUpdateCustomColor(cocos2d::CCObject* sender) = mac 0xdfe70, win 0x454a0;
    void updateColorSprite() = mac 0xe0610, win 0x443f0;
    // inlined in most places
    void updateChannelLabel(int channel) = mac 0xe06e0, win 0x45050;
    virtual void hsvPopupClosed(HSVWidgetPopup* popup, cocos2d::ccHSVValue value) = win 0x44a40;
    virtual void colorSelectClosed(cocos2d::CCNode*) = mac 0xe0610;
    virtual void textChanged(CCTextInputNode* input) = mac 0xe1470, win 0x45620;
    inline CustomizeObjectLayer() {}
    ~CustomizeObjectLayer() = win 0x41960;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1d8 ----
    GameObject* m_targetObject;  // 2.011 +0x1d8 (voted)
    cocos2d::CCArray* m_targetObjects;  // 2.011 +0x1dc (interpolated)
    cocos2d::CCArray* m_colorButtons;  // 2.011 +0x1e0 (voted)
    cocos2d::CCArray* m_colorTabNodes;  // 2.011 +0x1e4 (interpolated)
    cocos2d::CCArray* m_textTabNodes;  // 2.011 +0x1e8 (interpolated)
    PAD = win 0x4;
    cocos2d::CCArray* m_detailTabNodes;  // 2.011 +0x1f0 (interpolated)
    int m_selectedMode;  // 2.011 +0x1f4 (voted)
    int m_customColorChannel;  // 2.011 +0x1f8 (voted)
    bool m_unk0x200;  // 2.011 +0x1fc (voted)
    bool m_unk0x201;  // 2.011 +0x1fd (interpolated)
    bool m_glowDisabled;  // 2.011 +0x1fe (interpolated)
    PAD = win 0x1;
    CCMenuItemSpriteExtra* m_baseButton;  // 2.011 +0x200 (interpolated)
    CCMenuItemSpriteExtra* m_detailButton;  // 2.011 +0x204 (interpolated)
    CCMenuItemSpriteExtra* m_textButton;  // 2.011 +0x208 (interpolated)
    CCMenuItemSpriteExtra* m_baseColorHSV;  // 2.011 +0x20c (interpolated)
    CCMenuItemSpriteExtra* m_detailColorHSV;  // 2.011 +0x210 (interpolated)
    cocos2d::CCLabelBMFont* m_titleLabel;  // 2.011 +0x214 (interpolated)
    cocos2d::CCLabelBMFont* m_selectedColorLabel;  // 2.011 +0x218 (voted)
    CCTextInputNode* m_customColorInput;  // 2.011 +0x21c (interpolated)
    CCTextInputNode* m_textInput;  // 2.011 +0x220 (interpolated)
    ButtonSprite* m_customColorButtonSprite;  // 2.011 +0x224 (interpolated)
    CCMenuItemSpriteExtra* m_customColorButton;  // 2.011 +0x228 (interpolated)
    CCMenuItemSpriteExtra* m_arrowDown;  // 2.011 +0x22c (interpolated)
    CCMenuItemSpriteExtra* m_arrowUp;  // 2.011 +0x230 (interpolated)
    cocos2d::extension::CCScale9Sprite* m_customColorInputBG;  // 2.011 +0x234 (interpolated)
    ColorChannelSprite* m_colorSprite;  // 2.011 +0x238 (interpolated)
    CCMenuItemSpriteExtra* m_colorSpriteButton;  // 2.011 +0x23c (interpolated)
    bool m_showTextInput;  // 2.011 +0x240 (voted)
    bool m_customColorSelected;  // 2.011 +0x241 (voted)
    PAD = win 0x2;
}

// GD 2.011 port: 2.1-only class, stub
class DailyLevelPage {
}

// GD 2.011 port: 2.1-only class, stub
class DialogLayer {
}

// GD 2.011 port: 2.1-only class, stub
class DialogDelegate {
}

// GD 2.011 port: 2.1-only class, stub
class DialogObject {
}

class DownloadMessageDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_0() = win 0x2ce50;  // 2.0 slot (downloadMessageFinished, types unknown)
    virtual void gd20_slot_1() = win 0x2ce50;  // 2.0 slot (downloadMessageFailed, types unknown)
}

class DrawGridLayer : cocos2d::CCLayer {
    static DrawGridLayer* get() {
        auto editorLayer = LevelEditorLayer::get();
        if (!editorLayer) return nullptr;
        return editorLayer->m_drawGridLayer;
    }

    bool init(cocos2d::CCNode* grid, LevelEditorLayer* editor) = mac 0x2729a0, win 0xfd890;
    virtual void draw() = mac 0xa3c40, win 0xfe2e0;
    virtual void update(float) = mac 0xa3b30, win 0xfe1d0;
    void clearPlayerPoints() {
        m_playerNodePoints->removeAllObjects();
        m_player2NodePoints->removeAllObjects();
    }

    void loadTimeMarkers(gd::string guidelines) = mac 0x94010, win 0xfdcb0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_125() = win 0xecf00;  // 2.0 slot, name unknown
    virtual void gd20_slot_126() = win 0xecf10;  // 2.0 slot (getEffectSortDirty, types unknown)
    virtual void setEffectSortDirty(bool) = win 0xecf20;
    virtual void gd20_slot_128() = win 0xdf10;  // 2.0 slot (getTimeNeedsUpdate, types unknown)
    virtual void gd20_slot_129() = win 0xecf30;  // 2.0 slot (getActiveGridNodeSize, types unknown)
    virtual void setActiveGridNodeSize(float) = win 0xecf40;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x118 ----
    PAD = win 0x18;
    bool m_effectSortDirty;  // 2.011 +0x130 (accessor)
    PAD = win 0x3;
    LevelEditorLayer* m_editor;  // 2.011 +0x134 (interpolated)
    gd::string m_guidelineString;  // 2.011 +0x138 (voted)
    cocos2d::CCNode* m_grid;  // 2.011 +0x150 (interpolated)
    cocos2d::CCArray* m_guidelines;  // 2.011 +0x154 (interpolated)
    cocos2d::CCArray* m_effects;  // 2.011 +0x158 (interpolated)
    cocos2d::CCArray* m_guides;  // 2.011 +0x15c (interpolated)
    cocos2d::CCArray* m_speedObjects1;  // 2.011 +0x160 (interpolated)
    cocos2d::CCArray* m_speedObjects2;  // 2.011 +0x164 (interpolated)
    cocos2d::CCArray* m_playerNodePoints;  // 2.011 +0x168 (interpolated)
    cocos2d::CCArray* m_player2NodePoints;  // 2.011 +0x16c (voted)
    PAD = win 0x1c;
    bool m_timeNeedsUpdate;  // 2.011 +0x18c (accessor)
    PAD = win 0x3;
    float m_activeGridNodeSize;  // 2.011 +0x190 (accessor)
    PAD = win 0x4;
}

class EditButtonBar : cocos2d::CCNode {
    void removeAllItems() {
        m_buttonArray->removeAllObjects();
        this->reloadItemsInNormalSize();
    }
    void reloadItems(int rowCount, int columnCount) {
        if (m_buttonArray)
            this->loadFromItems(m_buttonArray, rowCount, columnCount, m_unknown);
    }
    void reloadItemsInNormalSize() {
        // TODO: fix this
        // this->reloadItems(
        //     GameManager::sharedState()->getIntGameVariable("0049"),
        //     GameManager::sharedState()->getIntGameVariable("0050")
        // );
    }
    void addButton(CCMenuItemSpriteExtra* btn, bool reload) {
        if (m_buttonArray)
            m_buttonArray->addObject(btn);
        if (reload)
            this->reloadItemsInNormalSize();
    }

    void loadFromItems(cocos2d::CCArray* buttons, int rowCount, int columnCount, bool idk) = mac 0x351010, ios 0x2dd060, win 0x56060;
    static EditButtonBar* create(
        cocos2d::CCArray* buttons,
        cocos2d::CCPoint point,
        int idk, bool idk0,
        int rowCount, int columnCount
    ) = mac 0x350e60, win 0x55ed0;

    bool init(cocos2d::CCArray* buttons, int, bool, int rowCount, int columnCount, cocos2d::CCPoint pos);

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    cocos2d::CCPoint m_position;  // 2.011 +0xe8 (same own size)
    int m_unknown;  // 2.011 +0xf0 (same own size)
    bool m_unknownBool;  // 2.011 +0xf4 (same own size)
    PAD = win 0x3;
    cocos2d::CCArray* m_buttonArray;  // 2.011 +0xf8 (same own size)
    BoomScrollLayer* m_scrollLayer;  // 2.011 +0xfc (same own size)
    cocos2d::CCArray* m_pagesArray;  // 2.011 +0x100 (same own size)
}

class EditLevelLayer : cocos2d::CCLayer, TextInputDelegate, FLAlertLayerProtocol, UploadActionDelegate, UploadPopupDelegate {
    static cocos2d::CCScene* scene(GJGameLevel* level) {
        auto scene = cocos2d::CCScene::create();
        scene->addChild(EditLevelLayer::create(level));

        AppDelegate::get()->m_runningScene = scene;
        return scene;
    }

    static EditLevelLayer* create(GJGameLevel* level) = mac 0xe1e50, ios 0x82420, win 0x56f00;
    bool init(GJGameLevel* level) = mac 0xe1fd0, win 0x56fa0;
    void onLevelInfo(cocos2d::CCObject*) = mac 0xe4f60, win 0x57e50;
    void onPlay(cocos2d::CCObject*) = mac 0xe3ae0, win 0x58e10;
    void onEdit(cocos2d::CCObject*) = mac 0xe3970, win 0x591d0;
    void onShare(cocos2d::CCObject*) = mac 0xe3c60, win 0x59439;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x128 ----
    PAD = win 0x4;
    GJGameLevel* m_level;  // 2.011 +0x12c (voted)
    TextArea* m_descriptionInput;  // 2.011 +0x130 (voted)
    cocos2d::CCArray* m_someArray;  // 2.011 +0x134 (voted)
    PAD = win 0x24;
}

class EditorOptionsLayer : GJOptionsLayer {
    void onButtonsPerRow(cocos2d::CCObject*) = mac 0x147b30, win 0xd9f10;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class EditorPauseLayer : CCBlockLayer, FLAlertLayerProtocol {
    static EditorPauseLayer* get() {
        if (!EditorUI::get()) return nullptr;

        auto editor = LevelEditorLayer::get();
        for (auto i = 0u; i < editor->getChildrenCount(); ++i) {
            if (auto layer = cast::typeinfo_cast<EditorPauseLayer*>(editor->getChildren()->objectAtIndex(i))) {
                return layer;
            }
        }
        return nullptr;
    }
    static EditorPauseLayer* create(LevelEditorLayer* editor) {
        auto pRet = new EditorPauseLayer();
        if (pRet && pRet->init(editor)) {
            pRet->autorelease();
            return pRet;
        }
        CC_SAFE_DELETE(pRet);
        return nullptr;
    }
    inline EditorPauseLayer() {}
    ~EditorPauseLayer() = mac 0x13c3b0, win 0x5a520;
    virtual void keyBackClicked() = mac 0x13f320, win 0x5ca00;
    virtual void keyDown(cocos2d::enumKeyCodes) = mac 0x13f3a0, win 0x5ca20;
    virtual void customSetup() = mac 0x13cc00, win 0x5aa90;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = mac 0x13f1b0, win 0x5c8e0;
    void saveLevel() = mac 0x13ebd0, win 0x5c290;
    bool init(LevelEditorLayer*) = mac 0x13c7a0, ios 0x280cb8, win 0x5a6b0;
    void onExitEditor(cocos2d::CCObject* sender) = mac 0x13f180, win 0x5c7c0;
    void playStep2() = mac 0x13f040, win 0x5c620;
    void onResume(cocos2d::CCObject* sender) = mac 0x13e170, win 0x5c270;
    void onSaveAndPlay(cocos2d::CCObject* sender) = mac 0x13e1b0, win 0x5c5b0;
    void onSaveAndExit(cocos2d::CCObject* sender) = mac 0x13e230;
    void onSave(cocos2d::CCObject* sender) = mac 0x13e290;
    void onExitNoSave(cocos2d::CCObject* sender) = win 0x5c860;
    void uncheckAllPortals(cocos2d::CCObject* sender) = win 0x5b8f0;
    void onResetUnusedColors(cocos2d::CCObject* sender) = win 0x5b9b0;
    void doResetUnused();
    void updateSongButton() = mac 0x13e530, win 0x5c190;
    void onSong(cocos2d::CCObject*) = mac 0x13e470, win 0x5c090;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x19c ----
    bool m_saved;  // 2.011 +0x19c (voted)
    PAD = win 0x3;
    CCMenuItemSpriteExtra* m_guidelinesOffButton;  // 2.011 +0x1a0 (interpolated)
    CCMenuItemSpriteExtra* m_guidelinesOnButton;  // 2.011 +0x1a4 (interpolated)
    LevelEditorLayer* m_editorLayer;  // 2.011 +0x1a8 (voted)
}

class EditorUI : cocos2d::CCLayer, FLAlertLayerProtocol, ColorSelectDelegate, GJRotationControlDelegate, GJScaleControlDelegate, MusicDownloadDelegate {
    static EditorUI* get() {
        auto lel = LevelEditorLayer::get();
        if (!lel) return nullptr;
        return lel->m_editorUI;
    }
    inline EditorUI() {}
    bool editButton2Usable();
    inline void constrainGameLayerPosition() {
        this->constrainGameLayerPosition(-3.f, -6.f);
    }

    static EditorUI* create(LevelEditorLayer*) = mac 0x8a80, win 0x5d340;
    cocos2d::CCArray* createCustomItems() = mac 0x1ddf0, win 0x60b50;
    void onDeleteCustomItem(cocos2d::CCObject* pSender) = mac 0x29860, win 0x60a60;
    void onNewCustomItem(cocos2d::CCObject* pSender) = mac 0x24480, win 0x60770;
    void deselectAll() = mac 0x1f300, win 0x6aa00;
    void onDeselectAll(cocos2d::CCObject*) = mac 0x19cd0, win 0x6a990;
    void disableButton(CreateMenuItem*) = mac 0x1c0f0, win 0x5f200;
    void editButtonUsable() = mac 0x28f30, win 0x6c5e0;
    void editObject(cocos2d::CCObject*) = mac 0x195a0, win 0x6d950;
    void enableButton(CreateMenuItem*) = mac 0x1bff0, win 0x5f0b0;
    CCMenuItemSpriteExtra* getCreateBtn(int, int) = mac 0x1f6c0, win 0x69380;
    cocos2d::CCPoint getGroupCenter(cocos2d::CCArray*, bool) = mac 0x23470, win 0x6ffc0;
    cocos2d::CCArray* getSelectedObjects() = mac 0x23f30, win 0x6a7f0;
    bool init(LevelEditorLayer*) = mac 0x8ae0, win 0x5d3e0;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x2ed60, win 0x70a20;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x2f3d0, win 0x70ec0;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x2fb00, win 0x71340;
    virtual void keyDown(cocos2d::enumKeyCodes) = mac 0x30790, win 0x71ad0;
    virtual void keyUp(cocos2d::enumKeyCodes) = mac 0x312b0, win 0x72910;
    CreateMenuItem* menuItemFromObjectString(gd::string, int) = mac 0x1e130, win 0x68f50;
    void moveObject(GameObject*, cocos2d::CCPoint) = mac 0x24b10, win 0x6e330;
    void onDuplicate(cocos2d::CCObject*) = mac 0x18ba0, win 0x6b830;
    bool onCreate() = mac 0x1b960, win 0x698e0;
    void onCreateObject(int) = mac 0x200d0, win 0x699c0;
    gd::string copyObjects(cocos2d::CCArray* objects) = win 0x6b9b0;
    cocos2d::CCArray* pasteObjects(gd::string) = mac 0x232d0, win 0x6bd20;
    void playerTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x2ebf0, win 0x708f0;
    void playtestStopped() = mac 0x24790, win 0x6b340;
    void redoLastAction(cocos2d::CCObject*) = mac 0xb8e0, win 0x6abe0;
    void replaceGroupID(GameObject*, int, int) = mac 0x27470;
    virtual void scaleChangeBegin() = win 0x6c470;
    virtual void scaleChanged(float) = mac 0x25490, win 0x6c500;
    virtual void scaleChangeEnded() = win 0x6c4c0;
    void scaleObjects(cocos2d::CCArray*, float, cocos2d::CCPoint) = mac 0x252e0, win 0x6f6e0;
    void selectObjects(cocos2d::CCArray* objs, bool ignoreFilters) = mac 0x23940;
    void setupCreateMenu() = mac 0xcb50, win 0x62e70;
    void undoLastAction(cocos2d::CCObject*) = mac 0xb830, win 0x6ab30;
    void updateButtons() = mac 0x1a300, win 0x5ed00;
    void updateEditMenu() = win 0x6c5b0;
    void updateObjectInfoLabel() = mac 0x1cb10, win 0x5fb70;
    void updateSlider() = mac 0x18a90, win 0x5f590;
    void updateZoom(float) = mac 0x248c0, win 0x6b4e0;
    void selectObject(GameObject* obj, bool filter) = mac 0x1bd60;
    void deselectObject(GameObject* object) = mac 0x1f220, win 0x6a8e0;
    void deleteObject(GameObject* object, bool filter) = mac 0x1f130, win 0x62370;
    void selectAll() = mac 0x23fd0;
    void selectAllWithDirection(bool left) = mac 0x24210;
    cocos2d::CCPoint getTouchPoint(cocos2d::CCTouch* touch, cocos2d::CCEvent* event) = mac 0x2eb80, win 0x70890;
    cocos2d::CCPoint getGridSnappedPos(cocos2d::CCPoint pos) = mac 0x20b10, win 0x707b0;
    void onSelectBuildTab(cocos2d::CCObject* sender) = mac 0x1fb60, win 0x6bf10;
    void onCreateButton(cocos2d::CCObject* sender) = mac 0x1fd70, win 0x69740;
    CCMenuItemSpriteExtra* getSpriteButton(const char* sprite, cocos2d::SEL_MenuHandler callback, cocos2d::CCMenu* menu, float scale) = mac 0xb500, win 0x5f340;
    cocos2d::CCPoint offsetForKey(int objID);
    void updateDeleteMenu() = mac 0x1e960;
    void updateCreateMenu(bool updateTab) = mac 0x1ba80, win 0x69780;
    void toggleMode(cocos2d::CCObject* sender) = mac 0x187b0, win 0x61520;
    void zoomIn(cocos2d::CCObject* sender) = mac 0xc0c0, win 0x6b3e0;
    void zoomOut(cocos2d::CCObject* sender) = mac 0xc120, win 0x6b460;
    void rotateObjects(cocos2d::CCArray* objects, float angle, cocos2d::CCPoint center) = mac 0x236a0, win 0x6f410;
    void flipObjectsX(cocos2d::CCArray* objects) = mac 0x2ad10, win 0x6eb10;
    void flipObjectsY(cocos2d::CCArray* objects) = mac 0x2aee0, win 0x6ef90;
    void updateGridNodeSize() = mac 0x1c8a0, win 0x5f6b0;
    void updateScaleControl();  // GD 2.011 port: inline body needs m_selectedObject (no 2.0 offset)

    void updateSpecialUIElements();  // GD 2.011 port: needs updateScaleControl (no 2.0 address)
    void constrainGameLayerPosition(float x, float y) = mac 0x18890, win 0x5fa40;
    void moveGamelayer(cocos2d::CCPoint pos) = mac 0x1ca90;
    void showUI(bool show) = mac 0x245b0, win 0x6aca0;
    void resetUI() = mac 0x18520, win 0x61410;
    void editObject2(cocos2d::CCObject* sender);
    void editGroup(cocos2d::CCObject* sender) = win 0x6dda0;
    void moveObjectCall(cocos2d::CCObject* sender) = mac 0x29830, win 0x6e190;
    void moveObjectCall(EditCommand command) = mac 0x29b80, win 0x6e1b0;
    cocos2d::CCPoint* moveForCommand(cocos2d::CCPoint* point, EditCommand command); 
    void transformObjectCall(cocos2d::CCObject* sender) = mac 0x29860, win 0x6e520;
    void transformObjectCall(EditCommand command) = mac 0x29d90, win 0x6e540;
    void transformObject(GameObject* obj, EditCommand command, bool snap) = mac 0x2b0b0, win 0x6e810;
    void onDelete(cocos2d::CCObject* sender) = mac 0x1b3d0, win 0x62110;
    void onDeleteSelected(cocos2d::CCObject* sender) = mac 0xb990, win 0x62400;
    void onDeleteSelectedType(cocos2d::CCObject* sender) = mac 0x1e7a0, win 0x62770;
    void onDeleteStartPos(cocos2d::CCObject* sender) = mac 0x1e770, win 0x627f0;
    void onCopy(cocos2d::CCObject* sender) = mac 0x18dc0, win 0x6bad0;
    void onPaste(cocos2d::CCObject* sender) = mac 0x18ee0, win 0x6bc10;
    void tryUpdateTimeMarkers() = mac 0x1ca50, win 0x6c060;
    void toggleEnableRotate(cocos2d::CCObject* sender) = mac 0xb700, win 0x6a290;
    void toggleFreeMove(cocos2d::CCObject* sender) = mac 0xb610, win 0x6a1b0;
    void toggleSwipe(cocos2d::CCObject* sender) = mac 0xb490, win 0x6a0d0;
    void toggleSnap(cocos2d::CCObject* sender) = mac 0xb680, win 0x6a3c0;
    void onPlayback(cocos2d::CCObject* sender) = mac 0xbcb0, win 0x6adf0;
    void onPlaytest(cocos2d::CCObject* sender) = mac 0xbec0, win 0x6b200;
    void onStopPlaytest(cocos2d::CCObject* sender) = mac 0xbfd0, win 0x6b310;
    void onGroupUp(cocos2d::CCObject* sender) = mac 0x1a1a0, win 0x6de00;
    void onGroupDown(cocos2d::CCObject* sender) = mac 0x1a200, win 0x6de70;
    void selectBuildTab(int tab) = mac 0x1fb90, win 0x6bf30;
    void onPause(cocos2d::CCObject* sender) = mac 0x18650, win 0x5ea90;
    void onSettings(cocos2d::CCObject* sender) = win 0x5ea40;
    void activateRotationControl(cocos2d::CCObject* sender) = mac 0x24480, win 0x70200;
    void activateScaleControl(cocos2d::CCObject* sender) = mac 0x24c80, win 0x6c0a0;
    void deactivateScaleControl() = mac 0xb290, win 0x6c2f0;
    void dynamicGroupUpdate(bool idk);
    void createRockOutline();
    void createRockEdges();
    void createRockBase();
    void onCopyState(cocos2d::CCObject* sender);
    void onPasteColor(cocos2d::CCObject* sender) = mac 0x19f40;
    void onPasteState(cocos2d::CCObject* sender) = mac 0x19ee0;
    void onGroupSticky(cocos2d::CCObject* sender) = mac 0xc180;
    void onUngroupSticky(cocos2d::CCObject* sender) = mac 0xc1d0;
    void onGoToLayer(cocos2d::CCObject* sender) = mac 0x19fa0;
    void onGoToBaseLayer(cocos2d::CCObject* sender) = mac 0x1a270;
    void onToggleGuide(cocos2d::CCObject* sender) = mac 0x19da0, win 0x5f8e0;
    void editColor(cocos2d::CCObject* sender) = mac 0x19190;
    void alignObjects(cocos2d::CCArray* objs, bool alignY) = mac 0x2cea0;
    virtual void scrollWheel(float vertical, float horizontal) = mac 0x31370, ios 0x2c4884, win 0x72960;
    void createMoveMenu() = mac 0x275e0, win 0x6cf60;
    void sliderChanged(cocos2d::CCObject* slider) = mac 0xaed0, win 0x5f420;
    void repositionObjectsToCenter(cocos2d::CCArray* objs, cocos2d::CCPoint center, bool ignoreGroupParent) = mac 0x1fcd0, win 0x6be90;
    virtual void draw() = win 0x6ff70;
    float valueFromXPos(float val) = mac 0x1c810, win 0x6fe80;
    void processSelectObjects(cocos2d::CCArray*) = mac 0x24110;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_125() = win 0x2a210;  // 2.0 slot, name unknown
    virtual void gd20_slot_126() = win 0x5cd80;  // 2.0 slot (getStoredUndoObject, types unknown)
    virtual void setStoredUndoObject(UndoObject*) = win 0x5cd90;
    virtual void gd20_slot_128() = win 0xdee0;  // 2.0 slot (getLimitY, types unknown)
    virtual void gd20_slot_129() = win 0x5cdd0;  // 2.0 slot (getEditMode, types unknown)
    virtual void gd20_slot_130() = win 0x5cde0;  // 2.0 slot (setEditMode, types unknown)

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x12c ----
    EditButtonBar* m_buttonBar;  // 2.011 +0x12c (voted)
    PAD = win 0x4;
    cocos2d::CCArray* m_hideableUIElementArray;  // 2.011 +0x134 (interpolated)
    float m_gridSize;  // 2.011 +0x138 (voted)
    PAD = win 0x14;
    int m_rotationTouchID;  // 2.011 +0x150 (voted)
    int m_scaleTouchID;  // 2.011 +0x154 (interpolated)
    int m_touchID;  // 2.011 +0x158 (interpolated)
    cocos2d::CCLabelBMFont* m_objectInfoLabel;  // 2.011 +0x15c (voted)
    GJRotationControl* m_rotationControl;  // 2.011 +0x160 (voted)
    cocos2d::CCPoint m_scalePos;  // 2.011 +0x164 (voted)
    bool m_touchDown;  // 2.011 +0x16c (voted)
    PAD = win 0x3;
    GJScaleControl* m_scaleControl;  // 2.011 +0x170 (interpolated)
    cocos2d::CCDictionary* m_editButtonDict;  // 2.011 +0x174 (voted)
    EditButtonBar* m_createButtonBar;  // 2.011 +0x178 (interpolated)
    EditButtonBar* m_editButtonBar;  // 2.011 +0x17c (voted)
    PAD = win 0x17;
    bool m_updateTimeMarkers;  // 2.011 +0x197 (voted)
    PAD = win 0x20;
    CCMenuItemSpriteExtra* m_deleteModeBtn;  // 2.011 +0x1b8 (voted)
    CCMenuItemSpriteExtra* m_buildModeBtn;  // 2.011 +0x1bc (interpolated)
    CCMenuItemSpriteExtra* m_editModeBtn;  // 2.011 +0x1c0 (interpolated)
    CCMenuItemSpriteExtra* m_swipeBtn;  // 2.011 +0x1c4 (interpolated)
    CCMenuItemSpriteExtra* m_freeMoveBtn;  // 2.011 +0x1c8 (interpolated)
    CCMenuItemSpriteExtra* m_deselectBtn;  // 2.011 +0x1cc (interpolated)
    CCMenuItemSpriteExtra* m_snapBtn;  // 2.011 +0x1d0 (voted)
    PAD = win 0x74;
    int m_selectedCreateObjectID;  // 2.011 +0x248 (voted)
    cocos2d::CCArray* m_createButtonArray;  // 2.011 +0x24c (interpolated)
    cocos2d::CCArray* m_customObjectButtonArray;  // 2.011 +0x250 (voted)
    int m_selectedMode;  // 2.011 +0x254 (voted)
    LevelEditorLayer* m_editorLayer;  // 2.011 +0x258 (voted)
    PAD = win 0x28;
    cocos2d::CCArray* m_selectedObjects;  // 2.011 +0x284 (accessor)
    PAD = win 0x4;
    bool m_unk2cc;  // 2.011 +0x28c (interpolated)
    bool m_freeMovingObject;  // 2.011 +0x28d (interpolated)
    PAD = win 0x2;
    gd::string m_clipboard;  // 2.011 +0x290 (voted)
    PAD = win 0xc;
}

class EffectGameObject : GameObject {
    void updateLabel();  // GD 2.011 port: inline body needs m_itemBlockAID, m_targetColorID, m_targetGroupID (no 2.0 offset)


    static EffectGameObject* create(const char*) = mac 0xc9790, win 0x19e120;
    bool init(char const*) = win 0x19e1c0;
    void getTargetColorIndex() = mac 0xca1f0, win 0x19e900;
    virtual void triggerObject() = win 0x19e250;
    void triggerObject(GJBaseGameLayer*) { this->triggerObject(); }
    virtual gd::string getSaveString() = win 0x19ff90;
    void updateSpecialColor() = win 0x19e960;
    virtual void triggerActivated() = win 0xb22f0;
    void triggerActivated(float) { this->triggerActivated(); }
    void spawnXPosition() = win 0x19e9e0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_320() = win 0x19ca70;  // 2.0 slot (getTintColor, types unknown)
    virtual void setTintColor(cocos2d::ccColor3B) = win 0x19ca90;
    virtual void gd20_slot_322() = win 0x19cab0;  // 2.0 slot (getEffectDuration, types unknown)
    virtual void setEffectDuration(float) = win 0x19cac0;
    virtual void gd20_slot_324() = win 0x19cae0;  // 2.0 slot (getTargetOpacity, types unknown)
    virtual void setTargetOpacity(float) = win 0x19caf0;
    virtual void gd20_slot_326() = win 0x19cb10;  // 2.0 slot (getTargetID, types unknown)
    virtual void setTargetID(int) = win 0x19cb20;
    virtual void gd20_slot_328() = win 0x19cb30;  // 2.0 slot (getTintGround, types unknown)
    virtual void setTintGround(bool) = win 0x19cb40;
    virtual void gd20_slot_330() = win 0x19cb50;  // 2.0 slot (getCopyPlayerColor1, types unknown)
    virtual void setCopyPlayerColor1(bool) = win 0x19cb60;
    virtual void gd20_slot_332() = win 0x19cb70;  // 2.0 slot (getCopyPlayerColor2, types unknown)
    virtual void setCopyPlayerColor2(bool) = win 0x19cb80;
    virtual void gd20_slot_334() = win 0x19cb90;  // 2.0 slot (getCustomColorBlend, types unknown)
    virtual void setCustomColorBlend(bool) = win 0x19cba0;
    virtual void gd20_slot_336() = win 0x19cbb0;  // 2.0 slot (getMoveCommandPos, types unknown)
    virtual void setMoveCommandPos(cocos2d::CCPoint) = win 0x19cbd0;
    virtual void gd20_slot_338() = win 0x19cbf0;  // 2.0 slot (getMoveCommandEasing, types unknown)
    virtual void setMoveCommandEasing(int) = win 0x19cc00;
    virtual void gd20_slot_340() = win 0x19cc10;  // 2.0 slot (getMoveLockX, types unknown)
    virtual void setMoveLockX(bool) = win 0x19cc20;
    virtual void gd20_slot_342() = win 0x19cc30;  // 2.0 slot (getMoveLockY, types unknown)
    virtual void setMoveLockY(bool) = win 0x19cc40;
    virtual void gd20_slot_344() = win 0x19cc50;  // 2.0 slot (getFadeInTime, types unknown)
    virtual void setFadeInTime(float) = win 0x19cc60;
    virtual void gd20_slot_346() = win 0x19cc80;  // 2.0 slot (getHoldTime, types unknown)
    virtual void setHoldTime(float) = win 0x19cc90;
    virtual void gd20_slot_348() = win 0x19ccb0;  // 2.0 slot (getFadeOutTime, types unknown)
    virtual void setFadeOutTime(float) = win 0x19ccc0;
    virtual void gd20_slot_350() = win 0x19cce0;  // 2.0 slot (getPulseMode, types unknown)
    virtual void setPulseMode(int) = win 0x19ccf0;
    virtual void gd20_slot_352() = win 0x19cd00;  // 2.0 slot (getPulseTargetType, types unknown)
    virtual void setPulseTargetType(int) = win 0x19cd10;
    virtual void gd20_slot_354() = win 0x19cd20;  // 2.0 slot (getHSVValue, types unknown)
    virtual void setHSVValue(cocos2d::ccHSVValue) = win 0x19cd40;
    virtual void gd20_slot_356() = win 0x19cd60;  // 2.0 slot (getCopyColorIdx, types unknown)
    virtual void setCopyColorIdx(int) = win 0x19cd70;
    virtual void gd20_slot_358() = win 0x19cd80;  // 2.0 slot (getCopyOpacity, types unknown)
    virtual void setCopyOpacity(bool) = win 0x19cd90;
    virtual void gd20_slot_360() = win 0x19cda0;  // 2.0 slot (getGroupMainOnly, types unknown)
    virtual void setGroupMainOnly(bool) = win 0x19cdb0;
    virtual void gd20_slot_362() = win 0x19cdc0;  // 2.0 slot (getGroupSecondaryOnly, types unknown)
    virtual void setGroupSecondaryOnly(bool) = win 0x19cdd0;
    virtual void gd20_slot_364() = win 0x19cde0;  // 2.0 slot (getEnableGroup, types unknown)
    virtual void setEnableGroup(bool) = win 0x19cdf0;
    virtual void gd20_slot_366() = win 0x19ce00;  // 2.0 slot (getSpawnDelay, types unknown)
    virtual void setSpawnDelay(float) = win 0x19ce10;
    virtual void gd20_slot_368() = win 0x19ce30;  // 2.0 slot (getEffectSpawnPos, types unknown)
    virtual void setEffectSpawnPos(float) = win 0x19ce40;
    virtual void gd20_slot_370() = win 0x19ce60;  // 2.0 slot (getEffectOrder, types unknown)
    virtual void setEffectOrder(int) = win 0x19ce70;
    virtual void gd20_slot_372() = win 0x19ce80;  // 2.0 slot (getNextObject, types unknown)
    virtual void setNextObject(EffectGameObject*) = win 0x19ce90;
    virtual void gd20_slot_374() = win 0x19cea0;  // 2.0 slot (getFromColor, types unknown)
    virtual void setFromColor(cocos2d::ccColor3B) = win 0x19cec0;
    virtual void gd20_slot_376() = win 0x19cee0;  // 2.0 slot (getToColor, types unknown)
    virtual void setToColor(cocos2d::ccColor3B) = win 0x19cf00;
    virtual void gd20_slot_378() = win 0x19cf20;  // 2.0 slot (getFromOpacity, types unknown)
    virtual void setFromOpacity(float) = win 0x19cf30;
    virtual void gd20_slot_380() = win 0x19cf50;  // 2.0 slot (getToOpacity, types unknown)
    virtual void setToOpacity(float) = win 0x19cf60;
    virtual void gd20_slot_382() = win 0x19cf80;  // 2.0 slot (getStartTime, types unknown)
    virtual void setStartTime(float) = win 0x19cf90;
    virtual void gd20_slot_384() = win 0x19cfb0;  // 2.0 slot (getWasProcessed, types unknown)
    virtual void setWasProcessed(bool) = win 0x19cfc0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x3e0 ----
    PAD = win 0x10;
    bool m_tintGround;  // 2.011 +0x3f0 (accessor)
    bool m_playerColor1;  // 2.011 +0x3f1 (interpolated)
    bool m_playerColor2;  // 2.011 +0x3f2 (interpolated)
    bool m_blending;  // 2.011 +0x3f3 (interpolated)
    cocos2d::CCPoint m_move;  // 2.011 +0x3f4 (voted)
    PAD = win 0x8;
    float m_fadeInTime;  // 2.011 +0x404 (accessor)
    float m_holdTime;  // 2.011 +0x408 (accessor)
    float m_fadeOutTime;  // 2.011 +0x40c (accessor)
    int m_pulseHSVMode;  // 2.011 +0x410 (interpolated)
    int m_pulseGroupMode;  // 2.011 +0x414 (interpolated)
    cocos2d::ccHSVValue m_hsvValue;  // 2.011 +0x418 (accessor)
    int m_copyColorID;  // 2.011 +0x428 (interpolated)
    bool m_copyOpacity;  // 2.011 +0x42c (accessor)
    PAD = win 0x2;
    bool m_activateGroup;  // 2.011 +0x42f (voted)
    float m_spawnDelay;  // 2.011 +0x430 (accessor)
    PAD = win 0x24;
}

class EndLevelLayer : GJDropDownLayer {
    static EndLevelLayer* create() = mac 0x2787d0, win 0x74a90;

    void customSetup() = win 0x74c00;
    const char* getCoinString(void* p0);
    const char* getEndText() = win 0x762e0;
    void onMenu(cocos2d::CCObject* sender) = mac 0x27a500, win 0x76810;
    void onEdit(cocos2d::CCObject* sender) = mac 0x27a640, win 0x768f0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class EndPortalObject : GameObject {
    static EndPortalObject* create() = mac 0x1da8f0;
    void updateColors(cocos2d::_ccColor3B) = mac 0x1dacb0, win 0x789e0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class ExtendedLayer : cocos2d::CCLayer {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_125() = win 0xe080;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(BoomScrollLayerDelegate*) = win 0xe090;
}

class FLAlertLayer : cocos2d::CCLayerColor {
    inline virtual ~FLAlertLayer() {
        cocos2d::CCDirector::sharedDirector()->getTouchDispatcher()->decrementForcePrio(2);
    }
    inline FLAlertLayer() {
        m_buttonMenu = nullptr;
        m_controlConnected = -1;
        m_mainLayer = nullptr;
        m_ZOrder = 0;
        m_noElasticity = false;
        m_reverseKeyBack = false;
        m_scene = nullptr;
        m_alertProtocol = nullptr;
        m_scrollingLayer = nullptr;
        m_button2 = nullptr;
        m_button1 = nullptr;
        m_joystickConnected = -1;
        m_containsBorder = 0;
    }

    static FLAlertLayer* create(char const* title, const gd::string& desc, char const* btn) {
        return FLAlertLayer::create(nullptr, title, desc, btn, nullptr, 300.0);
    }

    virtual void onEnter() = mac 0x25f350, win 0x20170;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x25ee40, win 0x1fde0;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x25f0a0, win 0x1ff30;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x25ef60, win 0x1fe70;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x25f020, win 0x1fee0;
    virtual void registerWithTouchDispatcher() = mac 0x25f2e0, win 0x20110;
    virtual void keyBackClicked() = mac 0x25ed90, win 0x1fcc0;
    virtual void keyDown(cocos2d::enumKeyCodes) = mac 0x25ece0, win 0x1fc50;

    bool init(
        FLAlertLayerProtocol* protocol,
        char const* title,
        gd::string content,
        char const* btn1,
        char const* btn2,
        float width,
        bool scrollable,
        float height
    ) = mac 0x25e1b0, win 0x1f2d0;
    static FLAlertLayer* create(FLAlertLayerProtocol* protocol, char const* title, gd::string content, char const* btn1, char const* btn2) = mac 0x25de00, win 0x1f070;
    static FLAlertLayer* create(FLAlertLayerProtocol* protocol, char const* title, gd::string content, char const* btn1, char const* btn2, float width) = mac 0x25e0e0, ios 0x1fe374, win 0x1f120;
    static FLAlertLayer* create(FLAlertLayerProtocol* protocol, char const* title, gd::string content, char const* btn1, char const* btn2, float width, bool scrollable, float height) = mac 0x25dec0, win 0x1f1d0;
    // GD 2.011 port (v3): 2.2 added a text scale; 2.0 has none
    static FLAlertLayer* create(FLAlertLayerProtocol* protocol, char const* title, gd::string content, char const* btn1, char const* btn2, float width, bool scrollable, float height, float textScale) {
        return FLAlertLayer::create(protocol, title, content, btn1, btn2, width, scrollable, height);
    }
    void onBtn1(cocos2d::CCObject*) = mac 0x25ec20, win 0x1fd40;
    void onBtn2(cocos2d::CCObject*) = mac 0x25ec80, win 0x1fd90;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void show() = mac 0x25f120, ios 0x1feff4, win 0x1ff80;
    virtual void gd20_slot_129() = win 0x1eeb0;  // 2.0 slot (getPParent, types unknown)
    virtual void setPParent(FLAlertLayerProtocol*) = win 0xdfa0;
    virtual void gd20_slot_131() = win 0xdfb0;  // 2.0 slot (getTargetScene, types unknown)
    virtual void setTargetScene(cocos2d::CCNode*) = win 0x1eec0;
    virtual void gd20_slot_133() = win 0x1eed0;  // 2.0 slot (getReverseKeyBack, types unknown)
    virtual void setReverseKeyBack(bool) = win 0x1eee0;
    virtual void gd20_slot_135() = win 0xdff0;  // 2.0 slot (getInternalLayer, types unknown)
    virtual void gd20_slot_136() = win 0x1eef0;  // 2.0 slot (getZValue, types unknown)
    virtual void setZValue(int) = win 0x1ef00;
    virtual void gd20_slot_138() = win 0x1ef10;  // 2.0 slot (getShowInstant, types unknown)
    virtual void setShowInstant(bool) = win 0x1ef20;
    virtual void gd20_slot_140() = win 0x1ef30;  // 2.0 slot (getBtn1, types unknown)
    virtual void setBtn1(ButtonSprite*) = win 0x1ef40;
    virtual void gd20_slot_142() = win 0x1ef50;  // 2.0 slot (getBtn2, types unknown)
    virtual void setBtn2(ButtonSprite*) = win 0x1ef60;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x194 ----
    cocos2d::CCMenu* m_buttonMenu;  // 2.011 +0x194 (same own size)
    int m_controlConnected;  // 2.011 +0x198 (same own size)
    FLAlertLayerProtocol* m_alertProtocol;  // 2.011 +0x19c (same own size)
    cocos2d::CCNode* m_scene;  // 2.011 +0x1a0 (same own size)
    bool m_reverseKeyBack;  // 2.011 +0x1a4 (same own size)
    cocos2d::ccColor3B m_color;  // 2.011 +0x1a5 (same own size)
    cocos2d::CCLayer* m_mainLayer;  // 2.011 +0x1a8 (same own size)
    int m_ZOrder;  // 2.011 +0x1ac (same own size)
    bool m_noElasticity;  // 2.011 +0x1b0 (same own size)
    cocos2d::ccColor3B m_color2;  // 2.011 +0x1b1 (same own size)
    ButtonSprite* m_button1;  // 2.011 +0x1b4 (same own size)
    ButtonSprite* m_button2;  // 2.011 +0x1b8 (same own size)
    ScrollingLayer* m_scrollingLayer;  // 2.011 +0x1bc (same own size)
    int m_joystickConnected;  // 2.011 +0x1c0 (same own size)
    bool m_containsBorder;  // 2.011 +0x1c4 (same own size)
    bool m_noAction;  // 2.011 +0x1c5 (same own size)
    PAD = win 0x2;
}

class FLAlertLayerProtocol {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) {}
}

class FMODAudioEngine : cocos2d::CCNode {
    static FMODAudioEngine* sharedEngine() = mac 0x20ef80, win 0x20430;
    void setupAudioEngine() = win 0x204b0;
    void preloadEffect(gd::string filename) = win 0x20c30;
    bool isBackgroundMusicPlaying() = win 0x20a30;
    bool isBackgroundMusicPlaying(gd::string path);
    void playBackgroundMusic(gd::string path, bool fade, bool paused) = win 0x207c0;
    void setBackgroundMusicTime(float time) = win 0x209f0;

    virtual void update(float) = win 0x20560;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0xd0e0;  // 2.0 slot (getTimeOffset, types unknown)
    virtual void setTimeOffset(int) = win 0xd0f0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    cocos2d::CCDictionary* m_dictionary;  // 2.011 +0xe8 (same own size)
    gd::string m_filePath;  // 2.011 +0xec (same own size)
    float m_backgroundMusicVolume;  // 2.011 +0x104 (same own size)
    float m_effectsVolume;  // 2.011 +0x108 (same own size)
    float m_pulse1;  // 2.011 +0x10c (same own size)
    float m_pulse2;  // 2.011 +0x110 (same own size)
    float m_pulse3;  // 2.011 +0x114 (same own size)
    int m_pulseCounter;  // 2.011 +0x118 (same own size)
    bool m_metering;  // 2.011 +0x11c (same own size)
    bool m_fading;  // 2.011 +0x11d (same own size)
    bool m_fadeIn;  // 2.011 +0x11e (same own size)
    PAD = win 0x1;
    float m_fadeInDuration;  // 2.011 +0x120 (same own size)
    FMOD::System* m_system;  // 2.011 +0x124 (same own size)
    FMOD::Sound* m_sound;  // 2.011 +0x128 (same own size)
    FMOD::Channel* m_currentSoundChannel;  // 2.011 +0x12c (same own size)
    FMOD::Channel* m_globalChannel;  // 2.011 +0x130 (same own size)
    FMOD::DSP* m_DSP;  // 2.011 +0x134 (same own size)
    FMOD_RESULT m_lastResult;  // 2.011 +0x138 (same own size)
    int m_version;  // 2.011 +0x13c (same own size)
    void* m_extraDriverData;  // 2.011 +0x140 (same own size)
    int m_musicOffset;  // 2.011 +0x144 (same own size)
}

class FMODSound : cocos2d::CCNode {
    static FMODSound* create(FMOD::Sound* sound);

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x202a0;  // 2.0 slot (getSound, types unknown)
    virtual void setSound(FMOD::Sound*) = win 0x202b0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    FMOD::Sound* m_sound;  // 2.011 +0xe8 (accessor)
}

class FriendRequestDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_0() = win 0xd060;  // 2.0 slot (loadFRequestsFinished, types unknown)
    virtual void gd20_slot_1() = win 0xd060;  // 2.0 slot (loadFRequestsFailed, types unknown)
    virtual void setupPageInfo(gd::string, char const*) = win 0x78e20;
    virtual void gd20_slot_3() = win 0x2ce50;  // 2.0 slot (forceReloadRequests, types unknown)
}

class FriendsProfilePage : FLAlertLayer, FLAlertLayerProtocol, UploadActionDelegate, UploadPopupDelegate, UserListDelegate {
    static FriendsProfilePage* create(UserListType) = mac 0x3a9570, win 0x7b260;
    bool init(UserListType) = mac 0x3a9770, win 0x7b310;
    void getUserListFinished(cocos2d::CCArray* arr, UserListType listType) = win 0x7bbf0;
    void getUserListFailed(UserListType listType, GJErrorCode errorCode) = win 0x7bd90;
    void forceReloadList(UserListType listType) = win 0x7be00;
    void setupUsersBrowser(cocos2d::CCArray* users, UserListType listType) = win 0x7ba10;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class GJAccountBackupDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual bool backupAccountFinished() {
        return false;
    }
    virtual bool backupAccountFailed(BackupAccountError) {
        return false;
    }
}

class GJAccountDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual bool accountStatusChanged() {
        return false;
    }
}

class GJAccountLoginDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual bool loginAccountFinished(int, int) {
        return false;
    }
    virtual bool loginAccountFailed(AccountError) {
        return false;
    }
}

class GJAccountManager : cocos2d::CCNode {
    static GJAccountManager* sharedState() = mac 0x85070, win 0xbd5a0;
    static GJAccountManager* get() {
        return GJAccountManager::sharedState();
    }
    gd::string getGJP() = mac 0x89520, win 0xbfcb0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x7e2d0;  // 2.0 slot, name unknown
    virtual void gd20_slot_108() = win 0x7e380;  // 2.0 slot, name unknown
    virtual void gd20_slot_109() = win 0x7dc30;  // 2.0 slot, name unknown
    virtual void gd20_slot_110() = win 0x7dc50;  // 2.0 slot (getRegisterDelegate, types unknown)
    virtual void gd20_slot_111() = win 0x7dc60;  // 2.0 slot (setRegisterDelegate, types unknown)
    virtual void gd20_slot_112() = win 0x7dc70;  // 2.0 slot (getLoginDelegate, types unknown)
    virtual void setLoginDelegate(GJAccountLoginDelegate*) = win 0x7dc80;
    virtual void gd20_slot_114() = win 0x7dc90;  // 2.0 slot (getAccountDelegate, types unknown)
    virtual void setAccountDelegate(GJAccountDelegate*) = win 0x7dca0;
    virtual void gd20_slot_116() = win 0x5d120;  // 2.0 slot (getBackupDelegate, types unknown)
    virtual void setBackupDelegate(GJAccountBackupDelegate*) = win 0x5d130;
    virtual void gd20_slot_118() = win 0x7dcb0;  // 2.0 slot (getSyncDelegate, types unknown)
    virtual void setSyncDelegate(GJAccountSyncDelegate*) = win 0x7dcc0;
    virtual void gd20_slot_120() = win 0x7d930;  // 2.0 slot (getSettingsDelegate, types unknown)
    virtual void gd20_slot_121() = win 0x7dcd0;  // 2.0 slot (setSettingsDelegate, types unknown)

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    PAD = win 0x4;
    gd::string m_password;  // 2.011 +0xec (voted)
    gd::string m_username;  // 2.011 +0x104 (manual)
    int m_accountID;  // 2.011 +0x11c (manual)
    PAD = win 0x18;
}

class GJAccountSyncDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual bool syncAccountFinished() {
        return false;
    }
    virtual bool syncAccountFailed(BackupAccountError) {
        return false;
    }
}

class GJBaseGameLayer : cocos2d::CCLayer {
    cocos2d::CCLayer* getObjectLayer();  // GD 2.011 port: inline body needs m_objectLayer (no 2.0 offset)

    cocos2d::CCArray* getAllObjects();  // GD 2.011 port: inline body needs m_objects (no 2.0 offset)


    static GJBaseGameLayer* get() {
        return PlayLayer::get() ? static_cast<GJBaseGameLayer*>(PlayLayer::get()) : static_cast<GJBaseGameLayer*>(LevelEditorLayer::get());
    }

    inline GJBaseGameLayer() {}
    virtual bool init() = mac 0xafc90, win 0x1a64d6;
    void addObjectCounter(LabelGameObject*, int) = mac 0xb9eb0;
    void addToGroups(GameObject*, bool) = mac 0xb7780;
    void atlasValue(int) = mac 0xb21e0;
    void bumpPlayer(PlayerObject*, GameObject*) = mac 0xb6860;
    void calculateOpacityValues(EffectGameObject*, EffectGameObject*, float, GJEffectManager*) = mac 0xb5be0, win 0xc0fe0;
    void checkSpawnObjects() = mac 0xb6f90;
    void collectItem(int, int) = mac 0xb9e20;
    void collectedObject(EffectGameObject*) = mac 0xb9b60;
    void createTextLayers() = mac 0xb5260, win 0xc0d10;
    cocos2d::CCArray* damagingObjectsInRect(cocos2d::CCRect) = mac 0xb6140;
    void enableHighCapacityMode() = mac 0xb11e0;
    gd::string getCapacityString() = mac 0xb2210, win 0xc07c0;
    void getGroundHeightForMode(int) = mac 0xb6630;
    void getGroup(int) = mac 0xb6f20;
    void getMoveDeltaForObjects(int, int) = mac 0xb6db0;
    void getOptimizedGroup(int) = mac 0xb7940;
    void getStaticGroup(int) = mac 0xb79a0;
    void isGroupDisabledForObject(GameObject*) = mac 0xb5cc0, win 0xc12f0;
    void isGroupDisabledForObjectFull(GameObject*, cocos2d::CCArray*) = mac 0xb5de0, win 0xc1400;
    void loadUpToPosition(float) = mac 0xba680;
    void objectIntersectsCircle(GameObject*, GameObject*) = mac 0xb66e0;
    void objectTriggered(EffectGameObject*) = mac 0xb71b0;
    void optimizeMoveGroups() = mac 0xb96c0;
    cocos2d::CCNode* parentForZLayer(int, bool, int) = mac 0xb55d0, win 0xc0ea0;
    void playerTouchedRing(PlayerObject*, GameObject*) = mac 0xb69e0;
    void processColorObject(EffectGameObject*, int, cocos2d::CCDictionary*, float, GJEffectManager*) = mac 0xb5a90;
    void processFollowActions() = mac 0xb8fd0;
    void processMoveActions() = mac 0xb86c0;
    void processMoveActionsStep(float) = mac 0xb7ea0;
    void processOpacityObject(EffectGameObject*, cocos2d::CCDictionary*, float, GJEffectManager*) = mac 0xb5ae0;
    void processPlayerFollowActions(float) = mac 0xb8b50;
    void processRotationActions() = mac 0xb7fd0;
    void pushButton(int, bool) = mac 0xb9920;
    void rectIntersectsCircle(cocos2d::CCRect, cocos2d::CCPoint, float) = mac 0xb6470;
    void refreshCounterLabels() = mac 0xb9fc0;
    void releaseButton(int, bool) = mac 0xb9a00;
    void removeFromGroups(GameObject*) = mac 0xb7a00;
    void removeObjectFromSection(GameObject*) = mac 0xb7e00;
    void reorderObjectSection(GameObject*) = mac 0xb7cb0;
    void resetGroupCounters(bool) = mac 0xba300;
    void resetMoveOptimizedValue() = mac 0xb9670;
    // inlined on windows
    int sectionForPos(float x) {
        int section = x / 100;
        if (section < 0) section = 0;
        return section;
    }
    void setupLayers() = mac 0xaffe0, win 0xbff70;
    void shouldExitHackedLevel() = mac 0xb1100;
    void spawnGroupTriggered(int, float, int) = mac 0xb7020;
    cocos2d::CCArray* staticObjectsInRect(cocos2d::CCRect) = mac 0xb5f90;
    void testInstantCountTrigger(int, int, int, bool, int) = mac 0xb9ae0;
    void toggleGroup(int, bool) = mac 0xb75f0;
    void togglePlayerVisibility(bool) = mac 0xba910;
    void triggerMoveCommand(EffectGameObject*) = mac 0xb7290;
    void updateCollisionBlocks() = mac 0xb6a30;
    void updateCounters(int, int) = mac 0xb9bc0;
    void updateDisabledObjectsLastPos(cocos2d::CCArray*) = mac 0xb95b0;
    void updateLayerCapacity(gd::string) = mac 0xb1680, win 0xc0530;
    void updateLegacyLayerCapacity(int, int, int, int) = mac 0xb1590, win 0xc0460;
    void updateOBB2(cocos2d::CCRect) = mac 0xb63f0;
    void updateQueuedLabels() = mac 0xb9f30;
    virtual ~GJBaseGameLayer() = mac 0xaf990, win 0xec8f0;

    void objectsCollided(int, int) = mac 0xb6d90;
    void createMoveCommand(cocos2d::CCPoint, int, float, int, float, bool, bool, int) = mac 0xb73a0;
    void updateColor(cocos2d::_ccColor3B, float, int, bool, float, cocos2d::_ccHSVValue, int, bool, int, EffectGameObject*) = mac 0xb7420;
    void toggleGroupTriggered(int, bool) = mac 0xb75a0;
    void spawnGroup(int) = mac 0xb7050;
    void addToSection(GameObject*) = mac 0xb7b70;
    void addToGroup(GameObject*, int, bool) = mac 0xb77f0;
    void removeFromGroup(GameObject*, int) = mac 0xb7a60;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void flipGravity(PlayerObject*, bool, bool) {}
    virtual float timeForXPos(float) = win 0xbfe60;
    virtual void calculateColorValues(EffectGameObject*, EffectGameObject*, int, float, ColorActionSprite*, GJEffectManager*) = mac 0xba9a0, win 0xbfe70;
    virtual void gd20_slot_128() = win 0xe080;  // 2.0 slot, name unknown
    virtual void gd20_slot_129() = win 0x7dc30;  // 2.0 slot, name unknown
    virtual void gd20_slot_130() = win 0x7dc50;  // 2.0 slot, name unknown
    virtual void gd20_slot_131() = win 0x7dc70;  // 2.0 slot, name unknown
    virtual void gd20_slot_132() = win 0x7dc90;  // 2.0 slot, name unknown
    virtual void gd20_slot_133() = win 0x5d120;  // 2.0 slot, name unknown
    virtual void gd20_slot_134() = win 0x7dcb0;  // 2.0 slot, name unknown
    virtual void gd20_slot_135() = win 0x7d930;  // 2.0 slot, name unknown
    virtual void gd20_slot_136() = win 0x17680;  // 2.0 slot, name unknown
    virtual void gd20_slot_137() = win 0x176a0;  // 2.0 slot, name unknown
    virtual void gd20_slot_138() = win 0x176c0;  // 2.0 slot, name unknown
    virtual void gd20_slot_139() = win 0xd0e0;  // 2.0 slot, name unknown
    virtual void gd20_slot_140() = win 0x5cd80;  // 2.0 slot, name unknown
    virtual void gd20_slot_141() = win 0x7dcf0;  // 2.0 slot, name unknown
    virtual void gd20_slot_142() = win 0x7dd10;  // 2.0 slot, name unknown
    virtual void gd20_slot_143() = win 0x5ced0;  // 2.0 slot, name unknown
    virtual void gd20_slot_144() = win 0xdd50;  // 2.0 slot, name unknown
    virtual void gd20_slot_145() = win 0x5cf00;  // 2.0 slot, name unknown
    virtual void gd20_slot_146() = win 0x9a3f0;  // 2.0 slot, name unknown
    virtual void gd20_slot_147() = win 0x7c4a0;  // 2.0 slot, name unknown
    virtual void gd20_slot_148() = win 0x2cf40;  // 2.0 slot, name unknown
    virtual void gd20_slot_149() = win 0x7c4e0;  // 2.0 slot, name unknown
    virtual void gd20_slot_150() = win 0xbfe80;  // 2.0 slot (getToggleDataDirty, types unknown)
    virtual void setToggleDataDirty(bool) = win 0xbfe90;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x118 ----
    PAD = win 0x4c;
    PlayerObject* m_player1;  // 2.011 +0x164 (manual)
    PlayerObject* m_player2;  // 2.011 +0x168 (manual)
    LevelSettingsObject* m_levelSettings;  // 2.011 +0x16c (manual)
    OBB2D* m_boundingBox;  // 2.011 +0x170 (voted)
    PAD = win 0x4;
}

// GD 2.011 port: 2.1-only class, stub
class GJChallengeDelegate {
}

// GD 2.011 port: 2.1-only class, stub
class GJChallengeItem {
}

class GJColorSetupLayer : FLAlertLayer, ColorSelectDelegate, FLAlertLayerProtocol {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_144() = win 0xc1660;  // 2.0 slot (getCloseOnSelect, types unknown)
    virtual void setCloseOnSelect(bool) = win 0xc1670;
    virtual void gd20_slot_146() = win 0x2f8e0;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(ColorSetupDelegate*) = win 0x7d040;
}

class GJComment : cocos2d::CCNode {
    ~GJComment() = mac 0x2dfd70;
    virtual bool init() = mac 0x2dfec0, win 0x99fb0;
    static GJComment* create(cocos2d::CCDictionary* dict);

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x7db10;  // 2.0 slot (getComment, types unknown)
    virtual void setComment(gd::string) = win 0x7db50;
    virtual void gd20_slot_109() = win 0x211d0;  // 2.0 slot (getUserName, types unknown)
    virtual void setUserName(gd::string) = win 0x7dbc0;
    virtual void gd20_slot_111() = win 0xe080;  // 2.0 slot (getCommentID, types unknown)
    virtual void setCommentID(long) = win 0xe090;
    virtual void gd20_slot_113() = win 0x7dc30;  // 2.0 slot (getUserID, types unknown)
    virtual void setUserID(int) = win 0x7dc40;
    virtual void gd20_slot_115() = win 0x7dc50;  // 2.0 slot (getLikes, types unknown)
    virtual void setLikes(int) = win 0x7dc60;
    virtual void gd20_slot_117() = win 0x7dc70;  // 2.0 slot (getDislikes, types unknown)
    virtual void setDislikes(int) = win 0x7dc80;
    virtual void gd20_slot_119() = win 0x7dc90;  // 2.0 slot (getLevelID, types unknown)
    virtual void setLevelID(int) = win 0x7dca0;
    virtual void gd20_slot_121() = win 0x7e590;  // 2.0 slot (getIsHidden, types unknown)
    virtual void setIsHidden(bool) = win 0x7e5a0;
    virtual void gd20_slot_123() = win 0x7dcb0;  // 2.0 slot (getAccountID, types unknown)
    virtual void setAccountID(int) = win 0x7dcc0;
    virtual void gd20_slot_125() = win 0x7c340;  // 2.0 slot (getCommentDate, types unknown)
    virtual void setCommentDate(gd::string) = win 0x7c380;
    virtual void gd20_slot_127() = win 0x17760;  // 2.0 slot (getDeleted, types unknown)
    virtual void setDeleted(bool) = win 0x17770;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    PAD = win 0x18;
    gd::string m_userName;  // 2.011 +0x100 (accessor)
    int m_commentID;  // 2.011 +0x118 (accessor)
    int m_userID;  // 2.011 +0x11c (accessor)
    PAD = win 0x8;
    int m_levelID;  // 2.011 +0x128 (accessor)
    bool m_isSpam;  // 2.011 +0x12c (interpolated)
    PAD = win 0x3;
    int m_accountID;  // 2.011 +0x130 (accessor)
}

class GJCommentListLayer : cocos2d::CCLayerColor {
    ~GJCommentListLayer() = mac 0x1482a0;
    static GJCommentListLayer* create(BoomListView*, char const*, cocos2d::_ccColor4B, float, float, bool) = mac 0x147d00;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_128() = win 0x26080;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x194 ----
    BoomListView* m_list;  // 2.011 +0x194 (same own size)
}

// GD 2.011 port: 2.1-only class, stub
class GJDailyLevelDelegate {
}

class GJDropDownLayer : cocos2d::CCLayerColor {

    static GJDropDownLayer* create(const char* title, float height) {
        GJDropDownLayer* pRet = new GJDropDownLayer();
        if (pRet && pRet->init(title, height)) {
            pRet->autorelease();
            return pRet;
        }
        CC_SAFE_DELETE(pRet);
        return nullptr;
    }
    
    virtual bool ccTouchBegan(cocos2d::CCTouch* pTouch, cocos2d::CCEvent* pEvent) {
        return true;
    }
    virtual void ccTouchMoved(cocos2d::CCTouch* pTouch, cocos2d::CCEvent* pEvent) {}
    virtual void ccTouchEnded(cocos2d::CCTouch* pTouch, cocos2d::CCEvent* pEvent) {}
    virtual void ccTouchCancelled(cocos2d::CCTouch* pTouch, cocos2d::CCEvent* pEvent) {}

    virtual void draw() = mac 0x352910, win 0x133a0;
    bool init(const char* title, float height) = mac 0x352100, ios 0x297afc, win 0xc2470;
    virtual void registerWithTouchDispatcher() = mac 0x3525f0, win 0x132b0;
    virtual void keyBackClicked() = mac 0x352630, win 0xc2910;
    inline GJDropDownLayer() {
        m_endPosition = cocos2d::CCPointMake(0.f, 0.f);
        m_startPosition = cocos2d::CCPointMake(0.f, 0.f);
        m_buttonMenu = nullptr;
        m_listLayer = nullptr;
        m_controllerEnabled = false;
        m_mainLayer = nullptr;
        m_hidden = false;
        m_delegate = nullptr;
    }

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void customSetup() {}
    virtual void enterLayer() = mac 0x3525c0, win 0x13290;
    virtual void exitLayer(cocos2d::CCObject*) = mac 0x352670, win 0xc2930;
    virtual void showLayer(bool) = mac 0x3526c0, ios 0x29801c, win 0xc2970;
    virtual void hideLayer(bool) = mac 0x3527b0, win 0xc2a40;
    virtual void layerVisible() = mac 0x3528b0, win 0x13360;
    virtual void layerHidden() = mac 0x3528d0, win 0xc2b10;
    virtual void enterAnimFinished() {}
    virtual void disableUI() = mac 0x352580, win 0xc28d0;
    virtual void enableUI() = mac 0x3525a0, win 0xc28f0;
    virtual void gd20_slot_138() = win 0x34650;  // 2.0 slot (getHideBackButton, types unknown)
    virtual void setHideBackButton(bool) = win 0x34660;
    virtual void gd20_slot_140() = win 0x34670;  // 2.0 slot, name unknown
    virtual void gd20_slot_141() = win 0x34680;  // 2.0 slot (getRemoveOnExit, types unknown)
    virtual void setRemoveOnExit(bool) = win 0x34690;
    virtual void gd20_slot_143() = win 0x1ef50;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(GJDropDownLayerDelegate*) = win 0x1ef60;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x194 ----
    cocos2d::CCPoint m_endPosition;  // 2.011 +0x194 (same own size)
    cocos2d::CCPoint m_startPosition;  // 2.011 +0x19c (same own size)
    cocos2d::CCMenu* m_buttonMenu;  // 2.011 +0x1a4 (same own size)
    GJListLayer* m_listLayer;  // 2.011 +0x1a8 (same own size)
    bool m_controllerEnabled;  // 2.011 +0x1ac (same own size)
    PAD = win 0x3;
    cocos2d::CCLayer* m_mainLayer;  // 2.011 +0x1b0 (same own size)
    bool m_hidden;  // 2.011 +0x1b4 (same own size)
    PAD = win 0x3;
    GJDropDownLayerDelegate* m_delegate;  // 2.011 +0x1b8 (same own size)
}

class GJDropDownLayerDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void dropDownLayerWillClose(GJDropDownLayer*) {}
}

class GJEffectManager : cocos2d::CCNode {
    static GJEffectManager* get() {
        return GJEffectManager::fromGameLayer();
    }

    static GJEffectManager* fromGameLayer() {
        auto gameLayer = GJBaseGameLayer::get();
        if (gameLayer && gameLayer->m_levelSettings) return gameLayer->m_levelSettings->m_effectManager;
        return nullptr;
    }

    static GJEffectManager* fromLevelSetting() {
        auto gameLayer = GJBaseGameLayer::get();
        if (gameLayer && gameLayer->m_levelSettings) return gameLayer->m_levelSettings->m_effectManager;
        return nullptr;
    }

    virtual bool init() = mac 0x180230, win 0xc7c30;
    cocos2d::_ccColor3B activeColorForIndex(int) = mac 0x180cb0, win 0xc7fe0;
    void activeOpacityForIndex(int) = mac 0x180e10, win 0xc8060;
    void addAllInheritedColorActions(cocos2d::CCArray*) = mac 0x1817a0, win 0xc8200;
    void addGroupPulseEffect(PulseEffectAction*) = mac 0x184c10, win 0xc92c0;
    void calculateBaseActiveColors() = mac 0x180f70, win 0xc80e0;
    void calculateInheritedColor(int, ColorAction*) = mac 0x1818f0;
    void calculateLightBGColor(cocos2d::_ccColor3B) = mac 0x185b90;
    void colorActionChanged(ColorAction*);
    void colorExists(int) = mac 0x181da0, win 0xc8940;
    void colorForEffect(cocos2d::_ccColor3B, cocos2d::_ccHSVValue) = mac 0x182650;
    cocos2d::_ccColor3B colorForGroupID(int, cocos2d::_ccColor3B const&, bool) = mac 0x184f90;
    void colorForIndex(int) = mac 0x180ad0;
    void colorForPulseEffect(cocos2d::_ccColor3B const&, PulseEffectAction*) = mac 0x181bf0;
    void countChangedForItem(int) = mac 0x185a40;
    void countForItem(int) = mac 0x185a10;
    static GJEffectManager* create() = mac 0x1800f0, win 0xc7b90;
    void createFollowCommand(float, float, float, int, int, bool, int) = mac 0x182ed0;
    void createMoveCommand(cocos2d::CCPoint, int, float, int, float, bool, bool, int) = mac 0x182cc0;
    void createPlayerFollowCommand(float, float, int, float, float, int, int) = mac 0x182fe0;
    void createRotateCommand(int, float, int, int, int, float, bool, int) = mac 0x182df0;
    void getAllColorActions() = mac 0x180980, win 0xc7f00;
    void getAllColorSprites() = mac 0x1809e0;
    ColorAction* getColorAction(int) = mac 0x180b00;
    const cocos2d::_ccColor3B& getColorSprite(int) = mac 0x180d00, win 0xc8990;
    void getCurrentStateString() = mac 0x1867e0, win 0xca280;
    void getLoadedMoveOffset() = mac 0x184390, win 0xc8d50;
    static cocos2d::_ccColor3B getMixedColor(cocos2d::_ccColor3B, cocos2d::_ccColor3B, float) = mac 0x185d30;
    uint8_t getOpacityActionForGroup(int) = mac 0x1845b0;
    gd::string getSaveString() = mac 0x185e90, win 0xc9ea0;
    void handleObjectCollision(bool, int, int) = mac 0x1828f0;
    void hasActiveDualTouch() = mac 0x185540;
    void hasBeenTriggered(int) = mac 0x1853b0;
    void hasPulseEffectForGroupID(int) = mac 0x184f60;
    bool isGroupEnabled(int) = mac 0x1853d0;
    void keyForGroupIDColor(int, cocos2d::_ccColor3B const&, bool) = mac 0x184c90;
    void loadState(gd::string) = mac 0x188db0, win 0xca990;
    void objectsCollided(int, int) = mac 0x182a00;
    void opacityForIndex(int) = mac 0x180c80;
    float opacityModForGroup(int) = mac 0x184740;
    void playerButton(bool, bool) = mac 0x1855a0;
    void playerDied() = mac 0x185860;
    void postCollisionCheck() = mac 0x182720;
    void preCollisionCheck() = mac 0x182680;
    void prepareMoveActions(float, bool) = mac 0x183660;
    void processColors();
    void processCopyColorPulseActions() = mac 0x181530;
    void processInheritedColors() = mac 0x181190, win 0xc8280;
    void processPulseActions() = mac 0x181040, win 0xc95e0;
    void registerCollisionTrigger(int, int, int, bool, bool, int) = mac 0x182b70;
    void removeAllPulseActions() = mac 0x1825e0;
    void removeColorAction(int) = mac 0x181d60;
    void reset() = mac 0x180690, win 0xc7dc0;
    void resetColorCache() = mac 0x185280;
    void resetEffects() = mac 0x1807d0, win 0xc89f0;
    void resetMoveActions() = mac 0x180940;
    void resetToggledGroups() = mac 0x1853f0;
    void resetTriggeredIDs() = mac 0x182630;
    void runCountTrigger(int, int, bool, int, bool, int) = mac 0x1858d0;
    void runDeathTrigger(int, bool, int) = mac 0x1857a0;
    OpacityEffectAction* runOpacityActionOnGroup(int, float, float, int) = mac 0x1845d0;
    void runPulseEffect(int, bool, float, float, float, PulseEffectType, cocos2d::_ccColor3B, cocos2d::_ccHSVValue, int, bool, bool, bool, int) = mac 0x184890;
    void runTouchTriggerCommand(int, bool, TouchTriggerType, bool, int) = mac 0x185460;
    void setColorAction(ColorAction*, int) = mac 0x181d00;
    void setFollowing(int, int, bool) = mac 0x185e00;
    void setupFromString(gd::string) = mac 0x186290, win 0xca090;
    bool shouldBlend(int) = mac 0x180e40;
    void spawnGroup(int, float, int) = mac 0x1852a0;
    void stopActionsForTrigger(EffectGameObject*) = mac 0x183150;
    void stopMoveActionsForGroup(int) = mac 0x1830e0;
    void storeTriggeredID(int) = mac 0x185380;
    void toggleGroup(int item, bool value);  // GD 2.011 port: inline body needs m_groupToggled (no 2.0 offset)

    void traverseInheritanceChain(InheritanceNode*) = mac 0x181850, win 0xc8490;
    void updateActiveOpacityEffects() = mac 0x1847e0, win 0xc9190;
    void updateColorAction(ColorAction*) = mac 0x184560;
    void updateColorEffects(float) = mac 0x181f40, win 0xc8ec0;
    void updateColors(cocos2d::_ccColor3B, cocos2d::_ccColor3B) = mac 0x180a40, win 0xc7f60;
    void updateEffects(float);
    void updateOpacityAction(OpacityEffectAction*) = mac 0x184780;
    void updateOpacityEffects(float) = mac 0x1823e0, win 0xc9070;
    void updatePulseEffects(float) = mac 0x182130;
    void updateSpawnTriggers(float) = mac 0x182510;
    void wasFollowing(int, int) = mac 0x185e60;
    void wouldCreateLoop(InheritanceNode*, int) = mac 0x181820, win 0xc88e0;
    ~GJEffectManager() = mac 0x17fe00;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x202a0;  // 2.0 slot (getSpawnDelegate, types unknown)
    virtual void setSpawnDelegate(SpawnTriggerDelegate*) = win 0x202b0;
    virtual void gd20_slot_109() = win 0xc32e0;  // 2.0 slot (getDeltaMoveActionsDict, types unknown)
    virtual void gd20_slot_110() = win 0xc32f0;  // 2.0 slot (getClkTimer, types unknown)
    virtual void setClkTimer(float) = win 0xc3300;
    virtual void gd20_slot_112() = win 0xc3320;  // 2.0 slot (getPlayerXVelocity, types unknown)
    virtual void setPlayerXVelocity(float) = win 0xc3330;
    virtual void gd20_slot_114() = win 0xc3350;  // 2.0 slot (getPlayerYVelocity, types unknown)
    virtual void setPlayerYVelocity(float) = win 0xc3360;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    PAD = win 0x4;
    cocos2d::CCDictionary* m_colorActions;  // 2.011 +0xec (voted)
    PAD = win 0x908;
}

class GJGameLevel : cocos2d::CCNode {
    static GJGameLevel* createWithCoder(DS_Dictionary* dict) {
        auto ret = GJGameLevel::create();
        ret->dataLoaded(dict);
        return ret;
    }

    inline GJGameLevel() {}
    virtual ~GJGameLevel() = mac 0x2db2d0, win 0x7c650;
    virtual void encodeWithCoder(DS_Dictionary*) = mac 0x2dd1c0, win 0x95ab0;
    virtual bool canEncode() = mac 0x2ddae0, win 0xd720; // shared with lots of stuff
    virtual bool init() = mac 0x2db310, win 0x94b70;
    static GJGameLevel* create() = mac 0x2b83e0, ios 0x51fe8, win 0x94ad0;
    gd::string getAudioFileName() = mac 0x2dbe70, win 0x95000;
    const char* getCoinKey(int) = mac 0x2ce360;
    void getLengthKey(int) = mac 0x2dbba0;
    void getNormalPercent() = mac 0x2b8b20;
    void levelWasAltered() = mac 0x2db530, win 0x94c20;
    void savePercentage(int, bool, int, int, bool) = mac 0x2db700;
    void dataLoaded(DS_Dictionary* dict) = mac 0x2dc0e0, ios 0x6fca4, win 0x95260;
    GJDifficulty getAverageDifficulty() = win 0x94db0;
    gd::string getUnpackedLevelDescription() = mac 0x2DDB50;
    static gd::string lengthKeyToString(int key) = win 0x94d10;

    static GJGameLevel* getCurrent() {
        auto playLayer = PlayLayer::get();
        if (playLayer) return playLayer->m_level;
        auto editorLayer = LevelEditorLayer::get();
        if (editorLayer) return editorLayer->m_level;
        return nullptr;
    }

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x202a0;  // 2.0 slot (getLastBuildSave, types unknown)
    virtual void setLastBuildSave(cocos2d::CCDictionary*) = win 0x7c280;
    virtual void gd20_slot_109() = win 0x25510;  // 2.0 slot (getLevelID, types unknown)
    virtual void setLevelID(int) = win 0x25520;
    virtual void gd20_slot_111() = win 0x7ca30;  // 2.0 slot (getLevelName, types unknown)
    virtual void setLevelName(gd::string) = win 0x7ca70;
    virtual void gd20_slot_113() = win 0x7cae0;  // 2.0 slot (getLevelDesc, types unknown)
    virtual void setLevelDesc(gd::string) = win 0x7cb20;
    virtual void gd20_slot_115() = win 0x7cb90;  // 2.0 slot (getLevelString, types unknown)
    virtual void setLevelString(gd::string) = win 0x7cbd0;
    virtual void gd20_slot_117() = win 0x7cc40;  // 2.0 slot (getUserName, types unknown)
    virtual void setUserName(gd::string) = win 0x7cc80;
    virtual void gd20_slot_119() = win 0x7ccf0;  // 2.0 slot (getRecordString, types unknown)
    virtual void setRecordString(gd::string) = win 0x7cd30;
    virtual void gd20_slot_121() = win 0x7cda0;  // 2.0 slot (getUploadDate, types unknown)
    virtual void setUploadDate(gd::string) = win 0x7cde0;
    virtual void gd20_slot_123() = win 0x7ce50;  // 2.0 slot (getUpdateDate, types unknown)
    virtual void setUpdateDate(gd::string) = win 0x7ce90;
    virtual void gd20_slot_125() = win 0x26090;  // 2.0 slot (getUserID, types unknown)
    virtual void setUserID(int) = win 0xdf70;
    virtual void gd20_slot_127() = win 0x1eeb0;  // 2.0 slot (getAccountID, types unknown)
    virtual void setAccountID(int) = win 0xdfa0;
    virtual void gd20_slot_129() = win 0xdfb0;  // 2.0 slot (getDifficulty, types unknown)
    virtual void setDifficulty(int) = win 0x1eec0;
    virtual void gd20_slot_131() = win 0x2d0f0;  // 2.0 slot (getAudioTrack, types unknown)
    virtual void setAudioTrack(int) = win 0x2d100;
    virtual void gd20_slot_133() = win 0xdff0;  // 2.0 slot (getSongID, types unknown)
    virtual void setSongID(int) = win 0x7c560;
    virtual void gd20_slot_135() = win 0x1eef0;  // 2.0 slot (getLevelRev, types unknown)
    virtual void setLevelRev(int) = win 0x1ef00;
    virtual void gd20_slot_137() = win 0x34670;  // 2.0 slot (getObjectCount, types unknown)
    virtual void setObjectCount(int) = win 0x7cf00;
    virtual void gd20_slot_139() = win 0x1ef30;  // 2.0 slot (getOrder, types unknown)
    virtual void setOrder(int) = win 0x1ef40;
    virtual void gd20_slot_141() = win 0x1ef50;  // 2.0 slot (getRatings, types unknown)
    virtual void setRatings(int) = win 0x1ef60;
    virtual void gd20_slot_143() = win 0x16f60;  // 2.0 slot (getRatingsSum, types unknown)
    virtual void setRatingsSum(int) = win 0x7cf10;
    virtual void gd20_slot_145() = win 0x7cf20;  // 2.0 slot (getDownloads, types unknown)
    virtual void setDownloads(int) = win 0x7cf30;
    virtual void gd20_slot_147() = win 0x29610;  // 2.0 slot (getCompletes, types unknown)
    virtual void setCompletes(int) = win 0x7cf40;
    virtual void gd20_slot_149() = win 0x7cf50;  // 2.0 slot (getIsEditable, types unknown)
    virtual void setIsEditable(bool) = win 0x7cf60;
    virtual void gd20_slot_151() = win 0x7cf70;  // 2.0 slot (getIsVerified, types unknown)
    virtual void setIsVerified(bool) = win 0x7cf80;
    virtual void gd20_slot_153() = win 0x7cf90;  // 2.0 slot (getIsUploaded, types unknown)
    virtual void setIsUploaded(bool) = win 0x7cfa0;
    virtual void gd20_slot_155() = win 0x7cfb0;  // 2.0 slot (getHasBeenModified, types unknown)
    virtual void setHasBeenModified(bool) = win 0x7cfc0;
    virtual void gd20_slot_157() = win 0x163b0;  // 2.0 slot (getLevelVersion, types unknown)
    virtual void setLevelVersion(int) = win 0x7cfd0;
    virtual void gd20_slot_159() = win 0xfbe0;  // 2.0 slot (getGameVersion, types unknown)
    virtual void setGameVersion(int) = win 0x7cfe0;
    virtual void gd20_slot_161() = win 0xfbf0;  // 2.0 slot (getAttempts, types unknown)
    virtual void setAttempts(int) = win 0x7cff0;
    virtual void gd20_slot_163() = win 0xfc00;  // 2.0 slot (getJumps, types unknown)
    virtual void setJumps(int) = win 0x7d000;
    virtual void gd20_slot_165() = win 0x7d010;  // 2.0 slot (getWasCheatReset, types unknown)
    virtual void setWasCheatReset(bool) = win 0x7d020;
    virtual void gd20_slot_167() = win 0x10d30;  // 2.0 slot (getPracticePercent, types unknown)
    virtual void setPracticePercent(int) = win 0x10d40;
    virtual void gd20_slot_169() = win 0x10d50;  // 2.0 slot (getLikes, types unknown)
    virtual void setLikes(int) = win 0x10d60;
    virtual void gd20_slot_171() = win 0x10d70;  // 2.0 slot (getDislikes, types unknown)
    virtual void setDislikes(int) = win 0x10d80;
    virtual void gd20_slot_173() = win 0x10d90;  // 2.0 slot (getLevelLength, types unknown)
    virtual void setLevelLength(int) = win 0x7d030;
    virtual void gd20_slot_175() = win 0x2f8e0;  // 2.0 slot (getFeatured, types unknown)
    virtual void setFeatured(int) = win 0x7d040;
    virtual void gd20_slot_177() = win 0x7d050;  // 2.0 slot (getDemon, types unknown)
    virtual void setDemon(bool) = win 0x7d060;
    virtual void gd20_slot_179() = win 0x7d070;  // 2.0 slot (getStars, types unknown)
    virtual void setStars(int) = win 0x7d080;
    virtual void gd20_slot_181() = win 0x7d090;  // 2.0 slot (getAutoLevel, types unknown)
    virtual void setAutoLevel(bool) = win 0x7d0a0;
    virtual void gd20_slot_183() = win 0x7d0b0;  // 2.0 slot (getCoins, types unknown)
    virtual void setCoins(int) = win 0x7d0c0;
    virtual void gd20_slot_185() = win 0x39c10;  // 2.0 slot (getCoinsVerified, types unknown)
    virtual void setCoinsVerified(int) = win 0x7d0d0;
    virtual void gd20_slot_187() = win 0x10e50;  // 2.0 slot (getPassword, types unknown)
    virtual void setPassword(int) = win 0x10e60;
    virtual void gd20_slot_189() = win 0x7d0e0;  // 2.0 slot (getOriginalLevel, types unknown)
    virtual void setOriginalLevel(int) = win 0x7d0f0;
    virtual void gd20_slot_191() = win 0x77a30;  // 2.0 slot (getTwoPlayerMode, types unknown)
    virtual void setTwoPlayerMode(bool) = win 0x7d100;
    virtual void gd20_slot_193() = win 0x7d110;  // 2.0 slot (getFailedPasswordAttempts, types unknown)
    virtual void setFailedPasswordAttempts(int) = win 0x7d120;
    virtual void gd20_slot_195() = win 0x7d130;  // 2.0 slot (getCoin1Verified, types unknown)
    virtual void setCoin1Verified(int) = win 0x7d140;
    virtual void gd20_slot_197() = win 0x7d150;  // 2.0 slot (getCoin2Verified, types unknown)
    virtual void setCoin2Verified(int) = win 0x7d160;
    virtual void gd20_slot_199() = win 0x7d170;  // 2.0 slot (getCoin3Verified, types unknown)
    virtual void setCoin3Verified(int) = win 0x7d180;
    virtual void gd20_slot_201() = win 0x7d190;  // 2.0 slot (getRequestedStars, types unknown)
    virtual void setRequestedStars(int) = win 0x7d1a0;
    virtual void gd20_slot_203() = win 0x7d1b0;  // 2.0 slot (getShowedSongWarning, types unknown)
    virtual void setShowedSongWarning(bool) = win 0x7d1c0;
    virtual void gd20_slot_205() = win 0x7d1d0;  // 2.0 slot (getStarRatings, types unknown)
    virtual void setStarRatings(int) = win 0x7d1e0;
    virtual void gd20_slot_207() = win 0x7d1f0;  // 2.0 slot (getStarRatingsSum, types unknown)
    virtual void setStarRatingsSum(int) = win 0x7d200;
    virtual void gd20_slot_209() = win 0x7d210;  // 2.0 slot (getMaxStarRatings, types unknown)
    virtual void setMaxStarRatings(int) = win 0x7d220;
    virtual void gd20_slot_211() = win 0x7d230;  // 2.0 slot (getMinStarRatings, types unknown)
    virtual void setMinStarRatings(int) = win 0x7d240;
    virtual void gd20_slot_213() = win 0x7d250;  // 2.0 slot (getDemonVotes, types unknown)
    virtual void setDemonVotes(int) = win 0x7d260;
    virtual void gd20_slot_215() = win 0x7d270;  // 2.0 slot (getRateStars, types unknown)
    virtual void setRateStars(int) = win 0x7d280;
    virtual void gd20_slot_217() = win 0x7d290;  // 2.0 slot (getRateFeature, types unknown)
    virtual void setRateFeature(bool) = win 0x7d2a0;
    virtual void gd20_slot_219() = win 0x7d2b0;  // 2.0 slot (getRateUser, types unknown)
    virtual void setRateUser(gd::string) = win 0x7d2f0;
    virtual void gd20_slot_221() = win 0x7d360;  // 2.0 slot (getDontSave, types unknown)
    virtual void setDontSave(bool) = win 0x7d370;
    virtual void gd20_slot_223() = win 0x7d380;  // 2.0 slot (getIsHidden, types unknown)
    virtual void setIsHidden(bool) = win 0x7d390;
    virtual void gd20_slot_225() = win 0x7d3a0;  // 2.0 slot (getRequiredCoins, types unknown)
    virtual void setRequiredCoins(int) = win 0x7d3b0;
    virtual void gd20_slot_227() = win 0x7d3c0;  // 2.0 slot (getIsUnlocked, types unknown)
    virtual void setIsUnlocked(bool) = win 0x7d3d0;
    virtual void gd20_slot_229() = win 0x7d3e0;  // 2.0 slot, name unknown
    virtual void setLastCameraPos(cocos2d::CCPoint) = win 0x7d400;
    virtual void gd20_slot_231() = win 0x7d420;  // 2.0 slot (getLastEditorZoom, types unknown)
    virtual void setLastEditorZoom(float) = win 0x7d430;
    virtual void gd20_slot_233() = win 0x7d450;  // 2.0 slot (getLastBuildTab, types unknown)
    virtual void setLastBuildTab(int) = win 0x7d460;
    virtual void gd20_slot_235() = win 0x7d470;  // 2.0 slot (getLastBuildPage, types unknown)
    virtual void setLastBuildPage(int) = win 0x7d480;
    virtual void gd20_slot_237() = win 0x7d490;  // 2.0 slot (getLastBuildGroupID, types unknown)
    virtual void setLastBuildGroupID(int) = win 0x7d4a0;
    virtual void gd20_slot_239() = win 0x7d4b0;  // 2.0 slot (getLevelType, types unknown)
    virtual void setLevelType(GJLevelType) = win 0x7d4c0;
    virtual void gd20_slot_242() = win 0x7d4e0;  // 2.0 slot (getTempName, types unknown)
    virtual void gd20_slot_241() = win 0x7d4d0;  // 2.0 slot (getTempName, types unknown)
    virtual void setTempName(gd::string) = win 0x7d520;
    virtual void gd20_slot_244() = win 0x7d590;  // 2.0 slot (getCapacityString, types unknown)
    virtual void setCapacityString(gd::string) = win 0x7d5d0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    cocos2d::CCDictionary* m_lastBuildSave;  // 2.011 +0xe8 (accessor)
    geode::SeedValueRSV m_levelID;  // 2.011 +0xec (manual)
    PAD = win 0x10;
    gd::string m_levelDesc;  // 2.011 +0x108 (accessor)
    gd::string m_levelString;  // 2.011 +0x120 (accessor)
    gd::string m_creatorName;  // 2.011 +0x138 (interpolated)
    gd::string m_recordString;  // 2.011 +0x150 (accessor)
    gd::string m_uploadDate;  // 2.011 +0x168 (accessor)
    gd::string m_updateDate;  // 2.011 +0x180 (accessor)
    geode::SeedValueRSV m_userID;  // 2.011 +0x198 (accessor)
    int m_audioTrack;  // 2.011 +0x1a4 (accessor)
    int m_songID;  // 2.011 +0x1a8 (accessor)
    int m_levelRev;  // 2.011 +0x1ac (accessor)
    geode::SeedValueRSV m_objectCount;  // 2.011 +0x1b0 (accessor)
    int m_ratingsSum;  // 2.011 +0x1bc (accessor)
    int m_downloads;  // 2.011 +0x1c0 (accessor)
    PAD = win 0x4;
    bool m_isEditable;  // 2.011 +0x1c8 (accessor)
    PAD = win 0x1;
    bool m_isUploaded;  // 2.011 +0x1ca (accessor)
    bool m_hasBeenModified;  // 2.011 +0x1cb (accessor)
    int m_levelVersion;  // 2.011 +0x1cc (accessor)
    int m_gameVersion;  // 2.011 +0x1d0 (accessor)
    geode::SeedValueRSV m_attempts;  // 2.011 +0x1d4 (accessor)
    PAD = win 0xc;
    int m_practicePercent;  // 2.011 +0x1ec (accessor)
    int m_likes;  // 2.011 +0x1f0 (accessor)
    int m_dislikes;  // 2.011 +0x1f4 (accessor)
    int m_levelLength;  // 2.011 +0x1f8 (accessor)
    int m_featured;  // 2.011 +0x1fc (accessor)
    PAD = win 0x4;
    geode::SeedValueRSV m_stars;  // 2.011 +0x204 (manual)
    geode::SeedValueRSV m_coinsVerified;  // 2.011 +0x210 (accessor)
    bool m_twoPlayerMode;  // 2.011 +0x21c (accessor)
    PAD = win 0x3;
    int m_failedPasswordAttempts;  // 2.011 +0x220 (accessor)
    PAD = win 0x10;
    bool m_showedSongWarning;  // 2.011 +0x234 (accessor)
    PAD = win 0x3;
    int m_starRatings;  // 2.011 +0x238 (accessor)
    int m_starRatingsSum;  // 2.011 +0x23c (accessor)
    int m_maxStarRatings;  // 2.011 +0x240 (accessor)
    int m_minStarRatings;  // 2.011 +0x244 (accessor)
    int m_demonVotes;  // 2.011 +0x248 (accessor)
    int m_rateStars;  // 2.011 +0x24c (accessor)
    int m_rateFeature;  // 2.011 +0x250 (accessor)
    gd::string m_rateUser;  // 2.011 +0x254 (accessor)
    bool m_dontSave;  // 2.011 +0x26c (accessor)
    bool m_levelNotDownloaded;  // 2.011 +0x26d (voted)
    PAD = win 0x2;
    int m_requiredCoins;  // 2.011 +0x270 (accessor)
    bool m_isUnlocked;  // 2.011 +0x274 (accessor)
    PAD = win 0x3;
    cocos2d::CCPoint m_lastCameraPos;  // 2.011 +0x278 (accessor)
    float m_fastEditorZoom;  // 2.011 +0x280 (interpolated)
    int m_lastBuildTab;  // 2.011 +0x284 (accessor)
    int m_lastBuildPage;  // 2.011 +0x288 (accessor)
    int m_lastBuildGroupID;  // 2.011 +0x28c (accessor)
    GJLevelType m_levelType;  // 2.011 +0x290 (accessor)
    int m_M_ID;  // 2.011 +0x294 (interpolated)
    gd::string m_tempName;  // 2.011 +0x298 (accessor)
    gd::string m_capacityString;  // 2.011 +0x2b0 (accessor)
}

class GJGarageLayer : cocos2d::CCLayer, TextInputDelegate, FLAlertLayerProtocol, GameRateDelegate, ListButtonBarDelegate {
    GJGarageLayer() = win 0xcbbc0;  // GD 2.011 port: real function (inline body needed m_colorSelector1, m_colorSelector2, m_nameInput)

    void onPlayerColor1(cocos2d::CCObject*) = mac 0x1ba640, ios 0x22531c, win 0xcef00;
    void onPlayerColor2(cocos2d::CCObject*) = mac 0x1ba8c0, ios 0x225408, win 0xceff0;
    static GJGarageLayer* node() = win 0xcbd00;
    virtual bool init() = mac 0x1b4980, win 0xcc070;
    void onSelectTab(cocos2d::CCObject* sender) = win 0xcdd80;
    void onPlayerIcon(cocos2d::CCObject* sender) = win 0xce010;
    void onShipIcon(cocos2d::CCObject* sender) = win 0xce0a0;
    void onBallIcon(cocos2d::CCObject* sender) = win 0xce130;
    void onBirdIcon(cocos2d::CCObject* sender) = win 0xce1c0;
    void onDartIcon(cocos2d::CCObject* sender) = win 0xce250;
    void onRobotIcon(cocos2d::CCObject* sender) = win 0xce4a0;
    void onSpiderIcon(cocos2d::CCObject* sender);
    void onPlayerDeathEffect(cocos2d::CCObject* sender);
    void onPlayerTrail(cocos2d::CCObject* sender); 
    void onShards(cocos2d::CCObject* sender);
    void onBack(cocos2d::CCObject* sender) = win 0xd02e0;
    void onShop(cocos2d::CCObject* sender);
    void setupColorSelect() = mac 0x1b7500, win 0xce890;
    void showCircleWave();
    void showBlackCircleWave();

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_125() = win 0xde30;  // 2.0 slot (getRateSprite, types unknown)
    virtual void gd20_slot_126() = win 0xde40;  // 2.0 slot, name unknown
    virtual void gd20_slot_127() = win 0xde50;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x128 ----
    PAD = win 0x4;
    SimplePlayer* m_playerPreview;  // 2.011 +0x12c (voted)
}

class GJGroundLayer : cocos2d::CCLayer {
    void updateGroundWidth() = mac 0x356790, win 0xd2610;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_125() = win 0xd2750;  // 2.0 slot (showGround, types unknown)
    virtual void gd20_slot_126() = win 0xd2760;  // 2.0 slot (fadeInGround, types unknown)
    virtual void gd20_slot_127() = win 0xd27c0;  // 2.0 slot (fadeOutGround, types unknown)
    virtual void gd20_slot_128() = win 0xe080;  // 2.0 slot, name unknown
    virtual void gd20_slot_129() = win 0x7dc30;  // 2.0 slot, name unknown
    virtual void gd20_slot_130() = win 0x157b0;  // 2.0 slot, name unknown
    virtual void gd20_slot_131() = win 0x7dc70;  // 2.0 slot, name unknown
    virtual void gd20_slot_132() = win 0xc31d0;  // 2.0 slot, name unknown
}

// GD 2.011 port: 2.1-only class, stub
class GJItemIcon {
}

// GD 2.011 port: 2.1-only class, stub
class GJLevelScoreCell {
}

class GJListLayer : cocos2d::CCLayerColor {
    ~GJListLayer() = mac 0x344350;
    static GJListLayer* create(BoomListView* target, const char* title, cocos2d::ccColor4B color, float width, float height) = mac 0x343e10, win 0xd2870;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_128() = win 0x26080;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x194 ----
    BoomListView* m_listView;  // 2.011 +0x194 (same own size)
}

class GJMapPack : cocos2d::CCNode {

    virtual bool init() = win 0x968f0;
    static GJMapPack *create();

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x25510;  // 2.0 slot (getPackID, types unknown)
    virtual void setPackID(int) = win 0x25520;
    virtual void gd20_slot_109() = win 0x25610;  // 2.0 slot (getPackDifficulty, types unknown)
    virtual void setPackDifficulty(int) = win 0x25620;
    virtual void gd20_slot_111() = win 0x6680;  // 2.0 slot (getPackStars, types unknown)
    virtual void setPackStars(int) = win 0x14000;
    virtual void gd20_slot_113() = win 0x14010;  // 2.0 slot (getPackCoins, types unknown)
    virtual void setPackCoins(int) = win 0x14020;
    virtual void gd20_slot_115() = win 0x7d750;  // 2.0 slot, name unknown
    virtual void gd20_slot_116() = win 0x7d790;  // 2.0 slot, name unknown
    virtual void gd20_slot_117() = win 0x7d800;  // 2.0 slot, name unknown
    virtual void gd20_slot_118() = win 0x7d840;  // 2.0 slot, name unknown
    virtual void gd20_slot_119() = win 0x7d8b0;  // 2.0 slot, name unknown
    virtual void gd20_slot_120() = win 0x7d8d0;  // 2.0 slot, name unknown
    virtual void gd20_slot_121() = win 0x7d8f0;  // 2.0 slot, name unknown
    virtual void gd20_slot_122() = win 0x7d910;  // 2.0 slot, name unknown
    virtual void gd20_slot_123() = win 0x7d930;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    cocos2d::CCArray* m_levels;  // 2.011 +0xe8 (consistent evidence)
    int m_packID;  // 2.011 +0xec (consistent evidence)
    GJDifficulty m_difficulty;  // 2.011 +0xf0 (consistent evidence)
    int m_stars;  // 2.011 +0xf4 (consistent evidence)
    int m_coins;  // 2.011 +0xf8 (consistent evidence)
    gd::string m_packName;  // 2.011 +0xfc (consistent evidence)
    gd::string m_levelStrings;  // 2.011 +0x114 (consistent evidence)
    cocos2d::ccColor3B m_textColour;  // 2.011 +0x12c (consistent evidence)
    cocos2d::ccColor3B m_barColour;  // 2.011 +0x12f (consistent evidence)
    PAD = win 0x2;
    int m_MId;  // 2.011 +0x134 (consistent evidence)
    bool m_isGauntlet;  // 2.011 +0x138 (consistent evidence)
}

class GJMessageCell : TableViewCell, FLAlertLayerProtocol, UploadPopupDelegate, UploadActionDelegate {
    void updateBGColor(int index) = win 0x49ba0;
    void loadFromMessage(GJUserMessage *) = win 0x50670;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class GJOptionsLayer : FLAlertLayer {
    static GJOptionsLayer* create() = mac 0x145ae0, ios 0x0;
    void addToggle(char const*, char const*, char const*) = mac 0x1464e0, ios 0x0, win 0xd8730;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_144() = win 0x6320;  // 2.0 slot (setupOptions, types unknown)
    virtual void gd20_slot_145() = win 0x40ae0;  // 2.0 slot (onClose, types unknown)
}

class GJRequestCell : TableViewCell, FLAlertLayerProtocol, UploadPopupDelegate, UploadActionDelegate {
    void updateBGColor(int index) = win 0x49ba0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

// GD 2.011 port: 2.1-only class, stub
class GJRewardDelegate {
}

// GD 2.011 port: 2.1-only class, stub
class GJRewardItem {
}

// GD 2.011 port: 2.1-only class, stub
class GJRewardObject {
}

class GJRobotSprite : CCAnimatedSprite {
    // virtual ~GJRobotSprite() = mac 0x34aaf0, win 0xe1960; inlined on windows, RE and recreate 
    virtual bool init() = mac 0x34ad50, win 0xe1b30;
    virtual void setOpacity(unsigned char) = mac 0x34bcc0, win 0xe2600;
    static GJRobotSprite* create() = mac 0x34ac00, win 0xe1a90;
    void updateColor02(cocos2d::_ccColor3B) = mac 0x34bbd0;
    void updateGlowColor(cocos2d::_ccColor3B, bool) = win 0xe2170; 
    void updateFrame(int) = mac 0x34bdd0, win 0xe26c0;
    void hideGlow() = mac 0x34b860; // shared with GJSpriteSprite
    void hideSecondary() = mac 0x34c3b0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_148() = win 0x7d170;  // 2.0 slot, name unknown
    virtual void gd20_slot_149() = win 0x7d190;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x218 ----
    PAD = win 0x4;  // padfix +4
    cocos2d::CCArray* m_unk244;  // 2.011 +0x218 (consistent evidence)
    bool m_unk248;  // 2.011 +0x21c (consistent evidence)
    cocos2d::ccColor3B m_mainColor;  // 2.011 +0x21d (consistent evidence)
    cocos2d::ccColor3B m_secondaryColor;  // 2.011 +0x220 (consistent evidence)
    PAD = win 0x1;
    cocos2d::CCArray* m_unk250;  // 2.011 +0x224 (consistent evidence)
    cocos2d::CCSprite* m_glowSprite;  // 2.011 +0x228 (consistent evidence)
    cocos2d::CCSprite* m_unk258;  // 2.011 +0x22c (consistent evidence)
    PAD = win 0x4;
}

class GJRotationControl : cocos2d::CCLayer {
    void setAngle(float angle) {
        m_sliderPosition = cocos2d::CCPointMake(sinf(angle) * 60.0f, cosf(angle) * 60.0f);
        m_angle = angle;
    
        m_sliderThumb->setPosition(m_sliderPosition);
    }

    void updateSliderPosition(cocos2d::CCPoint pos) = win 0x73e20;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_125() = win 0x17680;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(GJRotationControlDelegate*) = win 0x17690;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x118 ----
    float m_unknown0;  // 2.011 +0x118 (consistent evidence)
    float m_unknown1;  // 2.011 +0x11c (consistent evidence)
    cocos2d::CCPoint m_sliderPosition;  // 2.011 +0x120 (consistent evidence)
    cocos2d::CCSprite* m_sliderThumb;  // 2.011 +0x128 (consistent evidence)
    float m_objAngle;  // 2.011 +0x12c (consistent evidence)
    float m_angle;  // 2.011 +0x130 (consistent evidence)
    int m_touchID;  // 2.011 +0x134 (consistent evidence)
    PAD = win 0x4;
}

class GJRotationControlDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void angleChanged(float) {}
    virtual void angleChangeBegin() {}
    virtual void angleChangeEnded() {}
}

class GJScaleControl : cocos2d::CCLayer {
    virtual bool init() = mac 0x31b30, win 0x74290;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x31d30, win 0x746e0;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x31e60, win 0x74780;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x31fb0, win 0x748c0;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x32060, win 0x29c00; // shared with many others
    void updateLabel(float value) = mac 0x31c90, win 0x74910;
    void loadValues(GameObject* obj, cocos2d::CCArray* objs) = mac 0x24f40, win 0x74390;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_125() = win 0x5d120;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(GJScaleControlDelegate*) = win 0x5d130;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x118 ----
    Slider* m_slider;  // 2.011 +0x118 (same own size)
    unsigned int m_touchID;  // 2.011 +0x11c (same own size)
    float m_value;  // 2.011 +0x120 (same own size)
    bool m_shouldSnapAt1;  // 2.011 +0x124 (same own size)
    PAD = win 0x3;
    cocos2d::CCLabelBMFont* m_label;  // 2.011 +0x128 (same own size)
    GJScaleControlDelegate* m_delegate;  // 2.011 +0x12c (same own size)
}

class GJScaleControlDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void scaleChanged(float) {}
    virtual void scaleChangeBegin() {}
    virtual void scaleChangeEnded() {}
}

class GJScoreCell : TableViewCell, FLAlertLayerProtocol {
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = mac 0x11D8E0, win 0x4e640;
    void loadFromScore(GJUserScore* score) = mac 0x113AA0, win 0x4d7d0;
    void onViewProfile(cocos2d::CCObject* sender) = win 0x4e4e0;
    void updateBGColor(int index) = mac 0x113A40, win 0x49ba0;
    inline GJScoreCell(char const* identifier, float parentHeight, float height) : TableViewCell(identifier, parentHeight, height) {}

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x174 ----
    GJUserScore* m_score;  // 2.011 +0x174 (voted)
}

class GJSearchObject : cocos2d::CCNode {

    static GJSearchObject* create(SearchType nID) = mac 0x2df120;
    static GJSearchObject* create(SearchType nID, gd::string str) = mac 0x2df310, win 0x98fe0;
    static GJSearchObject* createFromKey(const char* key) = mac 0x2C0620;
    const char* getKey() = mac 0x2C6A40, win 0x993b0;
    const char* getNextPageKey() = win 0x994e0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual SearchType getType() {
        return m_searchType;
    }
    virtual void setType(SearchType) = win 0x202b0;
    virtual void gd20_slot_109() = win 0x7e2d0;  // 2.0 slot (getString, types unknown)
    virtual void setString(gd::string) = win 0x7e310;
    virtual void gd20_slot_111() = win 0x7e380;  // 2.0 slot (getDifficultyStr, types unknown)
    virtual void setDifficultyStr(gd::string) = win 0x7e3c0;
    virtual void gd20_slot_113() = win 0x2ad10;  // 2.0 slot (getLengthStr, types unknown)
    virtual void setLengthStr(gd::string) = win 0x2ad50;
    virtual void gd20_slot_115() = win 0x7d930;  // 2.0 slot (getPage, types unknown)
    virtual void setPage(int) = win 0x7dcd0;
    virtual void gd20_slot_117() = win 0x53e30;  // 2.0 slot (getStar, types unknown)
    virtual void setStar(bool) = win 0x53e40;
    virtual void gd20_slot_119() = win 0x7e430;  // 2.0 slot (getNoStar, types unknown)
    virtual void setNoStar(bool) = win 0x7e440;
    virtual void gd20_slot_121() = win 0x176a0;  // 2.0 slot (getTotal, types unknown)
    virtual void setTotal(int) = win 0x176b0;
    virtual void gd20_slot_123() = win 0xd080;  // 2.0 slot (getUncompleted, types unknown)
    virtual void setUncompleted(bool) = win 0xd090;
    virtual void gd20_slot_125() = win 0x7e450;  // 2.0 slot (getFeatured, types unknown)
    virtual void setFeatured(bool) = win 0x7e460;
    virtual void gd20_slot_127() = win 0x7e470;  // 2.0 slot (getOriginal, types unknown)
    virtual void setOriginal(bool) = win 0x7e480;
    virtual void gd20_slot_129() = win 0x7e490;  // 2.0 slot (getTwoP, types unknown)
    virtual void setTwoP(bool) = win 0x7e4a0;
    virtual void gd20_slot_131() = win 0x2a210;  // 2.0 slot (getCoins, types unknown)
    virtual void setCoins(bool) = win 0x2a220;
    virtual void gd20_slot_133() = win 0x5cd80;  // 2.0 slot (getSong, types unknown)
    virtual void setSong(int) = win 0x7dce0;
    virtual void gd20_slot_135() = win 0x17760;  // 2.0 slot (getCustomSong, types unknown)
    virtual void setCustomSong(bool) = win 0x17770;
    virtual void gd20_slot_137() = win 0x17780;  // 2.0 slot (getSongFilter, types unknown)
    virtual void setSongFilter(bool) = win 0x17790;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    SearchType m_searchType;  // 2.011 +0xe8 (manual)
    gd::string m_searchQuery;  // 2.011 +0xec (interpolated)
    gd::string m_difficulty;  // 2.011 +0x104 (interpolated)
    gd::string m_length;  // 2.011 +0x11c (interpolated)
    int m_page;  // 2.011 +0x134 (accessor)
    PAD = win 0x15;
    bool m_songFilter;  // 2.011 +0x14d (accessor)
}

class GJSpecialColorSelect : FLAlertLayer {
    static const char* textForColorIdx(int id) = mac 0x383a50, ios 0x113f6c, win 0xe4280;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class GJSpecialColorSelectDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void colorSelectClosed(GJSpecialColorSelect*, int) {}
}

// GD 2.011 port: 2.1-only class, stub
class GJSpiderSprite {
}

class GJSpriteColor : cocos2d::CCNode {

    void resetCustomColorMode() = mac 0x342f10;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x202a0;  // 2.0 slot, name unknown
    virtual void gd20_slot_108() = win 0x25510;  // 2.0 slot, name unknown
    virtual void gd20_slot_109() = win 0x134d0;  // 2.0 slot (getCustomOpacityMod, types unknown)
    virtual void setCustomOpacityMod(float) = win 0x134e0;
    virtual void gd20_slot_111() = win 0xa3990;  // 2.0 slot, name unknown
    virtual void gd20_slot_112() = win 0xa39b0;  // 2.0 slot, name unknown
    virtual void gd20_slot_113() = win 0xa39d0;  // 2.0 slot, name unknown
    virtual void gd20_slot_114() = win 0xa39e0;  // 2.0 slot, name unknown
    virtual void gd20_slot_115() = win 0xa39f0;  // 2.0 slot, name unknown
    virtual void gd20_slot_116() = win 0xa3a00;  // 2.0 slot, name unknown
    virtual void gd20_slot_117() = win 0xa3a20;  // 2.0 slot, name unknown
    virtual void gd20_slot_118() = win 0xa3a30;  // 2.0 slot, name unknown
    virtual void gd20_slot_119() = win 0xa3a40;  // 2.0 slot, name unknown
    virtual void gd20_slot_120() = win 0xa3a60;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    int m_colorID;  // 2.011 +0xe8 (same own size)
    int m_defaultColorID;  // 2.011 +0xec (same own size)
    float m_opacity;  // 2.011 +0xf0 (same own size)
    cocos2d::ccHSVValue m_hsv;  // 2.011 +0xf4 (same own size)
    bool m_usesHSV;  // 2.011 +0x104 (same own size)
    PAD = win 0xb;
}

class GJUserCell : TableViewCell, FLAlertLayerProtocol, UploadPopupDelegate, UploadActionDelegate {
    void updateBGColor(int index) = win 0x49ba0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class GJUserMessage : cocos2d::CCNode {
    virtual bool init() = win 0x300a0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x202a0;  // 2.0 slot (getMessageID, types unknown)
    virtual void setMessageID(int) = win 0x202b0;
    virtual void gd20_slot_109() = win 0x25510;  // 2.0 slot (getAccountID, types unknown)
    virtual void setAccountID(int) = win 0x25520;
    virtual void gd20_slot_111() = win 0x25610;  // 2.0 slot (getUserID, types unknown)
    virtual void setUserID(int) = win 0x25620;
    virtual void gd20_slot_113() = win 0x7df50;  // 2.0 slot (getSubject, types unknown)
    virtual void setSubject(gd::string) = win 0x7df90;
    virtual void gd20_slot_115() = win 0x7e000;  // 2.0 slot (getBody, types unknown)
    virtual void setBody(gd::string) = win 0x7e040;
    virtual void gd20_slot_117() = win 0x157e0;  // 2.0 slot (getUserName, types unknown)
    virtual void setUserName(gd::string) = win 0x15820;
    virtual void gd20_slot_119() = win 0x5ce20;  // 2.0 slot (getDate, types unknown)
    virtual void setDate(gd::string) = win 0x5ce60;
    virtual void gd20_slot_121() = win 0x7e190;  // 2.0 slot (getIsRead, types unknown)
    virtual void setIsRead(bool) = win 0x7e1a0;
    virtual void gd20_slot_123() = win 0x7e1b0;  // 2.0 slot (getIsSender, types unknown)
    virtual void setIsSender(bool) = win 0x7e1c0;
    virtual void gd20_slot_125() = win 0x7e1d0;  // 2.0 slot (getIsToggled, types unknown)
    virtual void setIsToggled(bool) = win 0x7e1e0;
}

class GJUserScore : cocos2d::CCNode {
    int getPlayerCube() const;  // GD 2.011 port: inline body needs m_playerCube (no 2.0 offset)

    int getPlayerShip() const;  // GD 2.011 port: inline body needs m_playerShip (no 2.0 offset)

    int getPlayerBall() const;  // GD 2.011 port: inline body needs m_playerBall (no 2.0 offset)

    int getPlayerUfo() const;  // GD 2.011 port: inline body needs m_playerUfo (no 2.0 offset)

    int getPlayerWave() const;  // GD 2.011 port: inline body needs m_playerWave (no 2.0 offset)

    int getPlayerRobot() const;  // GD 2.011 port: inline body needs m_playerRobot (no 2.0 offset)

    int getPlayerSpider() const;  // GD 2.011 port: inline body needs m_playerSpider (no 2.0 offset)

    int getPlayerStreak() const;  // GD 2.011 port: inline body needs m_playerStreak (no 2.0 offset)

    bool getGlowEnabled() const;  // GD 2.011 port: inline body needs m_glowEnabled (no 2.0 offset)

    int getPlayerExplosion() const;  // GD 2.011 port: inline body needs m_playerExplosion (no 2.0 offset)

    int getPlayerColor1() const { 
        return m_color1;
    }
    int getPlayerColor2() const { 
        return m_color2; 
    }
    gd::string getPlayerName() const { 
        return m_userName; 
    }
    static GJUserScore* create() {
        auto pRet = new GJUserScore();

        if (pRet) {
            pRet->autorelease();
            return pRet;
        }

        CC_SAFE_DELETE(pRet);
        return nullptr;
    }
    inline GJUserScore() : CCNode() {}
    static GJUserScore* create(cocos2d::CCDictionary*) = mac 0x2BD020, win 0x96e60;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x7db10;  // 2.0 slot (getUserName, types unknown)
    virtual void setUserName(gd::string) = win 0x7db50;
    virtual void gd20_slot_109() = win 0x211d0;  // 2.0 slot (getUserUDID, types unknown)
    virtual void setUserUDID(gd::string) = win 0x7dbc0;
    virtual void gd20_slot_111() = win 0xe080;  // 2.0 slot (getScoreType, types unknown)
    virtual void setScoreType(GJScoreType) = win 0xe090;
    virtual void gd20_slot_113() = win 0x7dc30;  // 2.0 slot (getUserID, types unknown)
    virtual void setUserID(int) = win 0x7dc40;
    virtual void gd20_slot_115() = win 0x7dc50;  // 2.0 slot (getAccountID, types unknown)
    virtual void setAccountID(int) = win 0x7dc60;
    virtual void gd20_slot_117() = win 0x7dc70;  // 2.0 slot (getStars, types unknown)
    virtual void setStars(int) = win 0x7dc80;
    virtual void gd20_slot_119() = win 0x7dc90;  // 2.0 slot (getDemons, types unknown)
    virtual void setDemons(int) = win 0x7dca0;
    virtual void gd20_slot_121() = win 0x5d120;  // 2.0 slot (getRank, types unknown)
    virtual void setRank(int) = win 0x5d130;
    virtual void gd20_slot_123() = win 0x7dcb0;  // 2.0 slot (getLevels, types unknown)
    virtual void setLevels(int) = win 0x7dcc0;
    virtual void gd20_slot_125() = win 0x7d930;  // 2.0 slot (getCoins, types unknown)
    virtual void setCoins(int) = win 0x7dcd0;
    virtual void gd20_slot_127() = win 0x17680;  // 2.0 slot (getUserCoins, types unknown)
    virtual void setUserCoins(int) = win 0x17690;
    virtual void gd20_slot_129() = win 0x176a0;  // 2.0 slot (getIcon, types unknown)
    virtual void setIcon(int) = win 0x176b0;
    virtual void gd20_slot_131() = win 0x176c0;  // 2.0 slot (getColor1, types unknown)
    virtual void setColor1(int) = win 0x176d0;
    virtual void gd20_slot_133() = win 0xd0e0;  // 2.0 slot (getColor2, types unknown)
    virtual void setColor2(int) = win 0xd0f0;
    virtual void gd20_slot_135() = win 0x5cd80;  // 2.0 slot (getSpecial, types unknown)
    virtual void setSpecial(int) = win 0x7dce0;
    virtual IconType getIconType() const { 
        return m_iconType; 
    }
    virtual void setIconType(int) = win 0x7dd00;
    virtual void gd20_slot_139() = win 0x7dd10;  // 2.0 slot (getMessageSetting, types unknown)
    virtual void setMessageSetting(int) = win 0x7dd20;
    virtual void gd20_slot_141() = win 0x5ced0;  // 2.0 slot (getFriendReqSetting, types unknown)
    virtual void setFriendReqSetting(int) = win 0x5cee0;
    virtual void gd20_slot_143() = win 0x7dd30;  // 2.0 slot (getYtUsername, types unknown)
    virtual void setYtUsername(gd::string) = win 0x7dd70;
    virtual void gd20_slot_145() = win 0x7c500;  // 2.0 slot (getAccIcon, types unknown)
    virtual void setAccIcon(int) = win 0x7c510;
    virtual void gd20_slot_147() = win 0x19320;  // 2.0 slot (getShip, types unknown)
    virtual void setShip(int) = win 0x7c520;
    virtual void gd20_slot_149() = win 0xde30;  // 2.0 slot (getBall, types unknown)
    virtual void setBall(int) = win 0xde40;
    virtual void gd20_slot_151() = win 0x19330;  // 2.0 slot (getBird, types unknown)
    virtual void setBird(int) = win 0x19340;
    virtual void gd20_slot_153() = win 0x19350;  // 2.0 slot (getDart, types unknown)
    virtual void setDart(int) = win 0x7c530;
    virtual void gd20_slot_155() = win 0x2d020;  // 2.0 slot (getRobot, types unknown)
    virtual void setRobot(int) = win 0x2d030;
    virtual void gd20_slot_157() = win 0x7c540;  // 2.0 slot (getStreak, types unknown)
    virtual void setStreak(int) = win 0x7c550;
    virtual void gd20_slot_159() = win 0xdf10;  // 2.0 slot (getGlow, types unknown)
    virtual void setGlow(bool) = win 0xdf20;
    virtual void gd20_slot_161() = win 0x2d0a0;  // 2.0 slot (getGlobalRank, types unknown)
    virtual void setGlobalRank(int) = win 0x2d0b0;
    virtual void gd20_slot_163() = win 0x26080;  // 2.0 slot (getFriendStatus, types unknown)
    virtual void gd20_slot_164() = win 0x2d0c0;  // 2.0 slot (setFriendStatus, types unknown)
    virtual void gd20_slot_165() = win 0x26090;  // 2.0 slot (getNewMessages, types unknown)
    virtual void setNewMessages(int) = win 0xdf70;
    virtual void gd20_slot_167() = win 0x1eeb0;  // 2.0 slot (getNewRequests, types unknown)
    virtual void setNewRequests(int) = win 0xdfa0;
    virtual void gd20_slot_169() = win 0xdfb0;  // 2.0 slot (getNewFriends, types unknown)
    virtual void setNewFriends(int) = win 0x1eec0;
    virtual void gd20_slot_171() = win 0x1eed0;  // 2.0 slot (getIsNewRelation, types unknown)
    virtual void setIsNewRelation(bool) = win 0x1eee0;
    virtual void gd20_slot_173() = win 0x7dde0;  // 2.0 slot (getIsToggled, types unknown)
    virtual void setIsToggled(bool) = win 0x7ddf0;
    virtual void gd20_slot_175() = win 0x7de00;  // 2.0 slot (getDateString, types unknown)
    virtual void setDateString(gd::string) = win 0x7de40;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    gd::string m_userName;  // 2.011 +0xe8 (accessor)
    gd::string m_userUDID;  // 2.011 +0x100 (accessor)
    int m_scoreType;  // 2.011 +0x118 (accessor)
    int m_userID;  // 2.011 +0x11c (accessor)
    int m_accountID;  // 2.011 +0x120 (accessor)
    int m_stars;  // 2.011 +0x124 (accessor)
    int m_demons;  // 2.011 +0x128 (accessor)
    int m_playerRank;  // 2.011 +0x12c (interpolated)
    int m_creatorPoints;  // 2.011 +0x130 (interpolated)
    int m_secretCoins;  // 2.011 +0x134 (interpolated)
    int m_userCoins;  // 2.011 +0x138 (accessor)
    int m_iconID;  // 2.011 +0x13c (interpolated)
    int m_color1;  // 2.011 +0x140 (accessor)
    int m_color2;  // 2.011 +0x144 (accessor)
    int m_special;  // 2.011 +0x148 (accessor)
    IconType m_iconType;  // 2.011 +0x14c (accessor)
    PAD = win 0x40;
    int m_globalRank;  // 2.011 +0x190 (accessor)
    int m_friendStatus;  // 2.011 +0x194 (accessor)
}

class GManager : cocos2d::CCNode {

    void save() {
        saveGMTo(m_fileName);
    }
    void saveData(DS_Dictionary*, gd::string) = mac 0x26f4b0;
    void saveGMTo(gd::string) = mac 0x26f3b0, win 0x25220;

    inline GManager() {}

    gd::string m_fileName;
    bool m_setup;
    bool m_saved;
    bool m_quickSave;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void setup() = mac 0x26EE20, win 0x24f90;
    virtual void encodeDataTo(DS_Dictionary* data) {}
    virtual void dataLoaded(DS_Dictionary* data) {}
    virtual void firstLoad() {}
    virtual void gd20_slot_111() = win 0x1ed70;  // 2.0 slot, name unknown
    virtual void gd20_slot_112() = win 0x1ed80;  // 2.0 slot, name unknown
}

class GooglePlayDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void googlePlaySignedIn() {}
}

class GooglePlayManager : cocos2d::CCNode {
    virtual bool init() = win 0xd720;

    static GooglePlayManager* sharedState();

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x202a0;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(GooglePlayDelegate*) = win 0x202b0;
    virtual void gd20_slot_109() = win 0x25510;  // 2.0 slot (getDelegate2, types unknown)
    virtual void setDelegate2(GooglePlayDelegate*) = win 0x25520;
}

class GameLevelManager : cocos2d::CCNode {
    cocos2d::CCArray* createAndGetScores(gd::string, GJScoreType) = win 0x80d40;
    GJGameLevel* createNewLevel() = mac 0x2b8180, win 0x7fa40;
    static GameLevelManager* sharedState() = mac 0x2a8340, win 0x7e830;
    void limitSavedLevels() = mac 0x2C0C30, win 0x82120;
    cocos2d::CCArray* getCompletedLevels(bool newFilter) = mac 0x2BEEE0;
    void getGJUserInfo(int) = mac 0x2CEBB0, win 0x89470;
    void getLevelLeaderboard(GJGameLevel* level, LevelLeaderboardType leaderboardType) = mac 0x2CD6F0;
    void getOnlineLevels(GJSearchObject*) = mac 0x2C5920, win 0x84290;
    void getPageInfo(char const*) = mac 0x2c0050, win 0x81900;
    void getUserList(UserListType listType) = mac 0x2d74a0, win 0x8f420;
    cocos2d::CCObject* getStoredUserList(UserListType) = win 0x8f9c0;
    cocos2d::CCArray* getSavedLevels(bool favorite, int levelFolder) = mac 0x2BE910;
    cocos2d::CCArray* getStoredOnlineLevels(char const*) = mac 0x2bfe80, win 0x81820;
    void getTopArtists(int, int) = mac 0x2ce3d0;
    void getTopArtistsKey(int) = mac 0x2ce7a0;
    void makeTimeStamp(char const*) = mac 0x2bfd90, win 0x81c90;
    GJGameLevel* getMainLevel(int id, bool unk) = win 0x7f6d0;
    bool hasLikedItemFullCheck(LikeItemType type, int itemID, int commentSourceID) = mac 0x2d83d0;
    bool hasRatedLevelStars(int levelID) = mac 0x2ca3a0, win 0x87340;
    callback void ProcessHttpRequest(gd::string, gd::string, gd::string, GJHttpType) = mac 0x2a8670;
    static cocos2d::CCDictionary* responseToDict(gd::string response, bool comment) = win 0x93550;
    void storeUserNames(gd::string) = win 0x7ff00;
    void storeUserName(int userID, int accountID, gd::string str) = mac 0x2B9020, win 0x80130;
    gd::string userNameForUserID(int id) = mac 0x2B91D0, win 0x802e0;
    void updateUserScore() = mac 0x2CB6A0, win 0x87fa0;
    void uploadAccountComment(gd::string text);
    void uploadLevelComment(int levelID, gd::string text, int unk);
    void uploadComment(gd::string text, CommentType type, int levelID, int unk);
    void deleteComment(int commentID, CommentType type, int levelID) = win 0x8c990;
    void downloadLevel(int id, bool downloadData);
    bool hasDownloadedLevel(int id) = win 0x86840;
    GJGameLevel* getSavedLevel(int id) = win 0x811c0;
    void saveLevel(GJGameLevel* level) = win 0x81290;
    void deleteLevel(GJGameLevel* level) = mac 0x2b88d0, win 0x7fd20;
    void resetCommentTimersForLevelID(int id, bool commentHistory) = mac 0x2D43D0;
    void resetStoredUserInfo(int id) {
        m_storedUserInfo->removeObjectForKey(id);
    }
    void resetAccountComments(int id){
        int i = 0;
        while(true){
            auto key = this->getAccountCommentKey(id, i++);
            auto levels = getStoredOnlineLevels(key);
            if(levels != nullptr){
                m_storedLevels->removeObjectForKey(key);
            }else{
                break;
            }
        }
    }
    const char* getAccountCommentKey(int a2, int a3){
        return cocos2d::CCString::createWithFormat("a_%i_%i", a2, a3)->getCString();
    }

    inline static GameLevelManager* get() {
        return GameLevelManager::sharedState();
    }

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x202a0;  // 2.0 slot (getMainLevels, types unknown)
    virtual void setMainLevels(cocos2d::CCDictionary*) = win 0x7c280;
    virtual void gd20_slot_109() = win 0x25510;  // 2.0 slot (getValueDict, types unknown)
    virtual void setValueDict(cocos2d::CCDictionary*) = win 0x7c2c0;
    virtual void gd20_slot_111() = win 0x25610;  // 2.0 slot (getSavedLevelsDict, types unknown)
    virtual void setSavedLevelsDict(cocos2d::CCDictionary*) = win 0x53df0;
    virtual void gd20_slot_113() = win 0x6680;  // 2.0 slot (getStoredLevelDataDict, types unknown)
    virtual void setStoredLevelDataDict(cocos2d::CCDictionary*) = win 0x6690;
    virtual void gd20_slot_115() = win 0x14010;  // 2.0 slot (getFollowedUsersDict, types unknown)
    virtual void setFollowedUsersDict(cocos2d::CCDictionary*) = win 0x7c300;
    virtual void gd20_slot_117() = win 0x7c340;  // 2.0 slot (getLastSearchKey, types unknown)
    virtual void setLastSearchKey(gd::string) = win 0x7c380;
    virtual void gd20_slot_119() = win 0x7c3f0;  // 2.0 slot (getLastSearchKey2, types unknown)
    virtual void setLastSearchKey2(gd::string) = win 0x7c430;
    virtual void gd20_slot_121() = win 0x7c4a0;  // 2.0 slot (getLastLeaderboard, types unknown)
    virtual void setLastLeaderboard(int) = win 0x7c4b0;
    virtual void gd20_slot_123() = win 0x7c4c0;  // 2.0 slot (getCreatedNewLevel, types unknown)
    virtual void setCreatedNewLevel(bool) = win 0x7c4d0;
    virtual void gd20_slot_125() = win 0x7c4e0;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(LevelManagerDelegate*) = win 0x7c4f0;
    virtual void gd20_slot_127() = win 0x7c500;  // 2.0 slot (getDlDelegate, types unknown)
    virtual void setDlDelegate(LevelDownloadDelegate*) = win 0x7c510;
    virtual void gd20_slot_129() = win 0x19320;  // 2.0 slot (getCommentDelegate, types unknown)
    virtual void setCommentDelegate(LevelCommentDelegate*) = win 0x7c520;
    virtual void gd20_slot_131() = win 0xde30;  // 2.0 slot (getCommentUpDelegate, types unknown)
    virtual void setCommentUpDelegate(CommentUploadDelegate*) = win 0xde40;
    virtual void gd20_slot_133() = win 0x19330;  // 2.0 slot (getUpDelegate, types unknown)
    virtual void setUpDelegate(LevelUploadDelegate*) = win 0x19340;
    virtual void gd20_slot_135() = win 0x19350;  // 2.0 slot (getUpdateDelegate, types unknown)
    virtual void setUpdateDelegate(LevelUpdateDelegate*) = win 0x7c530;
    virtual void gd20_slot_137() = win 0x2d020;  // 2.0 slot (getLeaderboardDelegate, types unknown)
    virtual void setLeaderboardDelegate(LeaderboardManagerDelegate*) = win 0x2d030;
    virtual void gd20_slot_139() = win 0x7c540;  // 2.0 slot (getLvlDelDelegate, types unknown)
    virtual void setLvlDelDelegate(LevelDeleteDelegate*) = win 0x7c550;
    virtual void gd20_slot_141() = win 0x2d080;  // 2.0 slot (getUserDelegate, types unknown)
    virtual void setUserDelegate(UserInfoDelegate*) = win 0x2d090;
    virtual void gd20_slot_143() = win 0x2d0a0;  // 2.0 slot (getUActionDelegate, types unknown)
    virtual void setUActionDelegate(UploadActionDelegate*) = win 0x2d0b0;
    virtual void gd20_slot_145() = win 0x26080;  // 2.0 slot (getULDelegate, types unknown)
    virtual void setULDelegate(UserListDelegate*) = win 0x2d0c0;
    virtual void gd20_slot_147() = win 0x26090;  // 2.0 slot (getFRequestDelegate, types unknown)
    virtual void setFRequestDelegate(FriendRequestDelegate*) = win 0xdf70;
    virtual void gd20_slot_149() = win 0x1eeb0;  // 2.0 slot (getMListDelegate, types unknown)
    virtual void setMListDelegate(MessageListDelegate*) = win 0xdfa0;
    virtual void gd20_slot_151() = win 0xdfb0;  // 2.0 slot (getDLMessageDelegate, types unknown)
    virtual void setDLMessageDelegate(DownloadMessageDelegate*) = win 0x1eec0;
    virtual void gd20_slot_153() = win 0x2d0f0;  // 2.0 slot (getMsgUDelegate, types unknown)
    virtual void setMsgUDelegate(UploadMessageDelegate*) = win 0x2d100;
    virtual void gd20_slot_155() = win 0xdff0;  // 2.0 slot (getLastSearchType, types unknown)
    virtual void setLastSearchType(SearchType) = win 0x7c560;
    virtual void gd20_slot_157() = win 0x1eef0;  // 2.0 slot (getLastMapPackID, types unknown)
    virtual void setLastMapPackID(int) = win 0x1ef00;
    virtual void gd20_slot_159() = win 0x7c570;  // 2.0 slot (getTempSave, types unknown)
    virtual void setTempSave(gd::string) = win 0x7c5b0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    cocos2d::CCDictionary* m_mainLevels;  // 2.011 +0xe8 (accessor)
    cocos2d::CCDictionary* m_searchFilters;  // 2.011 +0xec (voted)
    cocos2d::CCDictionary* m_onlineLevels;  // 2.011 +0xf0 (voted)
    cocos2d::CCDictionary* m_unkDict;  // 2.011 +0xf4 (interpolated)
    cocos2d::CCDictionary* m_followedCreators;  // 2.011 +0xf8 (voted)
    cocos2d::CCDictionary* m_timerDict;  // 2.011 +0xfc (voted)
    cocos2d::CCDictionary* m_knownUsers;  // 2.011 +0x100 (interpolated)
    cocos2d::CCDictionary* m_accountIDtoUserIDDict;  // 2.011 +0x104 (interpolated)
    cocos2d::CCDictionary* m_userIDtoAccountIDDict;  // 2.011 +0x108 (interpolated)
    cocos2d::CCDictionary* m_storedLevels;  // 2.011 +0x10c (voted)
    cocos2d::CCDictionary* m_pageInfo;  // 2.011 +0x110 (accessor)
    PAD = win 0x8;
    cocos2d::CCDictionary* m_downloadObjects;  // 2.011 +0x11c (voted)
    cocos2d::CCDictionary* m_unkDict24;  // 2.011 +0x120 (voted)
    cocos2d::CCDictionary* m_storedUserInfo;  // 2.011 +0x124 (interpolated)
    cocos2d::CCDictionary* m_friendRequests;  // 2.011 +0x128 (interpolated)
    cocos2d::CCDictionary* m_userMessages;  // 2.011 +0x12c (interpolated)
    cocos2d::CCDictionary* m_userReplies;  // 2.011 +0x130 (interpolated)
    gd::string m_unkStr1;  // 2.011 +0x134 (interpolated)
    gd::string m_unkStr2;  // 2.011 +0x14c (interpolated)
    LeaderboardState m_leaderboardState;  // 2.011 +0x164 (interpolated)
    bool m_unkEditLevelLayerOnBack;  // 2.011 +0x168 (interpolated)
    PAD = win 0x3;
    OnlineListDelegate* m_onlineListDelegate;  // 2.011 +0x16c (voted)
    LevelDownloadDelegate* m_levelDownloadDelegate;  // 2.011 +0x170 (voted)
    LevelCommentDelegate* m_levelCommentDelegate;  // 2.011 +0x174 (interpolated)
    CommentUploadDelegate* m_commentUploadDelegate;  // 2.011 +0x178 (interpolated)
    LevelUploadDelegate* m_levelUploadDelegate;  // 2.011 +0x17c (interpolated)
    LevelUpdateDelegate* m_levelUpdateDelegate;  // 2.011 +0x180 (interpolated)
    LeaderboardManagerDelegate* m_leaderboardManagerDelegate;  // 2.011 +0x184 (voted)
    LevelDeleteDelegate* m_levelDeleteDelegate;  // 2.011 +0x188 (interpolated)
    UserInfoDelegate* m_userInfoDelegate;  // 2.011 +0x18c (interpolated)
    LevelManagerDelegate* m_levelManagerDelegate;  // 2.011 +0x190 (voted)
    UserListDelegate* m_userListDelegate;  // 2.011 +0x194 (interpolated)
    FriendRequestDelegate* m_friendRequestDelegate;  // 2.011 +0x198 (voted)
    MessageListDelegate* m_messageListDelegate;  // 2.011 +0x19c (voted)
    PAD = win 0x28;
}

class GameManager : GManager {
    int getPlayerSpider();  // GD 2.011 port: inline body needs m_playerSpider (no 2.0 offset)

    int getPlayerDeathEffect();  // GD 2.011 port: inline body needs m_playerDeathEffect (no 2.0 offset)

    void setPlayerSpider(int id);  // GD 2.011 port: inline body needs m_playerSpider (no 2.0 offset)

    void setPlayerDeathEffect(int id);  // GD 2.011 port: inline body needs m_playerDeathEffect (no 2.0 offset)

    void setQuality(cocos2d::TextureQuality quality);  // GD 2.011 port: inline body needs m_quality (no 2.0 offset)

    bool getGameVariableDefault(const char* key, bool defaultValue) {
        auto object = static_cast<cocos2d::CCString*>(m_valueKeeper->objectForKey(std::string("gv_") + key));
        if (object == nullptr)
            return defaultValue;
        return object->boolValue();
    }
    int getIntGameVariableDefault(const char* key, int defaultValue) {
        auto object = static_cast<cocos2d::CCString*>(m_valueKeeper->objectForKey(std::string("gv_") + key));
        if (object == nullptr)
            return defaultValue;
        return object->intValue();
    }
    static GameManager* get() {
        return GameManager::sharedState();
    }

    void accountStatusChanged() = mac 0x1cdad0;
    cocos2d::_ccColor3B colorForIdx(int) = mac 0x1cbc80, ios 0x237488, win 0x9e9f0;
    void didExitPlayscene() = mac 0x1d0230;
    void doQuickSave() = mac 0x1d0200, win 0xa2b00;
    void fadeInMusic(const char*) = mac 0x1c2ff0, win 0x9ad00;
    void getBGTexture(int) = mac 0x1cca00, win 0x9f180;
    void getFontFile(int) = mac 0x1cc5f0, win 0x9f020;
    void getFontTexture(int) = mac 0x1cc640, win 0x9f0b0;
    bool getGameVariable(const char*) = mac 0x1cccd0, win 0x9f520;
    int getIntGameVariable(const char*) = mac 0x1cd1d0, win 0x9f860;
    bool getUGV(const char*) = mac 0x1ccfa0;
    void loadBackground(int) = mac 0x1cc820;
    void loadDeathEffect(int) = mac 0x1cc690;
    void loadFont(int) = mac 0x1cc550;
    void loadGround(int) = mac 0x1cc8e0, win 0x9f240;
    void reloadAll(bool, bool, bool) = mac 0x1d08a0, win 0xa2f70;
    void reloadAllStep2() = mac 0x1d0940, ios 0x23b1f4, win 0xa3000;
    void reloadAllStep3() = win 0xa3120;
    void reloadAllStep4() = win 0xa3190;
    void reloadAllStep5() = mac 0x1d0b00, win 0xa3200;
    void reportPercentageForLevel(int, int, bool) = mac 0x1c5b00, win 0x9be50;
    void setGameVariable(const char*, bool) = mac 0x1cca80, win 0x9f340;
    void setIntGameVariable(const char*, int) = mac 0x1cd0e0, win 0x9f780;
    void setUGV(char const*, bool) = mac 0x1cce50;
    static GameManager* sharedState() = mac 0x1c2b30, ios 0x2321b8, win 0x9ac40;
    ~GameManager() = mac 0x1d0e00, win 0x99fe0;
    void getGTexture(int) = mac 0x1cca40;
    virtual bool init() = mac 0x1c2ec0, win 0x9acc0;
    void reportAchievementWithID(char const*, int, bool) = mac 0x1c6460, win 0x9c1d0;
    cocos2d::CCSize resolutionForKey(int) = mac 0x1d0b40, win 0xa32b0;
    virtual void update(float) = mac 0x1d0270, win 0xa2b60;
    bool isColorUnlocked(int _id, bool _type) = mac 0x1c3b90, win 0x9b2a0;
    bool isIconUnlocked(int _id, IconType _type) = mac 0x1c35b0, win 0x9afc0;
    void toggleGameVariable(const char* key) = win 0x9f680;
    void returnToLastScene(GJGameLevel* level) = mac 0x1d0500, win 0xa2cd0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_113() = win 0x15e00;  // 2.0 slot (getCustomObjectDict, types unknown)
    virtual void setValueKeeper(cocos2d::CCDictionary*) = win 0x9a320;
    virtual void gd20_slot_115() = win 0x9a360;  // 2.0 slot (getDidSyncAchievements, types unknown)
    virtual void setCustomObjectDict(cocos2d::CCDictionary*) = win 0x9a370;
    virtual void gd20_slot_117() = win 0x9a3b0;  // 2.0 slot (getEditorCopyString, types unknown)
    virtual void setDidSyncAchievements(bool) = win 0x9a3c0;
    virtual void gd20_slot_119() = win 0x7c340;  // 2.0 slot (getEditorCopyString, types unknown)
    virtual void setEditorCopyString(gd::string) = win 0x7c380;
    virtual PlayLayer* getPlayLayer() { 
        return m_playLayer;
    }
    virtual void setPlayLayer(PlayLayer*) = win 0x7dd00;
    virtual LevelEditorLayer* getEditorLayer() { 
        return m_levelEditorLayer;
    }
    virtual void setEditorLayer(LevelEditorLayer*) = win 0x7dd20;
    virtual void gd20_slot_125() = win 0x5ced0;  // 2.0 slot (getLevelSelectLayer, types unknown)
    virtual void setLevelSelectLayer(LevelSelectLayer*) = win 0x5cee0;
    virtual void gd20_slot_127() = win 0xdd50;  // 2.0 slot (getMenulayer, types unknown)
    virtual void setMenulayer(MenuLayer*) = win 0x5cef0;
    virtual void gd20_slot_129() = win 0x9a3d0;  // 2.0 slot (getMainMenuActive, types unknown)
    virtual void setMainMenuActive(bool) = win 0x9a3e0;
    virtual void gd20_slot_131() = win 0x9a3f0;  // 2.0 slot (getPremiumPopup, types unknown)
    virtual void gd20_slot_132() = win 0x9a400;  // 2.0 slot (setPremiumPopup, types unknown)
    virtual void gd20_slot_133() = win 0x2cf20;  // 2.0 slot (getFirstSetup, types unknown)
    virtual void setFirstSetup(bool) = win 0x2cf30;
    virtual void gd20_slot_135() = win 0x9a410;  // 2.0 slot (getShowedMenu, types unknown)
    virtual void setShowedMenu(bool) = win 0x9a420;
    virtual void gd20_slot_137() = win 0x7cda0;  // 2.0 slot (getPlayerUDID, types unknown)
    virtual void setPlayerUDID(gd::string) = win 0x7cde0;
    virtual void gd20_slot_139() = win 0x7ce50;  // 2.0 slot (getPlayerName, types unknown)
    virtual void setPlayerName(gd::string) = win 0x7ce90;
    virtual void gd20_slot_141() = win 0x26090;  // 2.0 slot (getPlayerUserID, types unknown)
    virtual void setPlayerUserID(int) = win 0xdf70;
    virtual void gd20_slot_143() = win 0x260a0;  // 2.0 slot (getPlayerScoreValid, types unknown)
    virtual void setPlayerScoreValid(bool) = win 0x260b0;
    virtual void gd20_slot_145() = win 0x34650;  // 2.0 slot (getDidRateGame, types unknown)
    virtual void setDidRateGame(bool) = win 0x34660;
    virtual void gd20_slot_147() = win 0x9a430;  // 2.0 slot (getDidLikeFacebook, types unknown)
    virtual void setDidLikeFacebook(bool) = win 0x9a440;
    virtual void gd20_slot_149() = win 0x9a450;  // 2.0 slot (getDidFollowTwitter, types unknown)
    virtual void setDidFollowTwitter(bool) = win 0x9a460;
    virtual void gd20_slot_151() = win 0x9a470;  // 2.0 slot (getDidSubYouTube, types unknown)
    virtual void setDidSubYouTube(bool) = win 0x9a480;
    virtual void gd20_slot_153() = win 0x1ef10;  // 2.0 slot (getDidPauseBGMusic, types unknown)
    virtual void setDidPauseBGMusic(bool) = win 0x1ef20;
    virtual void gd20_slot_155() = win 0x2d130;  // 2.0 slot (getWasHigh, types unknown)
    virtual void setWasHigh(bool) = win 0x2d140;
    virtual void gd20_slot_157() = win 0x9a490;  // 2.0 slot (getEditMode, types unknown)
    virtual void setEditMode(bool) = win 0x9a4a0;
    virtual void gd20_slot_159() = win 0x1ef30;  // 2.0 slot (getLastScene, types unknown)
    virtual void gd20_slot_160() = win 0x1ef40;  // 2.0 slot (setLastScene, types unknown)
    virtual void gd20_slot_161() = win 0x1ef50;  // 2.0 slot (getLastScene2, types unknown)
    virtual void gd20_slot_162() = win 0x1ef60;  // 2.0 slot (setLastScene2, types unknown)
    virtual void gd20_slot_163() = win 0x9a4b0;  // 2.0 slot (getReturnToSearch, types unknown)
    virtual void setReturnToSearch(bool) = win 0x9a4c0;
    virtual int getPlayerFrame() = win 0x9a4d0;  // GD 2.011 port: real function (inline body needed m_playerFrame)

    virtual void setPlayerFrame(int id) = win 0x9a4e0;  // GD 2.011 port: real function (inline body needed m_playerFrame)

    virtual int getPlayerShip() = win 0x9a530;  // GD 2.011 port: real function (inline body needed m_playerShip)

    virtual void setPlayerShip(int id) = win 0x9a540;  // GD 2.011 port: real function (inline body needed m_playerShip)

    virtual int getPlayerBall() = win 0x9a590;  // GD 2.011 port: real function (inline body needed m_playerBall)

    virtual void setPlayerBall(int id) = win 0x9a5a0;  // GD 2.011 port: real function (inline body needed m_playerBall)

    virtual int getPlayerBird() = win 0x9a5f0;  // GD 2.011 port: real function (inline body needed m_playerBird)

    virtual void setPlayerBird(int id) = win 0x9a600;  // GD 2.011 port: real function (inline body needed m_playerBird)

    virtual int getPlayerDart() = win 0x9a650;  // GD 2.011 port: real function (inline body needed m_playerDart)

    virtual void setPlayerDart(int id) = win 0x9a660;  // GD 2.011 port: real function (inline body needed m_playerDart)

    virtual int getPlayerRobot() = win 0x9a6b0;  // GD 2.011 port: real function (inline body needed m_playerRobot)

    virtual void setPlayerRobot(int id) = win 0x9a6c0;  // GD 2.011 port: real function (inline body needed m_playerRobot)

    virtual int getPlayerColor() = win 0x9a710;  // GD 2.011 port: real function (inline body needed m_playerColor)

    virtual void setPlayerColor(int id) = win 0x9a720;  // GD 2.011 port: real function (inline body needed m_playerColor)

    virtual int getPlayerColor2() = win 0x9a770;  // GD 2.011 port: real function (inline body needed m_playerColor2)

    virtual void setPlayerColor2(int id) = win 0x9a780;  // GD 2.011 port: real function (inline body needed m_playerColor2)

    virtual int getPlayerStreak() = win 0x9a7d0;  // GD 2.011 port: real function (inline body needed m_playerStreak)

    virtual void setPlayerStreak(int id) = win 0x9a7e0;  // GD 2.011 port: real function (inline body needed m_playerStreak)

    virtual bool getPlayerGlow() {
        return m_playerGlow; 
    }
    virtual void setPlayerGlow(bool v) {
        m_playerGlow = v;
    }
    virtual IconType getPlayerIconType() {
        return m_playerIconType; 
    }
    virtual void setPlayerIconType(IconType v) {
        m_playerIconType = v;
    }
    virtual void gd20_slot_187() = win 0x7d1b0;  // 2.0 slot (getDidSetupEveryplay, types unknown)
    virtual void setDidSetupEveryplay(bool) = win 0x7d1c0;
    virtual void gd20_slot_189() = win 0x9a850;  // 2.0 slot (getShowSongMarkers, types unknown)
    virtual void setShowSongMarkers(bool) = win 0x9a860;
    virtual void gd20_slot_191() = win 0x9a870;  // 2.0 slot (getShowBPMMarkers, types unknown)
    virtual void setShowBPMMarkers(bool) = win 0x9a880;
    virtual void gd20_slot_193() = win 0x9a890;  // 2.0 slot (getRecordGameplay, types unknown)
    virtual void setRecordGameplay(bool) = win 0x9a8a0;
    virtual void gd20_slot_195() = win 0x9a8b0;  // 2.0 slot (getShowProgressBar, types unknown)
    virtual void setShowProgressBar(bool) = win 0x9a8c0;
    virtual void gd20_slot_197() = win 0x9a8d0;  // 2.0 slot (getPerformanceMode, types unknown)
    virtual void setPerformanceMode(bool) = win 0x9a8e0;
    virtual void gd20_slot_199() = win 0x9a8f0;  // 2.0 slot (getCommentSortRecent, types unknown)
    virtual void setCommentSortRecent(bool) = win 0x9a900;
    virtual void gd20_slot_201() = win 0x9a910;  // 2.0 slot (getShowedPirate, types unknown)
    virtual void setShowedPirate(bool) = win 0x9a920;
    virtual void gd20_slot_203() = win 0x9a930;  // 2.0 slot (getClickedGarage, types unknown)
    virtual void setClickedGarage(bool) = win 0x9a940;
    virtual void gd20_slot_205() = win 0x9a950;  // 2.0 slot (getClickedEditor, types unknown)
    virtual void setClickedEditor(bool) = win 0x9a960;
    virtual void gd20_slot_207() = win 0x9a970;  // 2.0 slot (getClickedName, types unknown)
    virtual void setClickedName(bool) = win 0x9a980;
    virtual void gd20_slot_209() = win 0x9a990;  // 2.0 slot (getClickedPractice, types unknown)
    virtual void setClickedPractice(bool) = win 0x9a9a0;
    virtual void gd20_slot_211() = win 0x9a9b0;  // 2.0 slot (getShowedEditorGuide, types unknown)
    virtual void setShowedEditorGuide(bool) = win 0x9a9c0;
    virtual void gd20_slot_213() = win 0x9a9d0;  // 2.0 slot (getShowedRateDiffDialog, types unknown)
    virtual void setShowedRateDiffDialog(bool) = win 0x9a9e0;
    virtual void gd20_slot_215() = win 0x9a9f0;  // 2.0 slot (getShowedRateStarDialog, types unknown)
    virtual void setShowedRateStarDialog(bool) = win 0x9aa00;
    virtual void gd20_slot_217() = win 0x9aa10;  // 2.0 slot (getShowedLowDetailDialog, types unknown)
    virtual void setShowedLowDetailDialog(bool) = win 0x9aa20;
    virtual void gd20_slot_219() = win 0x7d230;  // 2.0 slot (getRateDelegate, types unknown)
    virtual void setRateDelegate(GameRateDelegate*) = win 0x7d240;
    virtual void gd20_slot_221() = win 0x9aa30;  // 2.0 slot (getStoredColor, types unknown)
    virtual void setStoredColor(cocos2d::ccColor3B) = win 0x9aa50;
    virtual void gd20_slot_223() = win 0x7d270;  // 2.0 slot (getLastLevelID, types unknown)
    virtual void setLastLevelID(int) = win 0x7d280;
    virtual void gd20_slot_225() = win 0x9aa70;  // 2.0 slot (getLastCustomColorIdx, types unknown)
    virtual void setLastCustomColorIdx(int) = win 0x9aa80;
    virtual void gd20_slot_227() = win 0x5cdd0;  // 2.0 slot (getLastGroupID, types unknown)
    virtual void setLastGroupID(int) = win 0x5cde0;
    virtual void gd20_slot_229() = win 0x9aa90;  // 2.0 slot (getLoadedBGIdx, types unknown)
    virtual void gd20_slot_230() = win 0x9aaa0;  // 2.0 slot (getLoadedGIdx, types unknown)
    virtual void gd20_slot_231() = win 0x9aab0;  // 2.0 slot (getLoadedFontIdx, types unknown)
    virtual void gd20_slot_232() = win 0x9aac0;  // 2.0 slot (getTotalAttempts, types unknown)
    virtual void setTotalAttempts(int) = win 0x9aad0;
    virtual void gd20_slot_234() = win 0x9aae0;  // 2.0 slot (getBootups, types unknown)
    virtual void setBootups(int) = win 0x9aaf0;
    virtual void gd20_slot_236() = win 0x7d360;  // 2.0 slot (getHasRatedGame, types unknown)
    virtual void setHasRatedGame(bool) = win 0x7d370;
    virtual void gd20_slot_238() = win 0x7d380;  // 2.0 slot (getDidPlayGame, types unknown)
    virtual void setDidPlayGame(bool) = win 0x7d390;
    virtual void gd20_slot_240() = win 0x9ab00;  // 2.0 slot (getIsResetting, types unknown)
    virtual void setIsResetting(bool) = win 0x9ab10;
    virtual void gd20_slot_242() = win 0x9ab20;  // 2.0 slot (getShowingPromo, types unknown)
    virtual void setShowingPromo(bool) = win 0x9ab30;
    virtual void gd20_slot_244() = win 0x9ab40;  // 2.0 slot (getTestSmoothFix, types unknown)
    virtual void setTestSmoothFix(bool) = win 0x9ab50;
    virtual void gd20_slot_246() = win 0x9ab60;  // 2.0 slot (getHasRatingPower, types unknown)
    virtual void setHasRatingPower(bool) = win 0x9ab70;
    virtual void gd20_slot_248() = win 0x9ab80;  // 2.0 slot (getFetchNewLevelsQueued, types unknown)
    virtual void setFetchNewLevelsQueued(bool) = win 0x9ab90;
    virtual void gd20_slot_250() = win 0x9aba0;  // 2.0 slot (getResolution, types unknown)
    virtual void setResolution(int) = win 0x9abb0;
    virtual void gd20_slot_252() = win 0x9abc0;  // 2.0 slot (getTexQuality, types unknown)
    virtual void setTexQuality(cocos2d::TextureQuality) = win 0x9abd0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x104 ----
    bool m_switchModes;  // 2.011 +0x104 (interpolated)
    bool m_toFullscreen;  // 2.011 +0x105 (interpolated)
    bool m_reloading;  // 2.011 +0x106 (interpolated)
    bool m_unknown0;  // 2.011 +0x107 (voted)
    PAD = win 0x4;
    cocos2d::CCDictionary* m_valueKeeper;  // 2.011 +0x10c (accessor)
    cocos2d::CCDictionary* m_customObjectDict;  // 2.011 +0x110 (accessor)
    PAD = win 0x4;
    double m_adTimer;  // 2.011 +0x118 (voted)
    PAD = win 0x10;
    bool m_loaded;  // 2.011 +0x130 (voted)
    PAD = win 0x3;
    gd::string m_unknownString;  // 2.011 +0x134 (interpolated)
    PlayLayer* m_playLayer;  // 2.011 +0x14c (accessor)
    LevelEditorLayer* m_levelEditorLayer;  // 2.011 +0x150 (interpolated)
    int m_unknown1;  // 2.011 +0x154 (interpolated)
    MenuLayer* m_menuLayer;  // 2.011 +0x158 (accessor)
    bool m_inMenuLayer;  // 2.011 +0x15c (interpolated)
    PAD = win 0x3;
    void* m_unknownVariable;  // 2.011 +0x160 (interpolated)
    bool m_unknownBool3;  // 2.011 +0x164 (interpolated)
    bool m_unknownPlayLayerBool;  // 2.011 +0x165 (interpolated)
    bool m_unknownBool4;  // 2.011 +0x166 (interpolated)
    bool m_unknownBool5;  // 2.011 +0x167 (interpolated)
    gd::string m_playerUDID;  // 2.011 +0x168 (accessor)
    gd::string m_playerName;  // 2.011 +0x180 (accessor)
    geode::SeedValueRSV m_playerUserID;  // 2.011 +0x198 (accessor)
    PAD = win 0x10;
    int m_sceneEnum;  // 2.011 +0x1b4 (voted)
    PAD = win 0x74;
    bool m_playerGlow;  // 2.011 +0x22c (accessor)
    PAD = win 0x3;
    IconType m_playerIconType;  // 2.011 +0x230 (accessor)
    bool m_everyPlaySetup;  // 2.011 +0x234 (interpolated)
    bool m_showSongMarkers;  // 2.011 +0x235 (accessor)
    bool m_showBPMMarkers;  // 2.011 +0x236 (accessor)
    bool m_recordGameplay;  // 2.011 +0x237 (accessor)
    bool m_showProgressBar;  // 2.011 +0x238 (accessor)
    bool m_performanceMode;  // 2.011 +0x239 (accessor)
    PAD = win 0x2;
    bool m_clickedGarage;  // 2.011 +0x23c (accessor)
    bool m_clickedEditor;  // 2.011 +0x23d (accessor)
    bool m_clickedName;  // 2.011 +0x23e (accessor)
    bool m_clickedPractice;  // 2.011 +0x23f (accessor)
    bool m_showedEditorGuide;  // 2.011 +0x240 (accessor)
    bool m_showedRateDiffDialog;  // 2.011 +0x241 (accessor)
    bool m_showedRateStarDialog;  // 2.011 +0x242 (accessor)
    bool m_showedLowDetailDialog;  // 2.011 +0x243 (accessor)
    PAD = win 0x24;
    int m_bootups;  // 2.011 +0x268 (accessor)
    bool m_hasRatedGame;  // 2.011 +0x26c (accessor)
    bool m_unk0;  // 2.011 +0x26d (interpolated)
    bool m_unk1;  // 2.011 +0x26e (voted)
    PAD = win 0x5;
    int m_resolution;  // 2.011 +0x274 (accessor)
    PAD = win 0x8;
}

class GameObject : CCSpritePlus {
    cocos2d::CCPoint getStartPosition() { 
        return m_startPosition;
    }
    void setStartPosition(cocos2d::CCPoint const& p) {
        m_startPosition = p;
    }
    short getGroupID(int ix) {
        return m_groups->at(ix);
    }
    short getGroupIDCount() {
        return m_groupCount; 
    }
    gd::vector<short> getGroupIDs() {
        std::vector<short> res;
    
        if (m_groups && m_groups->at(0))
            for (auto i = 0; i < m_groupCount; i++)
                res.push_back(m_groups->at(i));
    
        return res;
    }
    int getGameZOrder();  // GD 2.011 port: inline body needs m_gameZOrder (no 2.0 offset)

    void setGameZOrder(int z);  // GD 2.011 port: inline body needs m_gameZOrder (no 2.0 offset)

    void setGameObjType(GameObjectType t) {
        m_objectType = t;
    }
    GJSpriteColor* getBaseColor();  // GD 2.011 port: inline body needs m_baseColor (no 2.0 offset)

    GJSpriteColor* getDetailColor() {
        return m_detailColor;
    }

    GameObject() = mac 0xdc4c0, win 0x77510; // yeah why is this here wtf, seems life ego ctor created this
    ~GameObject() = mac 0x2f4ca0, win 0x77510;
    virtual void update(float) = mac 0x2fbb90, win 0x2ce50;
    virtual void setScaleX(float) = mac 0x335b00, win 0xb1930;
    virtual void setScaleY(float) = mac 0x335b90, win 0xb19c0;
    virtual void setScale(float) = mac 0x335c20, win 0xb1a50;
    virtual void setPosition(const cocos2d::CCPoint&) = mac 0x335850, win 0xb16e0;
    virtual void setVisible(bool) = mac 0x336280, win 0xb20d0;
    virtual void setRotation(float) = mac 0x335970, win 0xb17d0;
    virtual void setOpacity(GLubyte) = mac 0x335f10, win 0xb1d00;
    virtual bool initWithTexture(cocos2d::CCTexture2D*) = mac 0x2f56a0, win 0xa3f80;
    virtual void setChildColor(const cocos2d::ccColor3B&) = mac 0x341f20, win 0xb7280;
    virtual void setFlipX(bool) = mac 0x335a60, win 0xb18b0;
    virtual void setFlipY(bool) = mac 0x335ab0, win 0xb18f0;
    void activatedByPlayer(GameObject*) = mac 0x342a20, win 0xb7a70;
    void addColorSprite() = mac 0x2f7fe0, win 0xa4980;
    void addColorSpriteToParent(bool) = mac 0x2fb470, win 0xb4620;
    void addGlow() = mac 0x2f5c10, win 0xa4410;
    void addToTempOffset(float, float) = mac 0x335700;
    void calculateOrientedBox() = mac 0x342b20, win 0xb7b30;
    void canChangeCustomColor() = mac 0x342db0, win 0xb7e60;
    float groupOpacityMod() = win 0xb4eb0;
    cocos2d::_ccColor3B& colorForMode(int colorMode, bool isMain) = mac 0x343460, win 0xb8370;
    cocos2d::_ccColor3B& groupColor(cocos2d::_ccColor3B const&, bool);
    cocos2d::_ccColor3B& getActiveColorForMode(int, bool) = mac 0x343860, win 0xb8600;
    void commonSetup() = mac 0x2f5570;
    void copyGroups(GameObject*) = mac 0x33ae30, win 0xb4c10;
    static GameObject* createWithFrame(const char*) = mac 0x2f5490, win 0xa3df0;
    static GameObject* createWithKey(int) = mac 0x2f4ce0, win 0xa3c10;
    void destroyObject() = mac 0x336a00, win 0xb2340;
    void determineSlopeDirection() = mac 0x33a9e0, win 0xb4840;
    void getBallFrame(int) = mac 0x341bf0;
    cocos2d::CCPoint const& getBoxOffset() = mac 0x3353d0, win 0xb7ce0;
    const cocos2d::_ccColor3B& getColorIndex() = mac 0x343b90;
    void getDidUpdateLastPosition() = mac 0x343a20;
    void getMainColorMode() = mac 0x334c30;
    void getObjectZOrder() = mac 0x337d70;
    // inlined on windows
    float getObjectRadius();  // GD 2.011 port: inline body needs m_scale (no 2.0 offset)

    void getSecondaryColorMode() = mac 0x341c20;
    void getSectionIdx() = mac 0x343a00;
    void groupWasDisabled() = mac 0x33b110;
    void groupWasEnabled() = mac 0x33b0f0;
    void hasBeenActivated() = mac 0x342a80, win 0xb7ad0;
    bool hasBeenActivatedByPlayer(GameObject*) = mac 0x342a50, win 0xb7aa0;
    void hasSecondaryColor() = mac 0x342f80;
    void ignoreEnter() = mac 0x3352a0;
    void ignoreFade() = mac 0x335290;
    void isBasicTrigger() = mac 0x343d10;
    void isColorTrigger() = mac 0x343b40, win 0xb8870;
    void isSpawnableTrigger() = mac 0x343a60, win 0xb8810;
    void isSpecialObject() = mac 0x343c40;
    void loadGroupsFromString(gd::string str) = mac 0x33b380, win 0xb4dc0;
    static GameObject* objectFromString(gd::string, bool) = mac 0x33b720;
    void playShineEffect() = mac 0x2fa9d0, win 0xb3ed0;
    bool canRotateFree() {
        return (
            m_objectType != GameObjectType::Solid &&
            m_objectType != GameObjectType::Breakable &&
            m_objectType != GameObjectType::Slope
        );
    }
    //void quickUpdatePosition() = mac 0x335790;
    // inlined on windows
    void quickUpdatePosition() {
        cocos2d::CCPoint newPos = getRealPosition();
        this->setPosition(newPos);
        if (m_detailSprite && !m_hasDetailColor) {
            m_detailSprite->setPosition(newPos);
        }
    }
    void removeGlow() = mac 0x2f7f70;
    void resetGroupDisabled() = mac 0x2fa7e0;
    void saveActiveColors() = mac 0x33d250, win 0xb6e60;
    void selectObject(cocos2d::ccColor3B) = mac 0x341f90, win 0xb72e0;
    void setDefaultMainColorMode(int) = mac 0x304fc0, win 0xb7f10;
    void setDidUpdateLastPosition(bool const&) = mac 0x343a30;
    void setGlowOpacity(unsigned char) = mac 0x336200;
    void setLastPosition(cocos2d::CCPoint const&) = mac 0x3439e0;
    void setMainColorMode(int) = mac 0x342e70;
    void setSectionIdx(int const&) = mac 0x343a10;
    void setupCoinArt() = mac 0x337dd0, win 0xb2e90;
    void slopeFloorTop() = mac 0x342800;
    void slopeWallLeft() = mac 0x3427e0, win 0xb78e0;
    void updateCustomScale(float) = mac 0x335eb0;
    void updateMainColor() = mac 0x343340;
    void updateObjectEditorColor() = mac 0x3423c0, win 0xb77c0;
    void updateOrientedBox() = mac 0x342b50, win 0xb7b50;
    void updateSecondaryColor() = mac 0x343740;
    void updateStartPos() = mac 0x2fa590, win 0xa5470;
    void updateState() = mac 0x3369e0;
    void updateSyncedAnimation(float) = mac 0x337f00, win 0xb3170;
    void updateTextObject(gd::string, bool) = mac 0x2f58d0, win 0xa4170;
    void deselectObject() = mac 0x3423a0;
    cocos2d::CCRepeatForever* createRotateAction(float f, int n);
    void setMyAction(cocos2d::CCAction* pAction) = win 0xa5b00;
    bool canAllowMultiActivate() = mac 0x343ca0;
    void createGroupContainer(int size) = mac 0x33aca0, win 0xb4a40;
    void setupCustomSprites() = mac 0x307f60, win 0xa9920;
    void addMainSpriteToParent(bool) = mac 0x33a5b0, win 0xb4450;
    void setGlowColor(cocos2d::_ccColor3B const&) = mac 0x341ed0;
    void addToGroup(int) = mac 0x33ad00;
    void removeFromGroup(int) = mac 0x33ada0;
    void spawnXPosition() = mac 0xdc1b0;
    cocos2d::CCPoint getStartPos() const = mac 0xdc230;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void customSetup() = mac 0x2fbba0, win 0xa5ba0;
    virtual void resetObject() = mac 0x2fa620, ios 0xd1470, win 0xa54f0;
    virtual void triggerObject() = win 0xa5730;
    void triggerObject(GJBaseGameLayer*) { this->triggerObject(); }
    virtual void activateObject() = mac 0x2faf60, win 0xa5800;
    virtual void deactivateObject(bool) = mac 0x2fb8f0, win 0xa5940;
    virtual cocos2d::CCRect const& getObjectRect() = mac 0x3352b0, win 0xb1340;
    virtual cocos2d::CCRect getObjectRect(float, float) = mac 0x3352d0, win 0xb1370;
    virtual cocos2d::CCRect const& getObjectRect2(float, float) = mac 0x3354e0, win 0xb1490;
    virtual cocos2d::CCRect const& getObjectTextureRect() = mac 0x3355b0, win 0xb1540;
    virtual cocos2d::CCPoint getRealPosition() = mac 0x335750, win 0xb1690;
    virtual void setStartPos(cocos2d::CCPoint) = mac 0x2fa520, win 0xa5410;
    virtual void updateStartValues() = mac 0x2fa800, win 0xa5670;
    virtual void customObjectSetup(gd::map<gd::string, gd::string>&) {}
    virtual gd::string getSaveString() = mac 0x33d3d0, win 0xb5fd0;
    virtual bool isFlipX() = mac 0x335a40, win 0xb1890;
    virtual bool isFlipY() = mac 0x335a50, win 0xb18a0;
    virtual void setRScaleX(float) = mac 0x335cb0, win 0xb1ae0;
    virtual void setRScaleY(float) = mac 0x335d60, win 0xb1b90;
    virtual void setRScale(float) = mac 0x335e10, win 0xb1c40;
    virtual void getRScaleX() = mac 0x335e50, win 0xb1c80;
    virtual void getRScaleY() = mac 0x335e80, win 0xb1cc0;
    virtual void calculateSpawnXPos() = mac 0x336970, win 0xb22e0;
    virtual void triggerActivated() = win 0xb22f0;
    void triggerActivated(float) { this->triggerActivated(); }
    virtual void powerOnObject() = mac 0x3369a0, win 0xb2300;
    virtual void powerOffObject() = mac 0x3369c0, win 0xb2320;
    virtual void setObjectColor(const cocos2d::ccColor3B&) = mac 0x341c90, win 0xb7060;
    virtual void getOrientedBox() = mac 0x342ad0, win 0xb7af0;
    virtual void gd20_slot_164() = win 0xb4aa0;  // 2.0 slot, name unknown
    virtual void gd20_slot_165() = win 0xb4bb0;  // 2.0 slot, name unknown
    virtual void gd20_slot_166() = win 0x77a00;  // 2.0 slot, name unknown
    virtual void gd20_slot_167() = win 0x77a10;  // 2.0 slot (getLockColorAsChild, types unknown)
    virtual void setLockColorAsChild(bool) = win 0x77a20;
    virtual void gd20_slot_169() = win 0x10d30;  // 2.0 slot, name unknown
    virtual void gd20_slot_170() = win 0x10d50;  // 2.0 slot, name unknown
    virtual void gd20_slot_171() = win 0x2f900;  // 2.0 slot, name unknown
    virtual void gd20_slot_172() = win 0x77a30;  // 2.0 slot, name unknown
    virtual void gd20_slot_173() = win 0x77a40;  // 2.0 slot (getFadeInPosOffset, types unknown)
    virtual void setFadeInPosOffset(float) = win 0x77a50;
    virtual void getObjectRectDirty() const = mac 0xdc1d0, win 0x77a70;
    virtual void setObjectRectDirty(bool) = mac 0xdc1e0, win 0x77a80;
    virtual void getOrientedRectDirty() const = mac 0xdc1f0, win 0x77a90;
    virtual void setOrientedRectDirty(bool) = mac 0xdc200, win 0x77aa0;
    virtual void gd20_slot_179() = win 0x77ab0;  // 2.0 slot (getMainColorBlack, types unknown)
    virtual void gd20_slot_180() = win 0x77ac0;  // 2.0 slot (getSecondaryColorBlack, types unknown)
    virtual void gd20_slot_181() = win 0x77ad0;  // 2.0 slot (getMainBlend, types unknown)
    virtual void gd20_slot_182() = win 0x77ae0;  // 2.0 slot (getSecondaryBlend, types unknown)
    virtual void gd20_slot_183() = win 0x77af0;  // 2.0 slot (getHasCustomChildren, types unknown)
    virtual void setHasCustomChildren(bool) = win 0x77b00;
    virtual void gd20_slot_185() = win 0x77b10;  // 2.0 slot (getIsAnimated, types unknown)
    virtual void gd20_slot_186() = win 0x77b20;  // 2.0 slot, name unknown
    virtual void gd20_slot_187() = win 0x77b30;  // 2.0 slot (getIgnoreScreenCheck, types unknown)
    virtual void setIgnoreScreenCheck(bool) = win 0x77b40;
    virtual void gd20_slot_189() = win 0x77b50;  // 2.0 slot (getRadius, types unknown)
    virtual void gd20_slot_190() = win 0x77b60;  // 2.0 slot (getIsRotated, types unknown)
    virtual void gd20_slot_191() = win 0x77b70;  // 2.0 slot (getScaleModX, types unknown)
    virtual void setScaleModX(float) = win 0x77b80;
    virtual void gd20_slot_193() = win 0x77ba0;  // 2.0 slot (getScaleModY, types unknown)
    virtual void setScaleModY(float) = win 0x77bb0;
    virtual void gd20_slot_195() = win 0x77bd0;  // 2.0 slot (getM_ID, types unknown)
    virtual void setM_ID(int) = win 0x77be0;
    virtual GameObjectType getType() const = mac 0xdc210, win 0x77bf0;
    virtual void setType(GameObjectType) = mac 0xdc220, win 0x77c00;
    virtual void gd20_slot_199() = win 0x77c10;  // 2.0 slot (getTouchTriggered, types unknown)
    virtual void setTouchTriggered(bool) = win 0x77c20;
    virtual void gd20_slot_201() = win 0x77c30;  // 2.0 slot (getSpawnedByTrigger, types unknown)
    virtual void setSpawnedByTrigger(bool) = win 0x77c40;
    virtual void getLastPosition() = mac 0x3439d0, win 0x77c50;
    virtual void gd20_slot_204() = win 0x77c70;  // 2.0 slot, name unknown
    virtual void gd20_slot_205() = win 0x77cb0;  // 2.0 slot (getUseAudioScale, types unknown)
    virtual void setUseAudioScale(bool) = win 0x77cc0;
    virtual void gd20_slot_207() = win 0x77cd0;  // 2.0 slot (getStartRotation, types unknown)
    virtual void setStartRotation(float) = win 0x77ce0;
    virtual void gd20_slot_209() = win 0x77d00;  // 2.0 slot (getStartScaleX, types unknown)
    virtual void setStartScaleX(float) = win 0x77d10;
    virtual void gd20_slot_211() = win 0x77d30;  // 2.0 slot (getStartScaleY, types unknown)
    virtual void setStartScaleY(float) = win 0x77d40;
    virtual void gd20_slot_213() = win 0x77d60;  // 2.0 slot (getStartFlipX, types unknown)
    virtual void setStartFlipX(bool) = win 0x77d70;
    virtual void gd20_slot_215() = win 0x77d80;  // 2.0 slot (getStartFlipY, types unknown)
    virtual void setStartFlipY(bool) = win 0x77d90;
    virtual void gd20_slot_217() = win 0x77da0;  // 2.0 slot (getShouldHide, types unknown)
    virtual void setShouldHide(bool) = win 0x77db0;
    virtual void gd20_slot_219() = win 0x77dc0;  // 2.0 slot (getSpawnXPos, types unknown)
    virtual void gd20_slot_220() = win 0x77dd0;  // 2.0 slot (getIsInvisible, types unknown)
    virtual void gd20_slot_221() = win 0x77de0;  // 2.0 slot (getEnterAngle, types unknown)
    virtual void setEnterAngle(float) = win 0x77df0;
    virtual void gd20_slot_223() = win 0x77e10;  // 2.0 slot (getEnterEffect, types unknown)
    virtual void setEnterEffect(int) = win 0x77e20;
    virtual void gd20_slot_225() = win 0x77e30;  // 2.0 slot (getCustomColorIdx, types unknown)
    virtual void setCustomColorIdx(int) = win 0x77e40;
    virtual void gd20_slot_227() = win 0x77e50;  // 2.0 slot (getCustomScale, types unknown)
    virtual void setCustomScale(float) = win 0x77e60;
    virtual void gd20_slot_229() = win 0x77e80;  // 2.0 slot (getObjectKey, types unknown)
    virtual void setObjectKey(int) = win 0x77e90;
    virtual void gd20_slot_231() = win 0x77ea0;  // 2.0 slot (getDontTransform, types unknown)
    virtual void setDontTransform(bool) = win 0x77eb0;
    virtual void gd20_slot_233() = win 0x77ec0;  // 2.0 slot (getDontFade, types unknown)
    virtual void setDontFade(bool) = win 0x77ed0;
    virtual void gd20_slot_235() = win 0x77ee0;  // 2.0 slot (getDontApplyEffect, types unknown)
    virtual void setDontApplyEffect(bool) = win 0x77ef0;
    virtual void gd20_slot_237() = win 0x77f00;  // 2.0 slot (getDontApplyFade, types unknown)
    virtual void setDontApplyFade(bool) = win 0x77f10;
    virtual void gd20_slot_239() = win 0x77f20;  // 2.0 slot (getDontFadeTinted, types unknown)
    virtual void setDontFadeTinted(bool) = win 0x77f30;
    virtual void gd20_slot_241() = win 0x77f40;  // 2.0 slot (getIsTintObject, types unknown)
    virtual void setIsTintObject(bool) = win 0x77f50;
    virtual void gd20_slot_243() = win 0x77f60;  // 2.0 slot (getIsDetailColorObject, types unknown)
    virtual void gd20_slot_244() = win 0x77f70;  // 2.0 slot (getCustomDontFade, types unknown)
    virtual void setCustomDontFade(bool) = win 0x77f80;
    virtual void gd20_slot_246() = win 0x77f90;  // 2.0 slot (getStateVar, types unknown)
    virtual void setStateVar(bool) = win 0x77fa0;
    virtual void gd20_slot_248() = win 0x77fb0;  // 2.0 slot (getObjectZ, types unknown)
    virtual void setObjectZ(int) = win 0x77fc0;
    virtual void gd20_slot_250() = win 0x77fd0;  // 2.0 slot (getAddToBatch2, types unknown)
    virtual void setAddToBatch2(bool) = win 0x77fe0;
    virtual void gd20_slot_252() = win 0x77ff0;  // 2.0 slot (getColorOnTop, types unknown)
    virtual void setColorOnTop(bool) = win 0x78000;
    virtual void gd20_slot_254() = win 0x78010;  // 2.0 slot (getCustomAudioScale, types unknown)
    virtual void gd20_slot_255() = win 0x78020;  // 2.0 slot (getMinAudioScale, types unknown)
    virtual void gd20_slot_256() = win 0x78030;  // 2.0 slot (getMaxAudioScale, types unknown)
    virtual unsigned int getUniqueID() {
        return m_uniqueID;
    }
    virtual void setUniqueID(int) = win 0x78050;
    virtual void gd20_slot_259() = win 0x78060;  // 2.0 slot (getObjectID, types unknown)
    virtual void setObjectID(int) = win 0x78070;
    virtual void gd20_slot_261() = win 0x78080;  // 2.0 slot (getInvisibleMode, types unknown)
    virtual void gd20_slot_262() = win 0x78090;  // 2.0 slot (getGlowUseBGColor, types unknown)
    virtual void gd20_slot_263() = win 0x780a0;  // 2.0 slot (getUseSpecialLight, types unknown)
    virtual void gd20_slot_264() = win 0x780b0;  // 2.0 slot (getGlowOpacityMod, types unknown)
    virtual void setGlowOpacityMod(float) = win 0x780c0;
    virtual void gd20_slot_266() = win 0x780e0;  // 2.0 slot (getUpSlope, types unknown)
    virtual void gd20_slot_267() = win 0x780f0;  // 2.0 slot (getSlopeType, types unknown)
    virtual void gd20_slot_268() = win 0x78100;  // 2.0 slot (getSlopeAngle, types unknown)
    virtual void gd20_slot_269() = win 0x78110;  // 2.0 slot (getDamaging, types unknown)
    virtual void gd20_slot_270() = win 0x78120;  // 2.0 slot, name unknown
    virtual void gd20_slot_271() = win 0x78130;  // 2.0 slot, name unknown
    virtual void gd20_slot_272() = win 0x78140;  // 2.0 slot (getAddedToBlend, types unknown)
    virtual void gd20_slot_273() = win 0x78150;  // 2.0 slot (getZLayer, types unknown)
    virtual void setZLayer(int) = win 0x78160;
    virtual void gd20_slot_275() = win 0x78170;  // 2.0 slot (getCustomZLayer, types unknown)
    virtual void setCustomZLayer(int) = win 0x78180;
    virtual void gd20_slot_277() = win 0x78190;  // 2.0 slot (getCustomObjectZ, types unknown)
    virtual void setCustomObjectZ(int) = win 0x781a0;
    virtual void gd20_slot_279() = win 0x781b0;  // 2.0 slot (getTextBlockString, types unknown)
    virtual void setTextBlockString(gd::string) = win 0x781f0;
    virtual void gd20_slot_281() = win 0x78260;  // 2.0 slot (getEditorSelected, types unknown)
    virtual void setEditorSelected(bool) = win 0x78270;
    virtual void gd20_slot_283() = win 0x78280;  // 2.0 slot (getWasSelected, types unknown)
    virtual void setWasSelected(bool) = win 0x78290;
    virtual void gd20_slot_285() = win 0x782a0;  // 2.0 slot (getIsSelected, types unknown)
    virtual void setIsSelected(bool) = win 0x782b0;
    virtual void gd20_slot_287() = win 0x782c0;  // 2.0 slot (getEditorSelectIdx, types unknown)
    virtual void setEditorSelectIdx(int) = win 0x782d0;
    virtual void gd20_slot_289() = win 0x782e0;  // 2.0 slot (getStoredPosition, types unknown)
    virtual void setStoredPosition(cocos2d::CCPoint) = win 0x78300;
    virtual void gd20_slot_291() = win 0x78320;  // 2.0 slot (getNeedsReorder, types unknown)
    virtual void setNeedsReorder(bool) = win 0x78330;
    virtual void gd20_slot_293() = win 0x78340;  // 2.0 slot (getNeedsUpdateColor, types unknown)
    virtual void setNeedsUpdateColor(bool) = win 0x78350;
    virtual void gd20_slot_295() = win 0x78360;  // 2.0 slot (getEditorCustomScale, types unknown)
    virtual void setEditorCustomScale(float) = win 0x78370;
    virtual void gd20_slot_297() = win 0x78390;  // 2.0 slot (getIsGroupParent, types unknown)
    virtual void setIsGroupParent(bool) = win 0x783a0;
    virtual void gd20_slot_299() = win 0x783b0;  // 2.0 slot (getGroupCount, types unknown)
    virtual void gd20_slot_300() = win 0x783c0;  // 2.0 slot (getEditorLayerID, types unknown)
    virtual void setEditorLayerID(int) = win 0x783d0;
    virtual void gd20_slot_302() = win 0x783e0;  // 2.0 slot (getEditorLayerID2, types unknown)
    virtual void setEditorLayerID2(int) = win 0x783f0;
    virtual void gd20_slot_304() = win 0x78400;  // 2.0 slot (getGroupDisabledCount, types unknown)
    virtual void gd20_slot_305() = win 0x78410;  // 2.0 slot (getGroupUpdated, types unknown)
    virtual void setGroupUpdated(bool) = win 0x78420;
    virtual void gd20_slot_307() = win 0x78430;  // 2.0 slot (getUseCustomContentSize, types unknown)
    virtual void setUseCustomContentSize(bool) = win 0x78440;
    virtual void gd20_slot_309() = win 0x78450;  // 2.0 slot (getUseCustomEditorHitbox, types unknown)
    virtual void setUseCustomEditorHitbox(bool) = win 0x78460;
    virtual void gd20_slot_311() = win 0x78470;  // 2.0 slot (getCustomHitBox, types unknown)
    virtual void setCustomHitBox(cocos2d::CCSize) = win 0x78490;
    virtual void gd20_slot_313() = win 0x784b0;  // 2.0 slot (getObjectClass, types unknown)
    virtual void gd20_slot_314() = win 0x784c0;  // 2.0 slot (setObjectClass, types unknown)
    virtual void gd20_slot_315() = win 0x784d0;  // 2.0 slot (getHasSyncedAnimation, types unknown)
    virtual void setHasSyncedAnimation(bool) = win 0x784e0;
    virtual void gd20_slot_317() = win 0x784f0;  // 2.0 slot (getIsTriggerSaved, types unknown)
    virtual void gd20_slot_318() = win 0x78500;  // 2.0 slot (getColorManager, types unknown)
    virtual void setColorManager(GJEffectManager*) = win 0x78510;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1c6 ----
    PAD = win 0x24;  // padfix +2
    bool m_editor;  // 2.011 +0x1e8 (voted)
    PAD = win 0x1b;
    cocos2d::CCPoint m_boxOffset;  // 2.011 +0x204 (accessor)
    bool m_isOriented;  // 2.011 +0x20c (interpolated)
    PAD = win 0x3;
    cocos2d::CCPoint m_boxOffset2;  // 2.011 +0x210 (interpolated)
    OBB2D* m_objectOBB2D;  // 2.011 +0x218 (voted)
    bool m_oriented;  // 2.011 +0x21c (voted)
    PAD = win 0x3;
    cocos2d::CCSprite* m_glowSprite;  // 2.011 +0x220 (interpolated)
    bool m_notEditor;  // 2.011 +0x224 (interpolated)
    PAD = win 0x3;
    cocos2d::CCAction* m_myAction;  // 2.011 +0x228 (accessor)
    bool m_unk1;  // 2.011 +0x22c (voted)
    bool m_runActionWithTag;  // 2.011 +0x22d (interpolated)
    bool m_objectPoweredOn;  // 2.011 +0x22e (interpolated)
    PAD = win 0x1;
    cocos2d::CCSize m_objectSize;  // 2.011 +0x230 (interpolated)
    bool m_modifier;  // 2.011 +0x238 (voted)
    bool m_active;  // 2.011 +0x239 (interpolated)
    bool m_animationFinished;  // 2.011 +0x23a (interpolated)
    PAD = win 0x1;
    cocos2d::CCParticleSystemQuad* m_particleSystem;  // 2.011 +0x23c (voted)
    gd::string m_effectPlistName;  // 2.011 +0x240 (voted)
    bool m_particleAdded;  // 2.011 +0x258 (voted)
    bool m_hasParticles;  // 2.011 +0x259 (interpolated)
    bool m_unkCustomRing;  // 2.011 +0x25a (interpolated)
    PAD = win 0x1;
    cocos2d::CCPoint m_portalPosition;  // 2.011 +0x25c (voted)
    cocos2d::CCRect m_objectTextureRect;  // 2.011 +0x264 (voted)
    bool m_textureRectDirty;  // 2.011 +0x274 (voted)
    PAD = win 0x3;
    float m_rectXCenterMaybe;  // 2.011 +0x278 (interpolated)
    cocos2d::CCRect m_objectRect2;  // 2.011 +0x27c (interpolated)
    bool m_isObjectRectDirty;  // 2.011 +0x28c (accessor)
    bool m_isOrientedRectDirty;  // 2.011 +0x28d (accessor)
    bool m_hasBeenActivated;  // 2.011 +0x28e (voted)
    bool m_hasBeenActivatedP2;  // 2.011 +0x28f (voted)
    bool m_hasDetailColor;  // 2.011 +0x290 (voted)
    PAD = win 0x3;
    bool m_unknown346;  // 2.011 +0x294 (voted)
    bool m_unknownVisibility347;  // 2.011 +0x295 (interpolated)
    PAD = win 0x2;
    bool m_isAnimated;  // 2.011 +0x298 (accessor)
    PAD = win 0x3;
    cocos2d::CCSprite* m_detailSprite;  // 2.011 +0x29c (voted)
    bool m_unk2e8;  // 2.011 +0x2a0 (interpolated)
    PAD = win 0x3;
    float m_objectRadius;  // 2.011 +0x2a4 (interpolated)
    bool m_isRotatedSide;  // 2.011 +0x2a8 (voted)
    PAD = win 0xf;
    GameObjectType m_objectType;  // 2.011 +0x2b8 (voted)
    int m_section;  // 2.011 +0x2bc (interpolated)
    bool m_touchTriggered;  // 2.011 +0x2c0 (accessor)
    bool m_spawnTriggered;  // 2.011 +0x2c1 (interpolated)
    PAD = win 0x2;
    cocos2d::CCPoint m_startPosition;  // 2.011 +0x2c4 (voted)
    gd::string m_textureName;  // 2.011 +0x2cc (voted)
    bool m_useAudioScale;  // 2.011 +0x2e4 (accessor)
    bool m_sleeping;  // 2.011 +0x2e5 (interpolated)
    PAD = win 0x2;
    float m_rotation;  // 2.011 +0x2e8 (interpolated)
    cocos2d::CCSize m_obStartScale;  // 2.011 +0x2ec (interpolated)
    bool m_startFlipX;  // 2.011 +0x2f4 (accessor)
    bool m_startFlipY;  // 2.011 +0x2f5 (accessor)
    bool m_shouldHide;  // 2.011 +0x2f6 (accessor)
    PAD = win 0x1;
    float m_spawnXPosition;  // 2.011 +0x2f8 (interpolated)
    bool m_invisible;  // 2.011 +0x2fc (accessor)
    PAD = win 0x3;
    float m_enterAngle;  // 2.011 +0x300 (accessor)
    PAD = win 0x11;
    bool m_isDontFade;  // 2.011 +0x315 (accessor)
    PAD = win 0x10;
    bool m_customAudioScale;  // 2.011 +0x326 (accessor)
    bool m_lockColourAsChild;  // 2.011 +0x327 (interpolated)
    float m_minAudioScale;  // 2.011 +0x328 (accessor)
    float m_maxAudioScale;  // 2.011 +0x32c (accessor)
    int m_uniqueID;  // 2.011 +0x330 (accessor)
    int m_objectID;  // 2.011 +0x334 (accessor)
    bool m_invisibleMode;  // 2.011 +0x338 (accessor)
    bool m_glowUserBackgroundColour;  // 2.011 +0x339 (interpolated)
    bool m_useSpecialLight;  // 2.011 +0x33a (accessor)
    bool m_orbOrPad;  // 2.011 +0x33b (interpolated)
    float m_glowOpacityMod;  // 2.011 +0x33c (accessor)
    bool m_upSlope;  // 2.011 +0x340 (accessor)
    PAD = win 0x3;
    int m_slopeType;  // 2.011 +0x344 (accessor)
    float m_slopeAngle;  // 2.011 +0x348 (accessor)
    PAD = win 0x8;
    GJSpriteColor* m_detailColor;  // 2.011 +0x354 (voted)
    PAD = win 0x4;
    ZLayer m_zLayer;  // 2.011 +0x35c (accessor)
    PAD = win 0x8;
    gd::string m_textObjectString;  // 2.011 +0x368 (voted)
    bool m_showGamemodeBorders;  // 2.011 +0x380 (interpolated)
    bool m_unk3D9;  // 2.011 +0x381 (interpolated)
    bool m_isSelected;  // 2.011 +0x382 (accessor)
    PAD = win 0x1;
    int m_globalClickCounter;  // 2.011 +0x384 (interpolated)
    PAD = win 0x8;
    bool m_shouldUpdateColorSprite;  // 2.011 +0x390 (interpolated)
    PAD = win 0x3;
    float m_multiScaleMultiplier;  // 2.011 +0x394 (interpolated)
    bool m_isGroupParent;  // 2.011 +0x398 (accessor)
    PAD = win 0x3;
    std::array<short, 10>* m_groups;  // 2.011 +0x39c (interpolated)
    short m_groupCount;  // 2.011 +0x3a0 (accessor)
    PAD = win 0x3e;
}

class GameObjectCopy : cocos2d::CCObject {
    virtual ~GameObjectCopy() = mac 0xa3290;
    static GameObjectCopy* create(GameObject*) = mac 0x975a0, win 0xfd3f0;
    void resetObject() = mac 0x976a0, win 0xfd510;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_9() = win 0x45e20;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x18 ----
    GameObject* m_object;  // 2.011 +0x18 (voted)
    PAD = win 0x14;
}

class GameRateDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_0() = win 0x6320;  // 2.0 slot (updateRate, types unknown)
}

class GameSoundManager : cocos2d::CCNode {
    void disableMetering() = mac 0x362d80, win 0x21ce0;
    void enableMetering() = mac 0x362d00, win 0x21c00;
    float getMeteringValue() = mac 0x362db0, win 0x21e00;
    void playBackgroundMusic(gd::string, bool, bool) = mac 0x362070, win 0x217c0;
    void playEffect(gd::string, float, float, float) = mac 0x3623d0, win 0x21960;
    void stopBackgroundMusic() = mac 0x362130, win 0x218b0;
    void asynchronousSetup() = win 0x21a30;
    ~GameSoundManager() = mac 0x362c00;
    static GameSoundManager* sharedManager() = mac 0x3610f0, win 0x21240;
    inline static GameSoundManager* get() {
        return GameSoundManager::sharedManager();
    }

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x211c0;  // 2.0 slot, name unknown
    virtual void gd20_slot_108() = win 0x211d0;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    PAD = win 0x10;
    bool m_preloaded;  // 2.011 +0xf8 (voted)
    PAD = win 0x7;
    gd::string m_filePath;  // 2.011 +0x100 (voted)
}

class GameStatsManager : cocos2d::CCNode {
    void awardCurrencyForLevel(GJGameLevel*) = mac 0x43600;
    void awardDiamondsForLevel(GJGameLevel*) = mac 0x43c60;
    void awardSecretKey() = mac 0x4b1e0;
    int getAwardedCurrencyForLevel(GJGameLevel*) = mac 0x432E0;
    int getBaseCurrencyForLevel(GJGameLevel*) = mac 0x43470;
    GJChallengeItem* getChallenge(int id) = mac 0x451f0;
    void getSecretCoinKey(char const*) = mac 0x429f0;
    int getStat(char const* type) = mac 0x3d310, win 0xb8ef0;
    void setStat(char const* type, int amount) = win 0xb8fb0;
    void hasPendingUserCoin(char const*) = mac 0x42730, win 0xbc640;
    void hasSecretCoin(char const*) = mac 0x40730;
    void hasUserCoin(char const*) = mac 0x427e0, win 0xbc4d0;
    void incrementChallenge(GJChallengeType type, int count);
    void incrementStat(char const*) = mac 0x3d6d0;
    void incrementStat(char const*, int) = mac 0x3d6e0;
    static GameStatsManager* sharedState() = mac 0x38f20, win 0xb8cd0;
    void storePendingUserCoin(char const*) = mac 0x42940;
    void storeSecretCoin(char const*) = mac 0x42a10;
    void storeUserCoin(char const*) = mac 0x42890, win 0xbc590;
    bool isItemUnlocked(UnlockType type, int id);
    void checkAchievement(char const* type) = win 0xb9090;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x25510;  // 2.0 slot (getValueDict, types unknown)
    virtual void setValueDict(cocos2d::CCDictionary*) = win 0x7c2c0;
    virtual void gd20_slot_109() = win 0x25610;  // 2.0 slot (getCompletedLevels, types unknown)
    virtual void setCompletedLevels(cocos2d::CCDictionary*) = win 0x53df0;
    virtual void gd20_slot_111() = win 0x6680;  // 2.0 slot (getUserCoinsDict, types unknown)
    virtual void setUserCoinsDict(cocos2d::CCDictionary*) = win 0x6690;
    virtual void gd20_slot_113() = win 0x14010;  // 2.0 slot (getPendingUserCoinsDict, types unknown)
    virtual void setPendingUserCoinsDict(cocos2d::CCDictionary*) = win 0x7c300;
    virtual void gd20_slot_115() = win 0x211c0;  // 2.0 slot (getRandomContainer, types unknown)
    virtual void setRandomContainer(cocos2d::CCDictionary*) = win 0xb8bf0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    PAD = win 0x4;
    cocos2d::CCDictionary* m_playerStats;  // 2.011 +0xec (voted)
    cocos2d::CCDictionary* m_completedLevels;  // 2.011 +0xf0 (accessor)
    cocos2d::CCDictionary* m_verifiedUserCoins;  // 2.011 +0xf4 (voted)
    PAD = win 0xc;
}

class GameToolbox {
    static gd::string stringFromHSV(cocos2d::ccHSVValue hsv, const char* separator) = mac 0x28cf90;
    static cocos2d::ccHSVValue hsvFromString(gd::string str, char const* separator) = mac 0x28cc30, win 0x23180;
    static cocos2d::CCDictionary* stringSetupToDict(gd::string text, char const* delimeter) = mac 0x28d700, win 0x23680;
    static CCMenuItemToggler* createToggleButton(gd::string text, cocos2d::SEL_MenuHandler onToggled, bool isToggled, cocos2d::CCMenu* toggleMenu, cocos2d::CCPoint position, cocos2d::CCNode* callbackTarget, cocos2d::CCNode* labelParent, cocos2d::CCArray* toggleArray) = mac 0x28bc90;
    static CCMenuItemToggler* createToggleButton(gd::string text, cocos2d::SEL_MenuHandler onToggled, bool isToggled, cocos2d::CCMenu* toggleMenu, cocos2d::CCPoint position, cocos2d::CCNode* callbackTarget, cocos2d::CCNode* labelParent, float checkboxScale, float labelSize, float maxWidth, cocos2d::CCPoint labelOffset, const char* unknown, bool anchorHorizontally, int toggleTag) = win 0x225d0;
    static cocos2d::ccColor3B transformColor(cocos2d::ccColor3B const& src, cocos2d::ccHSVValue hsv) = mac 0x28c950;
    static void alignItemsHorisontally(cocos2d::CCArray* array, float pad, cocos2d::CCPoint start, bool idk);
    static gd::map<gd::string, gd::string> stringSetupToMap(gd::string, char const*) = mac 0x28d4c0, win 0x234a0;
    static cocos2d::ccColor3B multipliedColorValue(cocos2d::ccColor3B color1, cocos2d::ccColor3B color2, float factor) = win 0x230c0;
}

class GaragePage : cocos2d::CCLayer, ListButtonBarDelegate {
    static GaragePage* create(IconType type, GJGarageLayer* pGarage, cocos2d::SEL_MenuHandler pSelectCallback) {
        auto pRet = new GaragePage();
    
        if (pRet && pRet->init(type, pGarage, pSelectCallback)) {
            pRet->autorelease();
            return pRet;
        }
    
        CC_SAFE_DELETE(pRet);
        return nullptr;
    }

    void listButtonBarSwitchedPage(ListButtonBar* bar, int idk) = win 0xd0fd0;
    inline GaragePage() {}
    bool init(IconType type, GJGarageLayer* pGarage, cocos2d::SEL_MenuHandler pSelectCallback) = mac 0x1bb710, ios 0x225d5c, win 0xd0400;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x11c ----
    PAD = win 0x8;
    CCMenuItemSpriteExtra* m_unkNode0x12c;  // 2.011 +0x124 (voted)
    IconType m_type;  // 2.011 +0x128 (voted)
    PAD = win 0x8;
}

// GD 2.011 port: 2.1-only class, stub
class GauntletSelectLayer {
}

class GhostTrailEffect : cocos2d::CCNode {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x247c0;  // 2.0 slot (getScaleMod, types unknown)
    virtual void setScaleMod(float) = win 0x247d0;
    virtual void gd20_slot_109() = win 0x247f0;  // 2.0 slot (getBlendFunc, types unknown)
    virtual void setBlendFunc(cocos2d::_ccBlendFunc) = win 0x24810;
    virtual void gd20_slot_111() = win 0x135b0;  // 2.0 slot (getTarget, types unknown)
    virtual void setTarget(cocos2d::CCSprite*) = win 0x135c0;
    virtual void gd20_slot_113() = win 0x135d0;  // 2.0 slot (getPosTarget, types unknown)
    virtual void setPosTarget(cocos2d::CCSprite*) = win 0x135e0;
    virtual void gd20_slot_115() = win 0x15e00;  // 2.0 slot (getPTarget, types unknown)
    virtual void setPTarget(cocos2d::CCNode*) = win 0x24830;
    virtual void gd20_slot_117() = win 0x24840;  // 2.0 slot (getStartAlpha, types unknown)
    virtual void setStartAlpha(float) = win 0x24850;
    virtual void gd20_slot_119() = win 0x13640;  // 2.0 slot (getDelegate, types unknown)
    virtual void gd20_slot_120() = win 0x13650;  // 2.0 slot (setDelegate, types unknown)
    virtual void gd20_slot_121() = win 0x24870;  // 2.0 slot (getGhostColor, types unknown)
    virtual void setGhostColor(cocos2d::ccColor3B) = win 0x24890;
    virtual void gd20_slot_123() = win 0x248b0;  // 2.0 slot (getInternalOffset, types unknown)
    virtual void setInternalOffset(cocos2d::CCPoint) = win 0x248d0;
    virtual void gd20_slot_125() = win 0x248f0;  // 2.0 slot (getUsePosScale, types unknown)
    virtual void setUsePosScale(bool) = win 0x24900;
}

class HSVWidgetPopup : FLAlertLayer {
    bool init(cocos2d::_ccHSVValue value, HSVWidgetPopupDelegate* delegate, gd::string title) = mac 0x236d30, win 0x3ddf0;
    void onClose(cocos2d::CCObject* sender) = win 0x3e160;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1c8 ----
    ConfigureHSVWidget* m_configureWidget;  // 2.011 +0x1c8 (same own size)
    HSVWidgetPopupDelegate* m_delegate;  // 2.011 +0x1cc (same own size)
}

class HSVWidgetPopupDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void hsvPopupClosed(HSVWidgetPopup* popup, cocos2d::ccHSVValue value) {}
}

class HardStreak : cocos2d::CCDrawNode {
    // ~HardStreak() = mac 0x5bf00; inlined on windows
    virtual bool init() = mac 0x5c090, win 0xe4580;
    void addPoint(cocos2d::CCPoint) = mac 0x5c950, win 0xe4d00;
    void clearBehindXPos(float) = mac 0x5cb40, win 0xe4d40;
    static HardStreak* create() = mac 0x5bfd0, win 0xe44e0;
    void firstSetup() = mac 0x5c160, win 0xe45e0;
    double normalizeAngle(double) = mac 0x5cbe0;
    cocos2d::CCPoint quadCornerOffset(cocos2d::CCPoint, cocos2d::CCPoint, float) = mac 0x5c990;
    void reset() = mac 0x5c930;
    void resumeStroke() = mac 0x5c210;
    void stopStroke() = mac 0x5c8f0, win 0xe45b0;
    callback void updateStroke(float) = mac 0x5c240, win 0xe4680;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x248b0;  // 2.0 slot (getEndPoint, types unknown)
    virtual void setEndPoint(cocos2d::CCPoint) = win 0x248d0;
    virtual void gd20_slot_109() = win 0xe43b0;  // 2.0 slot (getStrokeScale, types unknown)
    virtual void setStrokeScale(float) = win 0xe43c0;
    virtual void gd20_slot_111() = win 0xe43e0;  // 2.0 slot (getStrokeScaleMod, types unknown)
    virtual void setStrokeScaleMod(float) = win 0xe43f0;
    virtual void gd20_slot_113() = win 0x7e590;  // 2.0 slot (getDisableDual, types unknown)
    virtual void setDisableDual(bool) = win 0x7e5a0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x118 ----
    cocos2d::CCArray* m_pointsArr;  // 2.011 +0x118 (same own size)
    cocos2d::CCPoint m_currentPoint;  // 2.011 +0x11c (same own size)
    float m_waveSize;  // 2.011 +0x124 (same own size)
    float m_pulseSize;  // 2.011 +0x128 (same own size)
    bool m_isSolid;  // 2.011 +0x12c (same own size)
    PAD = win 0x3;
}

class InfoAlertButton : CCMenuItemSpriteExtra {
    bool init(gd::string title, gd::string text, float scale) = win 0xe50d0;
    void activate() = win 0xe51d0;
    inline InfoAlertButton() {}
    static InfoAlertButton* create(gd::string title, gd::string text, float scale) = mac 0x2ecad0, win 0xe4e60;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class InfoLayer : FLAlertLayer, LevelCommentDelegate, CommentUploadDelegate, FLAlertLayerProtocol {
    bool init(GJGameLevel* level, GJUserScore* score) = mac 0x456850;
    void setupCommentsBrowser(cocos2d::CCArray* comments) = mac 0x458590, win 0xe76b0;
    void onMore(cocos2d::CCObject* sender) = mac 0x459400, win 0xe6b60;
    void onLevelInfo(cocos2d::CCObject* sender) = mac 0x459400, win 0xe6e70;
    void loadPage(int page, bool) = mac 0x458FB0;
    static InfoLayer* create(GJGameLevel* level, GJUserScore* score) = mac 0x456600;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1d4 ----
    GJGameLevel* m_level;  // 2.011 +0x1d4 (voted)
    PAD = win 0x20;
    GJCommentListLayer* m_list;  // 2.011 +0x1f8 (voted)
    PAD = win 0x24;
    int m_page;  // 2.011 +0x220 (voted)
    PAD = win 0x4;
}

class InheritanceNode : cocos2d::CCObject {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_9() = win 0x45e20;  // 2.0 slot (getIndex, types unknown)
    virtual void setIndex(int) = win 0xc2e60;
    virtual void gd20_slot_11() = win 0x26660;  // 2.0 slot (getTarget, types unknown)
    virtual void setTarget(InheritanceNode*) = win 0x26670;
    virtual void gd20_slot_13() = win 0xc2e70;  // 2.0 slot (getIsStart, types unknown)
    virtual void setIsStart(bool) = win 0xc2e80;
}

class KeybindingsLayer : FLAlertLayer {
    void onClose(cocos2d::CCObject* sender);
    void onPrevPage(cocos2d::CCObject* sender) = win 0xd9220;
    void onNextPage(cocos2d::CCObject* sender) = win 0xd9210;
    void goToPage(int page) = win 0xd9230;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1c8 ----
    int m_currentPage;  // 2.011 +0x1c8 (same own size)
    int m_itemCount;  // 2.011 +0x1cc (same own size)
    int m_pageCount;  // 2.011 +0x1d0 (same own size)
    cocos2d::CCDictionary* m_pages;  // 2.011 +0x1d4 (same own size)
    cocos2d::CCDictionary* m_unused;  // 2.011 +0x1d8 (same own size)
    cocos2d::CCNode* m_leftArrow;  // 2.011 +0x1dc (same own size)
    cocos2d::CCNode* m_rightArrow;  // 2.011 +0x1e0 (same own size)
}

// GD 2.011 port: 2.1-only class, stub
class LabelGameObject {
}

class LeaderboardManagerDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void updateUserScoreFinished() {}
    virtual void updateUserScoreFailed() {}
    virtual void loadLeaderboardFinished(cocos2d::CCArray*, const char*) {}
    virtual void loadLeaderboardFailed(const char*) {}
}

class LeaderboardsLayer : cocos2d::CCLayer, LeaderboardManagerDelegate {
    static LeaderboardsLayer* create(LeaderboardState state) = mac 0x29F590, win 0xe8b90;
    bool init(LeaderboardState state) = mac 0x29f6d0, win 0xe8c30;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class LevelBrowserLayer : cocos2d::CCLayer, LevelManagerDelegate, FLAlertLayerProtocol {
    static cocos2d::CCScene* scene(GJSearchObject* search) {
        auto scene = cocos2d::CCScene::create();
        scene->addChild(LevelBrowserLayer::create(search));

        AppDelegate::get()->m_runningScene = scene;
        return scene;
    }

    bool init(GJSearchObject* search) = mac 0x2513f0, win 0xea4c0;
    void loadPage(GJSearchObject* search) = mac 0x253650, win 0xeb090;
    void setupLevelBrowser(cocos2d::CCArray* levels) = win 0xeb770;
    virtual void setupPageInfo(gd::string, char const*) = mac 0x255050, win 0xebbf0;
    void updateLevelsLabel() = mac 0x255450, win 0xebd50;
    void onRefresh(cocos2d::CCObject* sender) = mac 0x253090, win 0xec520;
    void onInfo(cocos2d::CCObject* sender) = mac 0x253170, win 0xec090;
    void onNew(cocos2d::CCObject* sender) = mac 0x252ac0, win 0xec180;
    static LevelBrowserLayer* create(GJSearchObject* search) = mac 0x251210, ios 0x2d0a00, win 0xea420;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x120 ----
    PAD = win 0x4;
    TextArea* m_noInternet;  // 2.011 +0x124 (interpolated)
    GJListLayer* m_list;  // 2.011 +0x128 (voted)
    PAD = win 0x10;
    GJSearchObject* m_searchObject;  // 2.011 +0x13c (voted)
    PAD = win 0x14;
}

class LevelCell : TableViewCell {

    void onViewProfile(cocos2d::CCObject*) = mac 0x11a4a0, win 0x49c90;
    void loadCustomLevelCell() = mac 0x1183b0, win 0x47d10;
    void updateBGColor(int index) = mac 0x110460, win 0x49ba0;
    void loadFromLevel(GJGameLevel* level) = mac 0x110410, win 0x47cc0;
    inline LevelCell(char const* identifier, float parentHeight, float height) : TableViewCell(identifier, parentHeight, height) {}

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x170 ----
    GJGameLevel* m_level;  // 2.011 +0x170 (voted)
}

class LevelCommentDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void loadCommentsFinished(cocos2d::CCArray*, char const*)  {}
    virtual void loadCommentsFailed(char const*)  {}
    virtual void updateUserScoreFinished()  {}
    virtual void setupPageInfo(gd::string, char const*)  {}
}

class LevelDeleteDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void levelDeleteFinished(int) {}
    virtual void levelDeleteFailed(int) {}
}

class LevelDownloadDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void levelDownloadFinished(GJGameLevel*) {}
    virtual void levelDownloadFailed(int) {}
}

class LevelEditorLayer : GJBaseGameLayer, LevelSettingsDelegate {
    static LevelEditorLayer* get() {
        return GameManager::sharedState()->m_levelEditorLayer;
    }
    static cocos2d::CCScene* scene(GJGameLevel* level) {
        auto scene = cocos2d::CCScene::create();
        scene->addChild(LevelEditorLayer::create(level));
        scene->setObjType(cocos2d::CCObjectType::LevelEditorLayer);

        AppDelegate::get()->m_runningScene = scene;
        return scene;
    }

    inline LevelEditorLayer() {}

    ~LevelEditorLayer() = mac 0x90a00, win 0xeca10;
    virtual void update(float) = mac 0xa1b70, win 0xfb840;
    virtual void draw() = mac 0xa2a70, win 0xfcb30;
    virtual void flipGravity(PlayerObject*, bool, bool) = mac 0xa04e0, win 0xfa1e0;
    virtual void calculateColorValues(EffectGameObject*, EffectGameObject*, int, float, ColorActionSprite*, GJEffectManager*) = mac 0x9c590, win 0xf6e50;
    virtual float timeForXPos(float) = mac 0x9c7d0, win 0xf7150;
    virtual void levelSettingsUpdated() = mac 0x93f30, win 0xeed60;
    static LevelEditorLayer* create(GJGameLevel* level) = mac 0x90fb0, ios 0x261628, win 0xed8f0;
    void activateTriggerEffect(EffectGameObject*, float, float, float) = mac 0x9b520;
    GameObject* addObjectFromString(gd::string) = mac 0x94640, win 0xef300;
    void addSpecial(GameObject*) = mac 0x94f30, win 0xf1040;
    void addToRedoList(UndoObject*) = mac 0x96f80, win 0xf07a0;
    void addToUndoList(UndoObject*, bool) = mac 0x94e20, win 0xf0d00;
    void animateInDualGround(GameObject*, float, bool) = mac 0xa2780;
    void assignNewStickyGroups(cocos2d::CCArray*) = mac 0x99fa0;
    bool checkCollisions(PlayerObject*, float) = mac 0x9e620, win 0xf8780;
    void createBackground() = mac 0x929f0, win 0xeebc0;
    void createGroundLayer() = mac 0x92840, win 0xee7f0;
    GameObject* createObject(int, cocos2d::CCPoint, bool) = mac 0x957c0, win 0xef3f0;
    void createObjectsFromSetup(gd::string) = mac 0x92230, win 0xeedd0;
    cocos2d::CCArray* createObjectsFromString(gd::string, bool) = mac 0x94730, win 0xef030;
    void getLastObjectX() = mac 0x9c860;
    gd::string getLevelString() = mac 0x97790, win 0xf0de0;
    int getNextColorChannel() = mac 0x9a610, win 0xf2fb0;
    void getNextFreeBlockID(cocos2d::CCArray*) = mac 0x9a4e0;
    int getNextFreeGroupID(cocos2d::CCArray*) = mac 0x9a1b0;
    void getNextFreeItemID(cocos2d::CCArray*) = mac 0x9a390;
    cocos2d::CCRect getObjectRect(GameObject* obj, bool updateRect) = mac 0x96240, win 0xefe40;
    void getRelativeOffset(GameObject*) = mac 0x96840;
    bool hasAction(bool) = mac 0x96ff0;
    void handleAction(bool, cocos2d::CCArray*) = mac 0x97020, win 0xf0870;
    bool init(GJGameLevel*) = mac 0x91010, win 0xed990;
    GameObject* objectAtPosition(cocos2d::CCPoint position) = mac 0x960c0, win 0xefa30;
    cocos2d::CCArray* objectsAtPosition(cocos2d::CCPoint position) = mac 0x96690, win 0xefc30;
    void objectMoved(GameObject*) = mac 0x999f0, win 0xf1500;
    cocos2d::CCArray* objectsInRect(cocos2d::CCRect rect, bool ignoreLayer) = mac 0x95e60, win 0xf0230;
    void onPlaytest() = mac 0xa06b0, win 0xfa670;
    void onResumePlaytest() = mac 0xa15e0, win 0xfadd0;
    void onPausePlaytest() = mac 0xa1570, win 0xfad20;
    void onStopPlaytest() = mac 0xa1780, win 0xfafa0;
    void playMusic() = mac 0xa13c0, win 0xfab60;
    void recreateGroups() = mac 0x9dbf0, win 0xf7b60;
    void redoLastAction() = mac 0x97750;
    void removeAllObjects() = mac 0x93d80, win 0xf0590;
    void removeAllObjectsOfType(int) = mac 0x96d40, win 0xf0660;
    void removeObject(GameObject*, bool) = mac 0x96890, win 0xf0510;
    void removeSpecial(GameObject*) = mac 0x969c0, win 0xf1650;
    void resetMovingObjects() = mac 0x9ddc0, win 0xf7c90;
    void resetObjectVector() = mac 0x9c4b0;
    void resetToggledGroups() = mac 0x9aa70;
    void resetToggledGroupsAndObjects() = mac 0x9c3c0;
    void resetEffectTriggerOptim(GameObject* obj, cocos2d::CCArray* objs) = mac 0x9e5b0;
    void resetUnusedColorChannels() = mac 0x9a870;
    void rotationForSlopeNearObject(GameObject*) = mac 0x95cd0, win 0xef850;
    void runColorEffect(EffectGameObject*, int, float, float, bool) = mac 0x9bd30;
    void setupLevelStart(LevelSettingsObject*) = mac 0xa0ca0, win 0xfb2b0;
    void sortStickyGroups() = mac 0x92b10;
    void stopTriggersInGroup(int, float) = mac 0x9c030;
    void toggleDualMode(GameObject*, bool, PlayerObject*, bool) = mac 0xa0200;
    void toggleGroupPreview(int, bool) = mac 0x9bea0;
    void transferDefaultColors(GJEffectManager*, GJEffectManager*) = mac 0x9ab50;
    void undoLastAction() = mac 0x97770;
    void updateBGAndGColors() = mac 0x9b9b0;
    void updateBlendValues() = mac 0x9bc60;
    void updateDualGround(PlayerObject*, int, bool) = mac 0xa1a60;
    void updateEditorMode() = mac 0x93b50, win 0xf34b0;
    void updateGameObjectsNew() = mac 0x9adc0;
    void updateGround(float) = mac 0x93a60;
    void updateGroundWidth() {
        m_groundLayer->updateGroundWidth();
        if (m_previewMode) {
            this->updateLevelColors();
        }
    }
    void updateLevelFont(int) = mac 0x9df00, win 0xf8200;
    void updateLevelColors() {
        // literally empty
    }
    void updateOptions() = mac 0x91ed0;
    void updateToggledGroups() = mac 0x9bb10;
    callback void updateVisibility(float delta) = mac 0x92c70, win 0xf18b0;

    void groupStickyObjects(cocos2d::CCArray* objects) = mac 0x99dd0;
    void ungroupStickyObjects(cocos2d::CCArray* objects) = mac 0x99ee0;

    void copyObjectState(GameObject* target) = win 0xfc980;
    // sic
    void pasteAtributeState(GameObject* target, cocos2d::CCArray* targets) = mac 0xa29e0, win 0xfcad0;
    void pasteColorState(GameObject* target, cocos2d::CCArray* targets) = mac 0xa2950, win 0xfca50;

    void setStartPosObject(StartPosObject* obj);  // GD 2.011 port: inline body needs m_currentStartPos (no 2.0 offset)

    void updateColor(cocos2d::_ccColor3B, float, int, bool, float, cocos2d::_ccHSVValue, int, bool, int, EffectGameObject*) = mac 0x9c200;
    void addToGroup(GameObject*, int, bool) = mac 0x9dab0;
    void removeFromGroup(GameObject*, int) = mac 0x9db60;
    void xPosForTime(float) = mac 0x9c800;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_152() = win 0x34680;  // 2.0 slot (getDontApplyLayerFilter, types unknown)
    virtual void setDontApplyLayerFilter(bool) = win 0x34690;
    virtual void gd20_slot_154() = win 0x1ef50;  // 2.0 slot (getCoinCount, types unknown)
    virtual void gd20_slot_155() = win 0xfc00;  // 2.0 slot (getGroupIDFilter, types unknown)
    virtual void setGroupIDFilter(int) = win 0x7d000;
    virtual void gd20_slot_157() = win 0x39be0;  // 2.0 slot, name unknown
    virtual void gd20_slot_158() = win 0x7d130;  // 2.0 slot (getObjectCount, types unknown)
    virtual void setObjectCount(int) = win 0x7d140;
    virtual void gd20_slot_160() = win 0x7d150;  // 2.0 slot, name unknown
    virtual void gd20_slot_161() = win 0x7d170;  // 2.0 slot, name unknown
    virtual void gd20_slot_162() = win 0x7d190;  // 2.0 slot, name unknown
    virtual void gd20_slot_163() = win 0xecd00;  // 2.0 slot, name unknown
    virtual void gd20_slot_164() = win 0x9a8b0;  // 2.0 slot, name unknown
    virtual void gd20_slot_165() = win 0xecd10;  // 2.0 slot, name unknown
    virtual void gd20_slot_166() = win 0xecd20;  // 2.0 slot, name unknown
    virtual void gd20_slot_167() = win 0xecd30;  // 2.0 slot, name unknown
    virtual void gd20_slot_168() = win 0x7d2b0;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x17c ----
    PAD = win 0x28;
    GameObject* m_copyStateObject;  // 2.011 +0x1a4 (voted)
    PAD = win 0x10;
    geode::SeedValueRSV m_coinCount;  // 2.011 +0x1b8 (accessor)
    PAD = win 0x38;
    bool m_isDualMode;  // 2.011 +0x1fc (voted)
    bool m_unkRectBool;  // 2.011 +0x1fd (voted)
    PAD = win 0x2;
    GameObject* m_currentPortal;  // 2.011 +0x200 (voted)
    GameObject* m_portal;  // 2.011 +0x204 (voted)
    EditorUI* m_editorUI;  // 2.011 +0x208 (manual)
    PAD = win 0x1c;
    DrawGridLayer* m_drawGridLayer;  // 2.011 +0x228 (manual)
    GJGameLevel* m_level;  // 2.011 +0x22c (manual)
    PAD = win 0x4;
    PlaybackMode m_playbackMode;  // 2.011 +0x234 (voted)
    PAD = win 0x15;
    bool m_previewMode;  // 2.011 +0x24d (voted)
    PAD = win 0x2;
    GJGroundLayer* m_groundLayer;  // 2.011 +0x250 (voted)
    PAD = win 0x74;
}

class LevelInfoLayer : cocos2d::CCLayer, LevelDownloadDelegate, LevelUpdateDelegate, RateLevelDelegate, LikeItemDelegate, FLAlertLayerProtocol, LevelDeleteDelegate, NumberInputDelegate {
    static LevelInfoLayer* create(GJGameLevel* level) = mac 0x15f290, win 0x1076a0;
    bool init(GJGameLevel* level) = mac 0x15f520, win 0x107740;
    void onGarage(cocos2d::CCObject* sender) = mac 0x163ac0;
    void onViewProfile(cocos2d::CCObject* sender) = mac 0x1617d0, win 0x10b030;
    void onLevelInfo(cocos2d::CCObject* sender) = mac 0x163880, win 0x10b080;
    void setupProgressBars() = mac 0x1627e0, win 0x108af0;
    void setupLevelInfo() = mac 0x161C80, win 0x109080;
    void downloadLevel() = mac 0x161b90, win 0x108970;
    void onPlay(cocos2d::CCObject* sender) = mac 0x161840, win 0x109d60;
    void onBack(cocos2d::CCObject* sender) = mac 0x163810;
    void onDelete(cocos2d::CCObject* sender) = mac 0x162f30, win 0x10a610;

    virtual void levelDownloadFinished(GJGameLevel*) = mac 0x164C00, win 0x109610;
    virtual void levelUpdateFinished(GJGameLevel*, UpdateResponse) = mac 0x164E60, win 0x1097c0;
    virtual void keyBackClicked() = win 0xea120; 

    void showUpdateAlert(UpdateResponse) = mac 0x164ED0, win 0x109810;
    void updateLabelValues() = mac 0x164090, win 0x10b2a0;

    void onRate(cocos2d::CCObject* sender) = win 0x10a9d0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x134 ----
    PAD = win 0x4;
    cocos2d::CCMenu* m_playBtnMenu;  // 2.011 +0x138 (interpolated)
    GJGameLevel* m_level;  // 2.011 +0x13c (voted)
    PAD = win 0x48;
}

// GD 2.011 port: 2.1-only class, stub
class LevelLeaderboard {
}

class LevelManagerDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void loadLevelsFinished(cocos2d::CCArray *,char const*) {}
    virtual void loadLevelsFailed(char const*) {}
    virtual void setupPageInfo(gd::string,char const*) {}
}

class LevelPage : cocos2d::CCLayer {

    void onInfo(cocos2d::CCObject* sender) = mac 0x23AAE0, win 0x115ef0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x118 ----
    PAD = win 0x4;
    GJGameLevel* m_level;  // 2.011 +0x11c (voted)
}

class LevelSearchLayer : cocos2d::CCLayer, TextInputDelegate, FLAlertLayerProtocol {
    static LevelSearchLayer* create() = win 0x10c000;
    virtual bool init() = mac 0x384770, win 0x10c0a0;
    GJSearchObject* getSearchObject(SearchType, gd::string) = mac 0x388a50, win 0x10e8c0;
    void onMoreOptions(cocos2d::CCObject*) = win 0x10da20;
    void onSearch(cocos2d::CCObject*) = win 0x10f1a0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x120 ----
    CCTextInputNode* m_searchInput;  // 2.011 +0x120 (voted)
    PAD = win 0x10;
}

class LevelSelectLayer : cocos2d::CCLayer, BoomScrollLayerDelegate, DynamicScrollDelegate {
    static LevelSelectLayer* create(int lvl) = win 0x112bd0;
    bool init(int lvl) = mac 0x2384e0, win 0x112c70;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x120 ----
    PAD = win 0x1c;
}

class LevelSettingsDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void levelSettingsUpdated() {}
}

// GD 2.011 port: 2.1-only class, stub
class SecretLayer2 {
}

// GD 2.011 port: 2.1-only class, stub
class SecretLayer4 {
}

class SelectArtDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void selectArtClosed(SelectArtLayer*) {}
}

class CustomSongLayerDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void customSongLayerClosed() {}
}

class LevelSettingsLayer : FLAlertLayer, ColorSelectDelegate, SelectArtDelegate, FLAlertLayerProtocol, CustomSongLayerDelegate {
    static LevelSettingsLayer* create(LevelSettingsObject* levelSettings, LevelEditorLayer* editor) = win 0x1021b0;
    bool init(LevelSettingsObject* levelSettings, LevelEditorLayer* editor) = mac 0xa7e00, win 0x102270;
    void onClose(cocos2d::CCObject* sender) = mac 0xab8e0, win 0x104f40;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_144() = win 0x10e50;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(LevelSettingsDelegate*) = win 0x10e60;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1d8 ----
    int m_songIndex;  // 2.011 +0x1d8 (interpolated)
    Speed m_speed;  // 2.011 +0x1dc (interpolated)
    ColorChannelSprite* m_backgroundChannelSprite;  // 2.011 +0x1e0 (interpolated)
    ColorChannelSprite* m_ground1ChannelSprite;  // 2.011 +0x1e4 (interpolated)
    ColorChannelSprite* m_ground2ChannelSprite;  // 2.011 +0x1e8 (interpolated)
    ColorChannelSprite* m_lineChannelSprite;  // 2.011 +0x1ec (interpolated)
    ColorChannelSprite* m_objectChannelSprite;  // 2.011 +0x1f0 (interpolated)
    ColorChannelSprite* m_3DChannelSprite;  // 2.011 +0x1f4 (interpolated)
    cocos2d::CCSprite* m_colourBtnSprite;  // 2.011 +0x1f8 (interpolated)
    cocos2d::CCSprite* m_backgroundSprite;  // 2.011 +0x1fc (interpolated)
    cocos2d::CCSprite* m_groundSprite;  // 2.011 +0x200 (interpolated)
    LevelSettingsObject* m_settingsObject;  // 2.011 +0x204 (voted)
    cocos2d::CCLabelBMFont* m_mainSongLabel;  // 2.011 +0x208 (interpolated)
    cocos2d::CCArray* m_gameModeArray;  // 2.011 +0x20c (interpolated)
    cocos2d::CCArray* m_speedArray;  // 2.011 +0x210 (interpolated)
    LevelSettingsDelegate* m_levelSettingsDelegate;  // 2.011 +0x214 (interpolated)
    LevelEditorLayer* m_editorLayer;  // 2.011 +0x218 (voted)
    PAD = win 0x1c;
}

class LevelSettingsObject : cocos2d::CCNode {
    virtual ~LevelSettingsObject() = mac 0xa5650;
    virtual bool init() = mac 0xa5690, win 0xffd80;
    static LevelSettingsObject* create() = mac 0x92760, win 0xffce0;
    static LevelSettingsObject* objectFromDict(cocos2d::CCDictionary*) = mac 0xa5810, win 0x100980;
    static LevelSettingsObject* objectFromString(gd::string) = mac 0x945a0, win 0x1008f0;
    void setupColorsFromLegacyMode(cocos2d::CCDictionary*) = mac 0xa6a30, win 0x101510;

    static LevelSettingsObject* get() {
        auto baseLayer = GJBaseGameLayer::get();
        if (baseLayer) return baseLayer->m_levelSettings;
        return nullptr;
    }

    gd::string getSaveString() = mac 0x979c0, win 0x1000a0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x202a0;  // 2.0 slot (getColorManager, types unknown)
    virtual void setColorManager(GJEffectManager*) = win 0x7c280;
    virtual void gd20_slot_109() = win 0x25510;  // 2.0 slot (getStartMode, types unknown)
    virtual void setStartMode(int) = win 0x25520;
    virtual void gd20_slot_111() = win 0x25610;  // 2.0 slot (getStartSpeed, types unknown)
    virtual void setStartSpeed(int) = win 0x25620;
    virtual void gd20_slot_113() = win 0xed040;  // 2.0 slot (getStartMiniMode, types unknown)
    virtual void setStartMiniMode(bool) = win 0xed050;
    virtual void gd20_slot_115() = win 0xed060;  // 2.0 slot (getStartDualMode, types unknown)
    virtual void setStartDualMode(bool) = win 0xed070;
    virtual void gd20_slot_117() = win 0xed080;  // 2.0 slot (getTwoPlayerMode, types unknown)
    virtual void setTwoPlayerMode(bool) = win 0xed090;
    virtual void gd20_slot_119() = win 0x247c0;  // 2.0 slot (getSongOffset, types unknown)
    virtual void setSongOffset(float) = win 0x247d0;
    virtual void gd20_slot_121() = win 0x14ef0;  // 2.0 slot (getFadeIn, types unknown)
    virtual void setFadeIn(bool) = win 0x14f00;
    virtual void gd20_slot_123() = win 0xed0a0;  // 2.0 slot (getFadeOut, types unknown)
    virtual void setFadeOut(bool) = win 0xed0b0;
    virtual void gd20_slot_125() = win 0x14f10;  // 2.0 slot (getBGIdx, types unknown)
    virtual void setBGIdx(int) = win 0x14f20;
    virtual void gd20_slot_127() = win 0x135b0;  // 2.0 slot (getGIdx, types unknown)
    virtual void setGIdx(int) = win 0x135c0;
    virtual void gd20_slot_129() = win 0x135d0;  // 2.0 slot (getFontIdx, types unknown)
    virtual void setFontIdx(int) = win 0x135e0;
    virtual void gd20_slot_131() = win 0xa3a20;  // 2.0 slot (getIsLimited, types unknown)
    virtual void setIsLimited(bool) = win 0xa3a30;
    virtual void gd20_slot_133() = win 0xed0c0;  // 2.0 slot (getGravityFlipped, types unknown)
    virtual void setGravityFlipped(bool) = win 0xed0d0;
    virtual void gd20_slot_135() = win 0x9a360;  // 2.0 slot (getLevel, types unknown)
    virtual void setLevel(GJGameLevel*) = win 0xed0e0;
    virtual void gd20_slot_137() = win 0x7d800;  // 2.0 slot (getSongString, types unknown)
    virtual void setSongString(gd::string) = win 0x7d840;
    virtual void gd20_slot_139() = win 0x7e590;  // 2.0 slot (getSongChanged, types unknown)
    virtual void setSongChanged(bool) = win 0x7e5a0;
    virtual void gd20_slot_141() = win 0x7dcb0;  // 2.0 slot (getLastColorPage, types unknown)
    virtual void setLastColorPage(int) = win 0x7dcc0;
    virtual void gd20_slot_143() = win 0x7d930;  // 2.0 slot (getGLineIdx, types unknown)
    virtual void setGLineIdx(int) = win 0x7dcd0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    GJEffectManager* m_effectManager;  // 2.011 +0xe8 (manual)
    int m_startMode;  // 2.011 +0xec (same own size)
    Speed m_startSpeed;  // 2.011 +0xf0 (same own size)
    bool m_startMini;  // 2.011 +0xf4 (same own size)
    bool m_startDual;  // 2.011 +0xf5 (same own size)
    bool m_twoPlayerMode;  // 2.011 +0xf6 (same own size)
    PAD = win 0x1;
    float m_songOffset;  // 2.011 +0xf8 (same own size)
    bool m_fadeIn;  // 2.011 +0xfc (same own size)
    bool m_fadeOut;  // 2.011 +0xfd (same own size)
    PAD = win 0x2;
    int m_backgroundIndex;  // 2.011 +0x100 (same own size)
    int m_groundIndex;  // 2.011 +0x104 (same own size)
    int m_fontIndex;  // 2.011 +0x108 (same own size)
    bool m_startsWithStartPos;  // 2.011 +0x10c (same own size)
    bool m_isFlipped;  // 2.011 +0x10d (same own size)
    PAD = win 0x2;
    GJGameLevel* m_level;  // 2.011 +0x110 (same own size)
    gd::string m_guidelineString;  // 2.011 +0x114 (same own size)
    int m_unknown;  // 2.011 +0x12c (same own size)
    int m_colorPage;  // 2.011 +0x130 (same own size)
    int m_groundLineIndex;  // 2.011 +0x134 (same own size)
}

class LevelUploadDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_0() = win 0x2ce50;  // 2.0 slot (levelUploadFinished, types unknown)
    virtual void gd20_slot_1() = win 0x2ce50;  // 2.0 slot (levelUploadFailed, types unknown)
}

class LevelUpdateDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void levelUpdateFinished(GJGameLevel*, UpdateResponse) {}
    virtual void levelUpdateFailed(int) {}
}

class LikeItemDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void likedItem(LikeItemType, int, bool) {}
}

class LikeItemLayer : FLAlertLayer {

    static LikeItemLayer* create(LikeItemType type, int itemID, int commentSourceID) = mac 0x35f760, win 0x1180c0;
    bool init(LikeItemType type, int itemID, int commentSourceID) = mac 0x35f900, win 0x118170;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_144() = win 0xfbf0;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(LikeItemDelegate*) = win 0x7cff0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1c8 ----
    LikeItemType m_itemType;  // 2.011 +0x1c8 (same own size)
    int m_itemID;  // 2.011 +0x1cc (same own size)
    int m_commentSourceID;  // 2.011 +0x1d0 (same own size)
    LikeItemDelegate* m_likeDelegate;  // 2.011 +0x1d4 (same own size)
}

class ListButtonBar : cocos2d::CCNode {
    void switchedPage(int page);

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x25610;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(ListButtonBarDelegate*) = win 0x25620;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    PAD = win 0xc;
}

class ListButtonBarDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_0() = win 0xd060;  // 2.0 slot (listButtonBarSwitchedPage, types unknown)
}

class LoadingCircle : cocos2d::CCLayerColor {
    void setParentLayer(cocos2d::CCLayer* layer) {
        m_parentLayer = layer;
    }
    void setFade(bool fade) {
        m_fade = fade;
    }

    static LoadingCircle* create() = mac 0x277d50, win 0x260f0;
    void show() = mac 0x277fd0, win 0x262b0;
    void fadeAndRemove() = mac 0x2780d0, win 0x26380;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_128() = win 0x26080;  // 2.0 slot, name unknown
    virtual void gd20_slot_129() = win 0x26090;  // 2.0 slot (getTargetScene, types unknown)
    virtual void setTargetScene(cocos2d::CCNode*) = win 0xdf70;
    virtual void gd20_slot_131() = win 0x260a0;  // 2.0 slot (getDarkOverlay, types unknown)
    virtual void setDarkOverlay(bool) = win 0x260b0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x194 ----
    cocos2d::CCSprite* m_sprite;  // 2.011 +0x194 (same own size)
    cocos2d::CCLayer* m_parentLayer;  // 2.011 +0x198 (same own size)
    bool m_fade;  // 2.011 +0x19c (same own size)
    PAD = win 0x3;
}

class LoadingLayer : cocos2d::CCLayer {
    void setFromRefresh(bool value) {
        m_fromRefresh = value;
    }

    LoadingLayer() {}
    static LoadingLayer* create(bool fromReload) = mac 0x1df1f0, ios 0x130278, win 0x118750;
    bool init(bool fromReload) = mac 0x1df2f0, win 0x1187f0;
    const char* getLoadingString() = win 0x119690;
    void loadAssets() = mac 0x1dfb20, ios 0x130278, win 0x1190c0;
    void loadingFinished() = win 0x118f60;

    static cocos2d::CCScene* scene(bool fromReload) {
        auto scene = cocos2d::CCScene::create();
        scene->addChild(LoadingLayer::create(fromReload));

        return scene;
    }

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x118 ----
    bool m_unknown;  // 2.011 +0x118 (same own size)
    bool m_unknown2;  // 2.011 +0x119 (same own size)
    PAD = win 0x2;
    int m_loadStep;  // 2.011 +0x11c (same own size)
    cocos2d::CCLabelBMFont* m_caption;  // 2.011 +0x120 (same own size)
    TextArea* m_textArea;  // 2.011 +0x124 (same own size)
    cocos2d::CCSprite* m_sliderBar;  // 2.011 +0x128 (same own size)
    float m_sliderGrooveXPos;  // 2.011 +0x12c (same own size)
    float m_sliderGrooveHeight;  // 2.011 +0x130 (same own size)
    bool m_fromRefresh;  // 2.011 +0x134 (same own size)
    PAD = win 0x3;
}

class LocalLevelManager : GManager {
    static LocalLevelManager* sharedState() = mac 0x35dd60, win 0x1199f0;
    inline static LocalLevelManager* get() {
        return LocalLevelManager::sharedState();
    }
    bool init() = mac 0x2384e0, win 0x119b30;
    virtual void encodeDataTo(DS_Dictionary* data) = mac 0x35ed60, win 0x11a730;
    virtual void dataLoaded(DS_Dictionary* data) = mac 0x35eda0, win 0x11a760;

    cocos2d::CCDictionary* getAllLevelsInDict() = mac 0x35e3d0, win 0x119f50;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_113() = win 0x15e00;  // 2.0 slot, name unknown
    virtual void gd20_slot_114() = win 0x9a320;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x104 ----
    cocos2d::CCDictionary* m_loadData;  // 2.011 +0x104 (same own size)
    cocos2d::CCDictionary* m_levelData;  // 2.011 +0x108 (same own size)
    cocos2d::CCArray* m_localLevels;  // 2.011 +0x10c (same own size)
}

class MapPackCell : TableViewCell {
    void updateBGColor(int index) = win 0x49ba0;
    void loadFromMapPack(GJMapPack *) = win 0x49ed0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class MenuGameLayer : cocos2d::CCLayer {
    void resetPlayer() = mac 0x28fdc0, win 0x11bc40;
    void destroyPlayer() = win 0x11c860;
    virtual void update(float) = mac 0x28fa70, win 0x11b910;
    virtual bool init() = win 0x11aea0;
    void updateColors() = win 0x11b530;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class MenuLayer : cocos2d::CCLayer, FLAlertLayerProtocol, GooglePlayDelegate {
    inline MenuLayer() {}
    virtual ~MenuLayer() = mac 0x1d1230;
    virtual bool init() = mac 0x1d14b0, win 0x11cf60;
    virtual void keyBackClicked() = mac 0x1d3160, win 0x11e800;
    virtual void keyDown(cocos2d::enumKeyCodes) = mac 0x1d33d0, win 0x11eb40;
    virtual void googlePlaySignedIn() = mac 0x1d2f30, win 0x11e390;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = mac 0x1d3190, win 0x11e9d0;
    void onMoreGames(cocos2d::CCObject*) = mac 0x1d2ad0, ios 0x19fbb4, win 0x11e230;
    void onGarage(cocos2d::CCObject*) = win 0x11e620;
    void onQuit(cocos2d::CCObject*) = mac 0x1d2b40, win 0x11e810;
    void onMyProfile(cocos2d::CCObject*) = mac 0x1d2c20, win 0x11df70;
    void onPlay(cocos2d::CCObject*) = win 0x11e3c0;
    void onCreator(cocos2d::CCObject*) = win 0x11e540;
    void onRobTop(cocos2d::CCObject*) = win 0x11e030;
    void onNewgrounds(cocos2d::CCObject*) = win 0x11e700;
    void onDaily(cocos2d::CCObject*);
    void onOptions(cocos2d::CCObject*) = win 0x11e4a0;
    void onAchievements(cocos2d::CCObject*) = win 0x11e360;
    void onStats(cocos2d::CCObject*) = win 0x11e510;
    void onFacebook(cocos2d::CCObject*) = win 0x11e050;
    void onTwitter(cocos2d::CCObject*) = win 0x11e0f0;
    void onYouTube(cocos2d::CCObject*) = win 0x11e190;
    static cocos2d::CCScene* scene(bool) = mac 0x1d12d0, ios 0x19e57c, win 0x11cee0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x120 ----

}

class MessageListDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_0() = win 0xd060;  // 2.0 slot (loadMessagesFinished, types unknown)
    virtual void gd20_slot_1() = win 0xd060;  // 2.0 slot (loadMessagesFailed, types unknown)
    virtual void gd20_slot_2() = win 0x2ce50;  // 2.0 slot (forceReloadMessages, types unknown)
    virtual void setupPageInfo(gd::string, char const*) = win 0x78e20;
}

class MoreSearchLayer : FLAlertLayer, TextInputDelegate {
    static MoreSearchLayer* create() = mac 0x388180, win 0x110640;
    virtual bool init() = mac 0x3896b0, win 0x1106e0;
    void onClose(cocos2d::CCObject*) = mac 0x38aa40, win 0x112780;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class MoreOptionsLayer : FLAlertLayer, TextInputDelegate, GooglePlayDelegate {
    static MoreOptionsLayer* create() = win 0x156d20;
    virtual bool init() = mac 0x43f470, win 0x156dc0;
    void addToggle(const char* name, const char* key, const char* info) = mac 0x440430, win 0x157850;
    void onKeybindings(cocos2d::CCObject* sender) = mac 0x4410e0;
    void onToggle(cocos2d::CCObject* sender) = mac 0x441370, win 0x158750;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class MoreVideoOptionsLayer : FLAlertLayer {
    static MoreVideoOptionsLayer* create() = mac 0x443c10, win 0x15a710;
    virtual bool init() = mac 0x444150, win 0x15a7b0;
    void onClose(cocos2d::CCObject*) = mac 0x444aa0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class MultilineBitmapFont : cocos2d::CCSprite {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_133() = win 0x26520;  // 2.0 slot, name unknown
    virtual void gd20_slot_134() = win 0x26530;  // 2.0 slot, name unknown
    virtual void gd20_slot_135() = win 0x26540;  // 2.0 slot, name unknown
    virtual void gd20_slot_136() = win 0x26560;  // 2.0 slot, name unknown
    virtual void gd20_slot_137() = win 0x26570;  // 2.0 slot (getIgnoreColorCode, types unknown)
    virtual void setIgnoreColorCode(bool) = win 0x26580;
}

class MusicDownloadDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void loadSongInfoFinished(SongInfoObject*) {}
    virtual void loadSongInfoFailed(int, GJSongError) {}
    virtual void downloadSongFinished(SongInfoObject*) {}
    virtual void downloadSongFailed(int, GJSongError) {}
    virtual void songStateChanged() {}
}

class MusicDownloadManager : cocos2d::CCNode, PlatformDownloadDelegate {
    void incrementPriorityForSong(int) = mac 0x2ef750;
    static MusicDownloadManager* sharedState() = mac 0x2ee4c0, win 0x121090;
    gd::string pathForSong(int id) = mac 0x2f1140, win 0x122c30;
    cocos2d::CCArray* getDownloadedSongs() = win 0x122140;
    void songStateChanged() = win 0x121890;
    void onGetSongInfoCompleted(gd::string, gd::string) = mac 0x2eec60, win 0x121a80;
    SongInfoObject* getSongInfoObject(int) = win 0x122a40;
    void getSongInfo(int, bool) = win 0x1218e0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x6680;  // 2.0 slot (getDownloadedSongsDict, types unknown)
    virtual void setDownloadedSongsDict(cocos2d::CCDictionary*) = win 0x6690;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xec ----
    cocos2d::CCDictionary* m_unknownDict;  // 2.011 +0xec (voted)
    cocos2d::CCArray* m_handlers;  // 2.011 +0xf0 (interpolated)
    cocos2d::CCDictionary* m_songsDict;  // 2.011 +0xf4 (voted)
    int m_priority;  // 2.011 +0xf8 (voted)
}

class NumberInputDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void numberInputClosed(NumberInputLayer*) {}
}

class NumberInputLayer : FLAlertLayer {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_144() = win 0xfbe0;  // 2.0 slot (getMinNumbers, types unknown)
    virtual void gd20_slot_145() = win 0x7cfe0;  // 2.0 slot, name unknown
    virtual void gd20_slot_146() = win 0xfbf0;  // 2.0 slot (getMaxNumbers, types unknown)
    virtual void gd20_slot_147() = win 0x7cff0;  // 2.0 slot, name unknown
    virtual void gd20_slot_148() = win 0x124c60;  // 2.0 slot, name unknown
    virtual void gd20_slot_149() = win 0x10d50;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(NumberInputDelegate*) = win 0x10d60;
}

class OBB2D : cocos2d::CCNode {
    void calculateWithCenter(cocos2d::CCPoint, float, float, float) = mac 0x35a9c0, win 0x27940;
    static OBB2D* create(cocos2d::CCPoint, float, float, float) = mac 0x35a890, win 0x277b0;
    cocos2d::CCRect getBoundingRect() = mac 0x35b2b0, win 0x27e70;
    void overlaps(OBB2D*) = mac 0x35b0a0;
    void overlaps1Way(OBB2D*) = mac 0x35b0d0, win 0x27d50;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    cocos2d::CCPoint m_p1_1;  // 2.011 +0xe8 (voted)
    cocos2d::CCPoint m_p1_2;  // 2.011 +0xf0 (interpolated)
    cocos2d::CCPoint m_p1_3;  // 2.011 +0xf8 (interpolated)
    cocos2d::CCPoint m_p1_4;  // 2.011 +0x100 (interpolated)
    cocos2d::CCPoint m_p2_1;  // 2.011 +0x108 (interpolated)
    cocos2d::CCPoint m_p2_2;  // 2.011 +0x110 (interpolated)
    cocos2d::CCPoint m_p2_3;  // 2.011 +0x118 (interpolated)
    cocos2d::CCPoint m_p2_4;  // 2.011 +0x120 (interpolated)
    cocos2d::CCPoint m_p3_1;  // 2.011 +0x128 (voted)
    PAD = win 0x28;
    cocos2d::CCPoint m_center;  // 2.011 +0x158 (voted)
}

class ObjectManager : cocos2d::CCNode {
    static ObjectManager* instance() = win 0x27ff0;
    void setup() = win 0x280e0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

// GD 2.011 port: 2.1-only class, stub
class KeysLayer {
}

class ObjectToolbox : cocos2d::CCNode {
    cocos2d::CCArray* allKeys() {
        return m_frameToKeyDict->allKeys();
    }
    const char* frameToKey(const char* frame) {
        return static_cast<cocos2d::CCString*>(m_frameToKeyDict->objectForKey(frame))->getCString();
    }
    const char* intKeyToFrame(int key) {
        return static_cast<cocos2d::CCString*>(m_keyToFrameDict->objectForKey(key))->getCString();
    }
    const char* keyToFrame(const char* key) {
        return intKeyToFrame(atoi(key));
    }
    void addObject(int id, const char* frame) {
        m_frameToKeyDict->setObject(cocos2d::CCString::createWithFormat("%i", id), frame);
        m_keyToFrameDict->setObject(cocos2d::CCString::create(frame), id);
    }

    virtual bool init() = mac 0x3b2d80, win 0x1256f0;
    static ObjectToolbox* sharedState() = mac 0x3b2bc0, win 0x125650;
    float gridNodeSizeForKey(int key);
    static const char* perspectiveBlockFrame(int key) = win 0x155450;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    cocos2d::CCDictionary* m_frameToKeyDict;  // 2.011 +0xe8 (manual)
    cocos2d::CCDictionary* m_keyToFrameDict;  // 2.011 +0xec (manual)
}

class OpacityEffectAction : cocos2d::CCNode {
    static OpacityEffectAction* create(float, float, float, int) = mac 0x1789f0, win 0xc4dc0;
    static OpacityEffectAction* createFromString(gd::string) = mac 0x178c10, win 0xc4ec0;
    bool init(float, float, float, int) = mac 0x178b00;
    void step(float) = mac 0x178b90;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x247c0;  // 2.0 slot (getDeltaTime, types unknown)
    virtual void setDeltaTime(float) = win 0x247d0;
    virtual void gd20_slot_109() = win 0x211c0;  // 2.0 slot (getTargetID, types unknown)
    virtual void setTargetID(int) = win 0xc2c80;
    virtual void gd20_slot_111() = win 0x140e0;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    PAD = win 0x1c;
}

// GD 2.011 port: 2.1-only class, stub
class OnlineListDelegate {
}

class OptionsLayer : GJDropDownLayer, FLAlertLayerProtocol {
    static OptionsLayer* addToCurrentScene(bool noTransition) {
        auto layer = OptionsLayer::create();
        cocos2d::CCDirector::sharedDirector()->getRunningScene()->addChild(layer);
        layer->showLayer(noTransition);
        return layer;
    }

    static OptionsLayer* create() = mac 0x43db60, ios 0x86314, win 0x155980;

    virtual void customSetup() = mac 0x43dc70, win 0x155aa0;
    virtual void layerHidden() = mac 0x43f200, win 0x156ba0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1c0 ----
    cocos2d::CCMenu* m_optionsMenu;  // 2.011 +0x1c0 (voted)
    PAD = win 0x14;
}

class PauseLayer : CCBlockLayer {
    static PauseLayer* create(bool) = mac 0x20b1e0, win 0x15b660;
    void onEdit(cocos2d::CCObject*) = mac 0x20c630, win 0x15d2e0;
    void goEdit() = mac 0x20cc10, win 0x15d500;

    void onQuit(cocos2d::CCObject*) = mac 0x20c790, win 0x15d5f0;
    void createToggleButton(gd::string caption, cocos2d::SEL_MenuHandler callback, bool on, cocos2d::CCMenu* menu, cocos2d::CCPoint pos) = mac 0x20c890, win 0x15c670;
    virtual void customSetup() = mac 0x20b300, win 0x15b710;

    void onRestart(cocos2d::CCObject* sender) = mac 0x20c860, win 0x15d210;
    void onPracticeMode(cocos2d::CCObject* sender) = mac 0x20c6d0, win 0x15d070;
    void onNormalMode(cocos2d::CCObject* sender) = mac 0x20c720, win 0x15d0b0;
    void onResume(cocos2d::CCObject* sender) = mac 0x20c760, win 0x15d170;
    virtual void keyDown(cocos2d::enumKeyCodes) = mac 0x20cc80, win 0x15d850;

    void musicSliderChanged(cocos2d::CCObject* sender) = mac 0x20cb00;
    void sfxSliderChanged(cocos2d::CCObject* sender) = mac 0x20cb40, win 0x1565e0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x198 ----
    bool m_unknown;  // 2.011 +0x198 (same own size)
    bool m_unknown2;  // 2.011 +0x199 (same own size)
    PAD = win 0x2;
}

class PlatformDownloadDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void downloadFinished(char const*) {}
    virtual void downloadFailed(char const*) {}
}

class PlatformToolbox {
    static void hideCursor() = mac 0x27c340;
    static void showCursor() = mac 0x27c360;
    static bool isControllerConnected() {
        #ifdef GEODE_IS_WINDOWS
            return cocos2d::CCApplication::sharedApplication()->getControllerConnected();
        #elif defined(GEODE_IS_MACOS)
            // this is just gd.h
            return reinterpret_cast<bool(*)()>(geode::base::get() + 0x27d1b0)();
        #else
            return false;
        #endif
    }
    static void toggleFullScreen(bool fullscreen) = mac 0x27cf90;
    static void resizeWindow() = mac 0x27cfe0;
}

class PlayLayer : GJBaseGameLayer, CCCircleWaveDelegate, SpawnTriggerDelegate {
    static PlayLayer* get() {
        return GameManager::sharedState()->getPlayLayer();
    }

    PlayLayer() = mac 0x80e20, win 0x169b40;

    void addCircle(CCCircleWave*) = mac 0x7e0f0;
    void addObject(GameObject*) = mac 0x70e50, win 0x16fc00;
    void addToGroupOld(GameObject*) = mac 0x77680;
    void addToSpeedObjects(GameObject*) = mac 0x7cfc0, win 0x179be0;
    void animateInDualGround(GameObject*, float, bool) = mac 0x7d710, win 0x17a080;
    void animateInGround(bool) = mac 0x7d9d0, win 0x17afc0;
    void animateOutGround(bool) = mac 0x6f350, win 0x17b2f0;
    void animateOutGroundFinished() = mac 0x7de80, win 0x17b540;
    void applyEnterEffect(GameObject*) = mac 0x7c310, win 0x177880;
    virtual void calculateColorValues(EffectGameObject*, EffectGameObject*, int, float, ColorActionSprite*, GJEffectManager*) = mac 0x7aa10, win 0x1747f0;
    void cameraMoveX(float, float, float) = mac 0x7cbe0;  // GD 2.011 port: 0x578F10 passes a float in a register
    void cameraMoveY(float, float, float) = mac 0x7cc60, win 0x178fa0;
    void checkCollisions(PlayerObject*, float) = mac 0x78c90, win 0x174bf0;
    void circleWaveWillBeRemoved(CCCircleWave*) = mac 0x7e110, win 0x17ba20;
    cocos2d::CCParticleSystemQuad* claimParticle(gd::string) = mac 0x76ba0, win 0x16f180;
    void clearPickedUpItems() = mac 0x7cfa0;
    void colorObject(int, cocos2d::_ccColor3B) = mac 0x77810;
    void commitJumps() = mac 0x737e0;
    static PlayLayer* create(GJGameLevel*) = mac 0x6b590, win 0x16aae0;
    CheckpointObject* createCheckpoint() = mac 0x7e470, win 0x17c0e0;
    void createObjectsFromSetup(gd::string) = mac 0x6d130, win 0x16f700;
    void createParticle(int, char const*, int, cocos2d::tCCPositionType) = mac 0x76800, win 0x16eea0;
    void currencyWillExit(CurrencyRewardLayer*) = mac 0x7e070;
    void delayedResetLevel() = mac 0x7e050, win 0x17c920;
    void destroyPlayer(PlayerObject*, GameObject*) = mac 0x7ab80;
    void dialogClosed(DialogLayer*) = mac 0x7e0b0;
    virtual void draw() = mac 0x7d160, win 0x179d00;
    void enterDualMode(GameObject*, bool) = mac 0x7d6a0;
    void exitAirMode() = mac 0x7dd40;
    void exitBirdMode(PlayerObject*) = mac 0x7dd80;
    void exitDartMode(PlayerObject*) = mac 0x7ddd0;
    void exitFlyMode(PlayerObject*) = mac 0x7dcf0;
    void exitRobotMode(PlayerObject*) = mac 0x7de20;
    void exitRollMode(PlayerObject*) = mac 0x7de60;
    void exitSpiderMode(PlayerObject*) = mac 0x7de40;
    void flipFinished() = mac 0x7e150, win 0x17be60;
    virtual void flipGravity(PlayerObject*, bool, bool) = mac 0x7cd10, win 0x179050;
    void flipObjects() = mac 0x76130, win 0x16e460;
    void fullReset() = mac 0x7f8e0, win 0x17c810;
    void getLastCheckpoint() = mac 0x7f840, win 0x17c750;
    void getMaxPortalY() = mac 0x7b4e0;
    void getMinPortalY() = mac 0x7b550;
    void getObjectsState() = mac 0x7e9d0;
    void getOtherPlayer(PlayerObject*) = mac 0x7dcc0, win 0x17ac50;
    gd::string getParticleKey(int, char const*, int, cocos2d::tCCPositionType) = mac 0x764d0, win 0x16ec60;
    gd::string getParticleKey2(gd::string) = mac 0x767b0, win 0x16ede0;
    void getRelativeMod(cocos2d::CCPoint, float, float, float) = mac 0x7c2a0;
    void getTempMilliTime() = mac 0x778e0;
    void gravityEffectFinished() = mac 0x7cec0, win 0x179410;
    void hasItem(int) = mac 0x7cee0, win 0x179730;
    void hasUniqueCoin(GameObject*) = mac 0x77510, win 0x170740;
    void incrementJumps() = mac 0x7ff40, win 0x17d840;
    bool init(GJGameLevel*) = mac 0x6b5f0, win 0x16ab80;
    void isFlipping() = mac 0x76100;
    void levelComplete() = mac 0x72b80, win 0x16c830;
    void lightningFlash(cocos2d::CCPoint, cocos2d::CCPoint, cocos2d::_ccColor3B, float, float, int, bool, float) = mac 0x75cc0;
    void lightningFlash(cocos2d::CCPoint, cocos2d::_ccColor3B) = mac 0x75bf0, win 0x16e110;
    void loadDefaultColors() = mac 0x6ef30, win 0x177e80;
    void loadFromCheckpoint(CheckpointObject*) = mac 0x7f000;
    void loadLastCheckpoint() = mac 0x7efc0, win 0x17c480;
    void loadSavedObjectsState(gd::string) = mac 0x7f3d0;
    void markCheckpoint() = mac 0x7ef60, win 0x17c430;
    void moveCameraToPos(cocos2d::CCPoint) = mac 0x7c980;
    virtual void onEnterTransitionDidFinish() = mac 0x806e0, win 0x17e2d0;
    virtual void onExit() = mac 0x80710, win 0x17e2f0;
    void onQuit() = mac 0x72710, win 0x17de80;
    void optimizeColorGroups() = mac 0x6dad0;
    void optimizeOpacityGroups() = mac 0x6dc20;
    void optimizeSaveRequiredGroups() = mac 0x6dd70;
    void pauseGame(bool) = mac 0x802d0, win 0x17dbb0;
    void pickupItem(GameObject*) = mac 0x7c1d0, win 0x179660;
    void playAnimationCommand(int, int) = mac 0x75930;
    void playEndAnimationToPos(cocos2d::CCPoint) = mac 0x759a0, win 0x16d9c0;
    void playExitDualEffect(PlayerObject*) = mac 0x7d1d0, win 0x17a2b0;
    void playFlashEffect(float, int, float) = mac 0x75e50;
    void playGravityEffect(bool) = mac 0x7b5a0, win 0x1791b0;
    void playSpeedParticle(float) = mac 0x77030, win 0x16f4e0;
    void playerWillSwitchMode(PlayerObject*, GameObject*) = mac 0x7b820, win 0x17a950;
    void prepareSpawnObjects() = mac 0x7fc00;
    void processItems() = mac 0x735c0, win 0x179810;
    void processLoadedMoveActions() = mac 0x7a7c0, win 0x171f10;
    void recordAction(bool, PlayerObject*) = mac 0x7e190;
    void registerActiveObject(GameObject*) = mac 0x77620;
    void registerStateObject(GameObject*) = mac 0x777b0;
    void removeAllObjects() = mac 0x727b0, win 0x17e0d0;
    void removeFromGroupOld(GameObject*) = mac 0x77750;
    void removeLastCheckpoint() = mac 0x7f870, win 0x17c780;
    void removePlayer2() = mac 0x7d630, win 0x179f40;
    void resetLevel() = mac 0x71c50, win 0x17c930;
    void resume() = mac 0x80480, win 0x17dcb0;
    void resumeAndRestart() = mac 0x80400;
    void saveRecordAction(bool, PlayerObject*) = mac 0x78750, win 0x17bee0;

    static cocos2d::CCScene* scene(GJGameLevel* level) {
        auto scene = cocos2d::CCScene::create();
        scene->addChild(PlayLayer::create(level));
        scene->setObjType(cocos2d::CCObjectType::PlayLayer);

        AppDelegate::get()->m_runningScene = scene;
        return scene;
    }

    void setupLevelStart(LevelSettingsObject*) = mac 0x6f560, win 0x17d380;
    void setupReplay(gd::string) = mac 0x7e1e0;
    void shakeCamera(float, float, float) = mac 0x744a0;
    void shouldBlend(int) = mac 0x771b0, win 0xeeb60;
    void showCompleteEffect() = mac 0x738e0, win 0x16d460;
    void showCompleteText() = mac 0x73be0, win 0x16ce50;
    void showEndLayer() = mac 0x74450, win 0x16e090;
    void showHint() = mac 0x7deb0, win 0x17b8c0;
    void showNewBest(bool, int, int, bool, bool, bool) = mac 0x74580;
    void showRetryLayer() = mac 0x75ba0, win 0x16e0d0;
    void showTwoPlayerGuide() = mac 0x6df00, win 0x16e760;
    void sortGroups() = mac 0x6d9e0, win 0x170ab0;
    void spawnCircle() = mac 0x73820, win 0x16dba0;
    void spawnFirework() = mac 0x74200, win 0x16dce0;
    void spawnParticle(char const*, int, cocos2d::tCCPositionType, cocos2d::CCPoint) = mac 0x76330, win 0x16ead0;
    void spawnPlayer2() = mac 0x7d170, win 0x179ef0;
    void startGame() = mac 0x726b0, win 0x16c7e0;
    void startMusic() = mac 0x72910, win 0x17d0c0;
    void startRecording() = mac 0x7fec0;
    void startRecordingDelayed() = mac 0x7fed0;
    void stopCameraShake() = mac 0x75900, win 0x16d9b0;
    void stopRecording() = mac 0x6d090;
    void storeCheckpoint(CheckpointObject*) = mac 0x7ef10, win 0x17c400;
    void switchToFlyMode(PlayerObject*, GameObject*, bool, int) = mac 0x7baf0, win 0x17ad30;
    void switchToRobotMode(PlayerObject*, GameObject*, bool) = mac 0x7bc80, win 0x17ae60;
    void switchToRollMode(PlayerObject*, GameObject*, bool) = mac 0x7bbe0, win 0x17af10;
    void switchToSpiderMode(PlayerObject*, GameObject*, bool) = mac 0x7bd20;
    callback float timeForXPos(float) = mac 0x7d120, win 0x179c70;
    float timeForXPos2(float, bool) = mac 0x293eb0;
    callback float xPosForTime(float) = mac 0x7d140;
    void toggleBGEffectVisibility(bool) = mac 0x7fe80;
    void toggleDualMode(GameObject*, bool, PlayerObject*, bool) = mac 0x7bf90, win 0x179d10;
    void toggleFlipped(bool, bool) = mac 0x7bdc0, win 0x17bca0;
    void toggleGhostEffect(int) = mac 0x7fe40, win 0x17d660;
    void toggleGlitter(bool) = mac 0x70e00;
    void togglePracticeMode(bool) = mac 0x7f9e0, win 0x17d900;
    void toggleProgressbar() = mac 0x6eeb0, win 0x179570;
    void tryStartRecord() = mac 0x7fe00;
    void unclaimParticle(char const*, cocos2d::CCParticleSystemQuad*) = mac 0x76e00, win 0x16f360;
    void unregisterActiveObject(GameObject*) = mac 0x77660;
    void unregisterStateObject(GameObject*) = mac 0x777f0;
    virtual void update(float) = mac 0x77900, ios 0xb2f08, win 0x170f30;
    void updateAttempts() = mac 0x7fcd0, win 0x17d690;
    void updateCamera(float) = mac 0x6e2b0, win 0x178530;
    void updateDualGround(PlayerObject*, int, bool) = mac 0x7caa0, win 0x17aab0;
    void updateEffectPositions() = mac 0x7a6d0, win 0x17ba40;
    void updateLevelColors() = mac 0x6f1e0, win 0x1749f0;
    void updateMoveObjectsLastPosition() = mac 0x7a720;
    void updateProgressbar() = mac 0x6ed70, win 0x179430;
    void updateReplay(float) = mac 0x78b60, win 0x17bff0;
    void updateTimeMod(float, bool) = mac 0x786f0;
    virtual void updateTweenAction(float, char const*) = mac 0x7ffb0, win 0x17da00;
    void updateVisibility() = mac 0x6fb90, win 0x176470;
    void vfDChk() = mac 0x7fcb0;
    virtual void visit() = mac 0x75ef0, win 0x16e3c0;
    void visitWithColorFlash() = mac 0x761f0, win 0x16e530;
    void willSwitchToMode(int, PlayerObject*) = mac 0x7b9e0;
    ~PlayLayer() = mac 0x6b090, win 0x169b40;
    void updateColor(cocos2d::_ccColor3B, float, int, bool, float, cocos2d::_ccHSVValue, int, bool, int, EffectGameObject*) = mac 0x7c7f0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_152() = win 0x169fe0;  // 2.0 slot (getResetTriggered, types unknown)
    virtual void gd20_slot_153() = win 0x169ff0;  // 2.0 slot (getResetFlipObjects, types unknown)
    virtual void gd20_slot_154() = win 0x16a000;  // 2.0 slot (getColorManager, types unknown)
    virtual void gd20_slot_155() = win 0x77d60;  // 2.0 slot (getPlaybackMode, types unknown)
    virtual void setPlaybackMode(bool) = win 0x77d70;
    virtual void gd20_slot_157() = win 0x77d80;  // 2.0 slot (getForcePlaybackControl, types unknown)
    virtual void setForcePlaybackControl(bool) = win 0x77d90;
    virtual void gd20_slot_159() = win 0x16a010;  // 2.0 slot (getCameraPortal, types unknown)
    virtual void gd20_slot_160() = win 0x16a020;  // 2.0 slot (getDualModeCamera, types unknown)
    virtual void gd20_slot_161() = win 0x16a030;  // 2.0 slot (getIsFlipped, types unknown)
    virtual void gd20_slot_162() = win 0x16a040;  // 2.0 slot (getFlipValue, types unknown)
    virtual void gd20_slot_163() = win 0x16a050;  // 2.0 slot (getDualMode, types unknown)
    virtual void gd20_slot_164() = win 0x16a060;  // 2.0 slot (getUILayer, types unknown)
    virtual void gd20_slot_165() = win 0x77e80;  // 2.0 slot, name unknown
    virtual void gd20_slot_166() = win 0x16a070;  // 2.0 slot (getCameraPos, types unknown)
    virtual void gd20_slot_167() = win 0x77f90;  // 2.0 slot, name unknown
    virtual void gd20_slot_168() = win 0x16a090;  // 2.0 slot (getPracticeMode, types unknown)
    virtual void gd20_slot_169() = win 0x16a0a0;  // 2.0 slot (getIsResetting, types unknown)
    virtual void setIsResetting(bool) = win 0x16a0b0;
    virtual void gd20_slot_171() = win 0x77fb0;  // 2.0 slot (getBigActionContainer, types unknown)
    virtual void gd20_slot_172() = win 0x77fd0;  // 2.0 slot (getCleanReset, types unknown)
    virtual void setCleanReset(bool) = win 0x77fe0;
    virtual cocos2d::CCPoint getStartPos() = win 0x16a0c0;
    virtual void setStartPos(cocos2d::CCPoint) = win 0x16a0e0;
    virtual void gd20_slot_176() = win 0x78040;  // 2.0 slot (getAttempts, types unknown)
    virtual void gd20_slot_177() = win 0x78060;  // 2.0 slot (getJumps, types unknown)
    virtual void gd20_slot_178() = win 0x78080;  // 2.0 slot (getDidJump, types unknown)
    virtual void gd20_slot_179() = win 0x780b0;  // 2.0 slot (getClkTimer, types unknown)
    virtual void gd20_slot_180() = win 0x780e0;  // 2.0 slot (getShowingEndLayer, types unknown)
    virtual void setShowingEndLayer(bool) = win 0x16a100;
    virtual void gd20_slot_182() = win 0x16a110;  // 2.0 slot (getEndTriggered, types unknown)
    virtual void setEndTriggered(bool) = win 0x16a120;
    virtual void gd20_slot_184() = win 0x16a130;  // 2.0 slot (getResetQueued, types unknown)
    virtual void setResetQueued(bool) = win 0x16a140;
    virtual void gd20_slot_186() = win 0x780f0;  // 2.0 slot (getLastRunPercent, types unknown)
    virtual void setLastRunPercent(int) = win 0x16a150;
    virtual void gd20_slot_188() = win 0x16a160;  // 2.0 slot (getDidAwardStars, types unknown)
    virtual void gd20_slot_189() = win 0x16a170;  // 2.0 slot (getShouldRestartAfterStopped, types unknown)
    virtual void setShouldRestartAfterStopped(bool) = win 0x16a180;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x180 ----
    bool m_debugPauseOff;  // 2.011 +0x180 (voted)
    PAD = win 0x3b;
    cocos2d::CCArray* m_checkpoints;  // 2.011 +0x1bc (voted)
    PAD = win 0x4c;
    cocos2d::CCDictionary* m_pickedUpItems;  // 2.011 +0x20c (voted)
    PAD = win 0x10;
    GJGroundLayer* m_bottomGround;  // 2.011 +0x220 (voted)
    GJGroundLayer* m_topGround;  // 2.011 +0x224 (interpolated)
    PAD = win 0x8;
    bool m_isDead;  // 2.011 +0x230 (interpolated)
    bool m_startCameraAtCorner;  // 2.011 +0x231 (interpolated)
    bool m_cameraYLocked;  // 2.011 +0x232 (interpolated)
    bool m_cameraXLocked;  // 2.011 +0x233 (voted)
    PAD = win 0x1c;
    float m_levelLength;  // 2.011 +0x250 (interpolated)
    float m_realLevelLength;  // 2.011 +0x254 (voted)
    PAD = win 0x20;
    cocos2d::CCDictionary* m_particleSystemsPlist;  // 2.011 +0x278 (voted)
    PAD = win 0x30;
    bool m_shouldRecordActions;  // 2.011 +0x2ac (voted)
    PAD = win 0x7;
    gd::string m_previousRecords;  // 2.011 +0x2b4 (voted)
    PAD = win 0x4;
    double m_time;  // 2.011 +0x2d0 (voted)
    PAD = win 0x20;
    GameObject* m_latestVehicle;  // 2.011 +0x2f8 (voted)
    GameObject* m_dualObject;  // 2.011 +0x2fc (voted)
    bool m_isFlipped;  // 2.011 +0x300 (accessor)
    PAD = win 0x3;
    float m_mirrorTransition;  // 2.011 +0x304 (voted)
    PAD = win 0x4;
    UILayer* m_UILayer;  // 2.011 +0x30c (accessor)
    GJGameLevel* m_level;  // 2.011 +0x310 (voted)
    cocos2d::CCPoint m_cameraPosition;  // 2.011 +0x314 (voted)
    bool m_isTestMode;  // 2.011 +0x31c (interpolated)
    bool m_isPracticeMode;  // 2.011 +0x31d (accessor)
    PAD = win 0x6;
    bool m_unk49C;  // 2.011 +0x324 (voted)
    PAD = win 0x3;
    StartPosObject* m_startPos;  // 2.011 +0x328 (accessor)
    PAD = win 0x4;
    int m_currentAttempt;  // 2.011 +0x330 (voted)
    int m_jumpCount;  // 2.011 +0x334 (interpolated)
    PAD = win 0x4;
    float m_totalTime;  // 2.011 +0x33c (voted)
    PAD = win 0x18;
    double m_inlineCalculatedKickTime;  // 2.011 +0x358 (voted)
    double m_accumulatedKickDeltaTime;  // 2.011 +0x360 (interpolated)
    double m_unusedKickDouble;  // 2.011 +0x368 (voted)
    PAD = win 0x10;
}

class PlayerCheckpoint : cocos2d::CCNode {
    // virtual ~PlayerCheckpoint() = mac 0x80760, win 0x16a1f0; inlined on windows
    static PlayerCheckpoint* create() = mac 0x7e8c0, win 0x17e340;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0xc2c40;  // 2.0 slot (getPlayerPos, types unknown)
    virtual void setPlayerPos(cocos2d::CCPoint) = win 0xc2c60;
    virtual void gd20_slot_109() = win 0x134d0;  // 2.0 slot (getPlayerYVel, types unknown)
    virtual void setPlayerYVel(float) = win 0x134e0;
    virtual void gd20_slot_111() = win 0xed040;  // 2.0 slot (getFlipGravity, types unknown)
    virtual void setFlipGravity(bool) = win 0xed050;
    virtual void gd20_slot_113() = win 0xed060;  // 2.0 slot (getFlyMode, types unknown)
    virtual void setFlyMode(bool) = win 0xed070;
    virtual void gd20_slot_115() = win 0xed080;  // 2.0 slot (getRollMode, types unknown)
    virtual void setRollMode(bool) = win 0xed090;
    virtual void gd20_slot_117() = win 0x16a290;  // 2.0 slot (getBirdMode, types unknown)
    virtual void setBirdMode(bool) = win 0x16a2a0;
    virtual void gd20_slot_119() = win 0x66d0;  // 2.0 slot (getDartMode, types unknown)
    virtual void setDartMode(bool) = win 0x66e0;
    virtual void gd20_slot_121() = win 0x16a2b0;  // 2.0 slot (getRobotMode, types unknown)
    virtual void setRobotMode(bool) = win 0x16a2c0;
    virtual void gd20_slot_123() = win 0x16a2d0;  // 2.0 slot (getCanJump, types unknown)
    virtual void setCanJump(bool) = win 0x16a2e0;
    virtual void gd20_slot_125() = win 0x211c0;  // 2.0 slot (getGhostType, types unknown)
    virtual void setGhostType(int) = win 0xc2c80;
    virtual void gd20_slot_127() = win 0xc3170;  // 2.0 slot (getIsScaled, types unknown)
    virtual void setIsScaled(bool) = win 0xc3180;
    virtual void gd20_slot_129() = win 0x14110;  // 2.0 slot (getTimeMod, types unknown)
    virtual void setTimeMod(float) = win 0x14120;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    cocos2d::CCPoint m_position;  // 2.011 +0xe8 (voted)
    PAD = win 0x18;
}

class PlayerObject : GameObject, AnimatedSpriteDelegate {
    virtual ~PlayerObject() = mac 0x217220, win 0x15d970;
    virtual void update(float) = mac 0x218bf0, win 0x15f4e0;
    virtual void setScaleX(float) = mac 0x22e7f0, win 0x169750;
    virtual void setScaleY(float) = mac 0x22e830, win 0x1697f0;
    virtual void setScale(float) = mac 0x22e870, win 0x169890;
    virtual void setPosition(cocos2d::CCPoint const&) = mac 0x22c8b0, win 0x166b50;
    virtual void setVisible(bool) = mac 0x22e8b0, win 0x169930;
    virtual void setRotation(float) = mac 0x22e6e0, win 0x169600;
    virtual void setOpacity(unsigned char) = mac 0x22d400, win 0x167330;
    virtual void setColor(cocos2d::_ccColor3B const&) = mac 0x22cdf0, win 0x166fd0;
    virtual void setFlipX(bool) = mac 0x22e720, win 0x169640;
    virtual void setFlipY(bool) = mac 0x22e7b0, win 0x1696f0;
    virtual void resetObject() = mac 0x223170, win 0x1640c0;
    virtual cocos2d::CCPoint getRealPosition() = mac 0x22d5f0, win 0x1673e0;
    virtual void getOrientedBox() = mac 0x22dee0, win 0x168880;
    virtual void animationFinished(char const*) = mac 0x22e9d0, win 0x169960;
    void activateStreak() = mac 0x21aef0, win 0x1682a0;
    void addAllParticles() = mac 0x2189b0, win 0x15f0e0;
    void addToTouchedRings(GameObject*) = mac 0x22b800;
    void boostPlayer(float) = mac 0x21d6b0, win 0x168190;
    void bumpPlayer(float, int) = mac 0x22d890;
    void buttonDown(PlayerButton) = mac 0x22b7e0;
    void checkSnapJumpToObject(GameObject*) = mac 0x2217f0, win 0x163bc0;
    bool collidedWithObject(float fl, GameObject* obj) {
        auto rect = obj->getObjectRect();
        return collidedWithObject(fl, obj, rect);
    }
    bool collidedWithObject(float, GameObject*, cocos2d::CCRect) = mac 0x21f0b0, win 0x162cc0;
    bool collidedWithSlope(float, GameObject*, bool) = mac 0x21d8d0, win 0x161a10;
    void convertToClosestRotation(float) = mac 0x21c860, win 0x160820;
    void copyAttributes(PlayerObject*) = mac 0x22dc70, win 0x168640;
    static PlayerObject* create(int, int, cocos2d::CCLayer*) = mac 0x217260, win 0x15e3e0;
    void deactivateParticle() = mac 0x21a540, win 0x15fe50;
    void deactivateStreak(bool) = mac 0x218b30;
    void fadeOutStreak2(float) = mac 0x225890;
    void flashPlayer(float, float, cocos2d::_ccColor3B, cocos2d::_ccColor3B) = mac 0x221c80;
    void flipGravity(bool, bool) = mac 0x21c090, win 0x165580;
    void flipMod() = mac 0x21a4c0;
    void getActiveMode() = mac 0x22b950;
    float getModifiedSlopeYVel() = mac 0x21bff0, win 0x161530;
    void getOldPosition(float) = mac 0x21a830;
    void getSecondColor() = mac 0x22cee0, win 0xdae0;
    void gravityDown() = mac 0x22e930;
    void gravityUp() = mac 0x22e900;
    void hardFlipGravity() = mac 0x22b860, win 0x165540;
    void hitGround(bool) = mac 0x220a30, win 0x166830;
    void incrementJumps() = mac 0x21c050;
    bool init(int, int, cocos2d::CCLayer*) = mac 0x2172e0, win 0x15e490;
    void isBoostValid(float) = mac 0x21d650, win 0x1614d0;
    void isFlying() = mac 0x21a4e0, win 0x165990;
    void isSafeFlip(float) = mac 0x2209f0;
    void isSafeMode(float) = mac 0x2209b0;
    void isSafeSpiderFlip(float) = mac 0x221be0;
    void levelFlipFinished() = mac 0x21b060, win 0x15fd80;
    bool levelFlipping() = mac 0x21a510, win 0x166380;
    void levelWillFlip() = mac 0x21b020, win 0x15fd10;
    void loadFromCheckpoint(PlayerCheckpoint*) = mac 0x22e420, win 0x1690d0;
    void lockPlayer() = mac 0x22d680, win 0x167d60;
    void logValues() = mac 0x221220;
    void modeDidChange() = mac 0x22bfd0;
    void placeStreakPoint() = mac 0x21af90, win 0x168890;
    void playBurstEffect() = mac 0x21c780, win 0x166300;
    void playDeathEffect() = mac 0x225930;
    void playDynamicSpiderRun() = mac 0x222ec0;
    void playerDestroyed(bool) = mac 0x2256d0, win 0x164b10;
    bool playerIsFalling() = mac 0x21c730, win 0x165930;
    void playerTeleported() = mac 0x22b840;
    void playingEndEffect() = mac 0x22d7e0;
    void postCollision(float) = mac 0x21cd10, win 0x160c10;
    void preCollision() = mac 0x21ccc0;
    void preSlopeCollision(float, GameObject*) = mac 0x21ec80, win 0x161590;
    void propellPlayer(float) = mac 0x22d8e0, win 0x167e20;
    void pushButton(PlayerButton) = mac 0x22aa00, win 0x164e40;
    void pushDown() = mac 0x22dbd0;
    void pushPlayer(float) = mac 0x22dbb0;
    void releaseButton(PlayerButton) = mac 0x22b6f0, win 0x164f10;
    void removeAllParticles() = mac 0x218ac0, win 0x15f1a0;
    void removePendingCheckpoint() = mac 0x2237b0, win 0x1692d0;
    void resetAllParticles() = mac 0x21adb0, win 0x15fdf0;
    void resetCollisionLog() = mac 0x21cc20;
    void resetPlayerIcon() = mac 0x22be00, win 0x166160;
    void resetStateVariables() = mac 0x223760;
    void resetStreak() = mac 0x21ae10, win 0x15fc60;
    void ringJump(GameObject*) = mac 0x22abf0;
    void runBallRotation(float) = mac 0x21ca10, win 0x160a20;
    void runBallRotation2() = mac 0x21cb10, win 0x160b20;
    void runNormalRotation() = mac 0x21c960, win 0x160980;
    void runRotateAction(bool) = mac 0x21c570, win 0x160930;
    void saveToCheckpoint(PlayerCheckpoint*) = mac 0x22e2f0, win 0x168f00;
    void setSecondColor(cocos2d::_ccColor3B const&) = mac 0x219610;
    void setupStreak() = mac 0x218720, win 0x15f200;
    void spawnCircle() = mac 0x2251b0, win 0x1644c0;
    void spawnCircle2() = mac 0x2252a0;
    void spawnDualCircle() = mac 0x2255c0, win 0x1649f0;
    void spawnFromPlayer(PlayerObject*) = mac 0x22dde0, win 0x1687e0;
    void spawnPortalCircle(cocos2d::_ccColor3B, float) = mac 0x225350, win 0x1646d0;
    void spawnScaleCircle() = mac 0x225480, win 0x164890;
    void specialGroundHit() = mac 0x22dbf0, win 0x1683f0;
    void speedDown() = mac 0x22e970;
    void speedUp() = mac 0x22e950;
    void spiderTestJump(bool) = mac 0x21b160;
    void startDashing(GameObject*) = mac 0x221d70;
    void stopBurstEffect() = mac 0x22c680, win 0x166370;
    void stopDashing() = mac 0x222990;
    void stopRotation(bool) = mac 0x21c830, win 0x160800;
    void storeCollision(bool, int) = mac 0x21cc60;
    void switchedToMode(GameObjectType) = mac 0x22b9a0, win 0x1667d0;
    void testForMoving(float, GameObject*) = mac 0x21eb70, win 0x1613e0;
    void toggleBirdMode(bool) = mac 0x224070, win 0x165bc0;
    void toggleDartMode(bool) = mac 0x2243f0, win 0x165e30;
    void toggleFlyMode(bool) = mac 0x223820, win 0x1659c0;
    void toggleGhostEffect(GhostType) = mac 0x225000, win 0x167ae0;
    void togglePlayerScale(bool) = mac 0x224bd0, win 0x168900;
    void toggleRobotMode(bool) = mac 0x223c70, win 0x166550;
    void toggleRollMode(bool) = mac 0x223b20, win 0x166440;
    void toggleSpiderMode(bool) = mac 0x224830;
    void toggleVisibility(bool) = mac 0x21abf0;
    void touchedObject(GameObject*) = mac 0x22e660;
    void tryPlaceCheckpoint() = mac 0x21a950, win 0x169360;
    void updateCheckpointMode(bool) = mac 0x218980;
    void updateCheckpointTest() = mac 0x21a890, win 0x15fb80;
    void updateCollide(bool, int) = mac 0x220f10, win 0x163f40;
    void updateCollideBottom(float, int) = mac 0x221790, win 0x163fe0;
    void updateCollideTop(float, int) = mac 0x221c20, win 0x164050;
    void updateDashAnimation() = mac 0x21a570;
    void updateDashArt() = mac 0x222520;
    void updateGlowColor() = mac 0x22cf10, win 0x167030;
    void updateJump(float) = mac 0x219680, win 0x15fe80;
    void updateJumpVariables() = mac 0x21a740;
    void updatePlayerBirdFrame(int) = mac 0x22bfe0, win 0x1676a0;
    void updatePlayerDartFrame(int) = mac 0x22c260, win 0x167990;
    void updatePlayerFrame(int) = mac 0x22c470, win 0x167400;
    void updatePlayerGlow() = mac 0x22bc50, win 0x168500;
    void updatePlayerRobotFrame(int) = mac 0x22d620;
    void updatePlayerRollFrame(int) = mac 0x22c6a0, win 0x167840;
    void updatePlayerScale() = mac 0x22b8b0, win 0x168470;
    void updatePlayerShipFrame(int) = mac 0x22ba40, win 0x167550;
    void updatePlayerSpiderFrame(int) = mac 0x22d650;
    void updatePlayerSpriteExtra(gd::string) = mac 0x218440;
    void updateRobotAnimationSpeed() = mac 0x22df40, win 0x168e60;
    void updateRotation(float) = mac 0x2214b0, win 0x1629a0;
    void updateRotation(float, float) = mac 0x221230, win 0x162a60;
    void updateShipRotation(float) = mac 0x221310, win 0x1627f0;
    void updateShipSpriteExtra(gd::string) = mac 0x218510;
    void updateSlopeRotation(float) = mac 0x221030;
    void updateSlopeYVelocity(float) = mac 0x22e920;
    void updateSpecial(float) = mac 0x21a790;
    void updateStateVariables() = mac 0x21a770;
    void updateTimeMod(float) = mac 0x2185e0, win 0x168cf0;
    void usingWallLimitedMode() = mac 0x22df00;
    void yStartDown() = mac 0x22e9b0;
    void yStartUp() = mac 0x22e990;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_320() = win 0x15dd10;  // 2.0 slot (getLastGroundObject, types unknown)
    virtual void gd20_slot_321() = win 0x15dd20;  // 2.0 slot (getCurrentIcon, types unknown)
    virtual void gd20_slot_322() = win 0x15dd30;  // 2.0 slot (getDidStick, types unknown)
    virtual void gd20_slot_323() = win 0x15dd40;  // 2.0 slot (getPlayerXVelocity, types unknown)
    virtual void gd20_slot_324() = win 0x15dd50;  // 2.0 slot (getTookDamage, types unknown)
    virtual void setTookDamage(bool) = win 0x15dd60;
    virtual void gd20_slot_326() = win 0x15dd70;  // 2.0 slot (getUpKeyDown, types unknown)
    virtual void gd20_slot_327() = win 0x15dd80;  // 2.0 slot (getUpKeyPressed, types unknown)
    virtual void gd20_slot_328() = win 0x15dd90;  // 2.0 slot, name unknown
    virtual void gd20_slot_329() = win 0x15dda0;  // 2.0 slot (getWasOnSlope, types unknown)
    virtual void setWasOnSlope(bool) = win 0x15ddb0;
    virtual void gd20_slot_331() = win 0x15ddc0;  // 2.0 slot, name unknown
    virtual void gd20_slot_332() = win 0x15ddd0;  // 2.0 slot, name unknown
    virtual void gd20_slot_333() = win 0x15dde0;  // 2.0 slot, name unknown
    virtual void gd20_slot_334() = win 0x15ddf0;  // 2.0 slot, name unknown
    virtual void gd20_slot_335() = win 0x15de00;  // 2.0 slot (getRollMode, types unknown)
    virtual void gd20_slot_336() = win 0x15de10;  // 2.0 slot (getDartMode, types unknown)
    virtual void gd20_slot_337() = win 0x15de20;  // 2.0 slot (getRobotMode, types unknown)
    virtual void gd20_slot_338() = win 0x15de30;  // 2.0 slot (getGravityFlipped, types unknown)
    virtual void gd20_slot_339() = win 0x15de40;  // 2.0 slot (getIsDead, types unknown)
    virtual void gd20_slot_340() = win 0x15de50;  // 2.0 slot, name unknown
    virtual void gd20_slot_341() = win 0x15de60;  // 2.0 slot (getCanJump, types unknown)
    virtual void gd20_slot_342() = win 0x15de70;  // 2.0 slot (getPlayerScale, types unknown)
    virtual void gd20_slot_343() = win 0x15de80;  // 2.0 slot, name unknown
    virtual void gd20_slot_344() = win 0x15de90;  // 2.0 slot (getLastP, types unknown)
    virtual void setLastP(cocos2d::CCPoint) = win 0x15deb0;
    virtual void gd20_slot_346() = win 0x15ded0;  // 2.0 slot (getPortalP, types unknown)
    virtual void setPortalP(cocos2d::CCPoint) = win 0x15def0;
    virtual void gd20_slot_348() = win 0x15df10;  // 2.0 slot (getGameLayer, types unknown)
    virtual void setGameLayer(cocos2d::CCLayer*) = win 0x15df20;
    virtual void gd20_slot_350() = win 0x15df30;  // 2.0 slot (getOnGround, types unknown)
    virtual void setOnGround(bool) = win 0x15df40;
    virtual void gd20_slot_352() = win 0x15df50;  // 2.0 slot (getIsJumping, types unknown)
    virtual void gd20_slot_353() = win 0x15df60;  // 2.0 slot (getIsLocked, types unknown)
    virtual void gd20_slot_354() = win 0x15df70;  // 2.0 slot (getLastGroundPos, types unknown)
    virtual void setLastGroundPos(cocos2d::CCPoint) = win 0x15df90;
    virtual void gd20_slot_356() = win 0x15dfb0;  // 2.0 slot (getTouchedRing, types unknown)
    virtual void setTouchedRing(GameObject*) = win 0x15dfc0;
    virtual void gd20_slot_358() = win 0x15dfd0;  // 2.0 slot (getPortalObject, types unknown)
    virtual void setPortalObject(GameObject*) = win 0x15dfe0;
    virtual void gd20_slot_360() = win 0x15dff0;  // 2.0 slot (getHasJumped, types unknown)
    virtual void gd20_slot_361() = win 0x15e000;  // 2.0 slot (getHasRingJumped, types unknown)
    virtual void gd20_slot_362() = win 0x15e010;  // 2.0 slot (getGlowColor1, types unknown)
    virtual void gd20_slot_363() = win 0x15e030;  // 2.0 slot (getGlowColor2, types unknown)
    virtual void gd20_slot_364() = win 0x15e050;  // 2.0 slot (getRealPlayerPos, types unknown)
    virtual void setRealPlayerPos(cocos2d::CCPoint) = win 0x15e070;
    virtual void gd20_slot_366() = win 0x15e090;  // 2.0 slot (getIsSecondPlayer, types unknown)
    virtual void setIsSecondPlayer(bool) = win 0x15e0a0;
    virtual void gd20_slot_368() = win 0x15e0b0;  // 2.0 slot (getDualMode, types unknown)
    virtual void setDualMode(bool) = win 0x15e0c0;
    virtual void gd20_slot_370() = win 0x15e0d0;  // 2.0 slot (getClkTimer, types unknown)
    virtual void setClkTimer(double) = win 0x15e0e0;
    virtual void gd20_slot_372() = win 0x15e100;  // 2.0 slot (getDisableEffects, types unknown)
    virtual void setDisableEffects(bool) = win 0x15e110;
    virtual void gd20_slot_374() = win 0x15e120;  // 2.0 slot (getAudioScale, types unknown)
    virtual void setAudioScale(float) = win 0x15e130;
    virtual void gd20_slot_376() = win 0x15e150;  // 2.0 slot (getGroundHeight, types unknown)
    virtual void setGroundHeight(float) = win 0x15e160;
    virtual void gd20_slot_378() = win 0x15e180;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x3e4 ----
    PAD = win 0xc;
    bool m_unk480;  // 2.011 +0x3f0 (voted)
    PAD = win 0x47;
    bool m_unk4D4;  // 2.011 +0x438 (interpolated)
    PAD = win 0x3;
    cocos2d::CCArray* m_particleSystems;  // 2.011 +0x43c (voted)
    PAD = win 0x10;
    cocos2d::CCSprite* m_iconSprite;  // 2.011 +0x450 (voted)
    PAD = win 0x18;
    cocos2d::CCSprite* m_unk50C;  // 2.011 +0x46c (voted)
    cocos2d::CCMotionStreak* m_regularTrail;  // 2.011 +0x470 (voted)
    HardStreak* m_waveTrail;  // 2.011 +0x474 (voted)
    double m_xVelocity;  // 2.011 +0x478 (voted)
    double m_jumpAccel;  // 2.011 +0x480 (voted)
    double m_gravity;  // 2.011 +0x488 (interpolated)
    double m_unknown20;  // 2.011 +0x490 (interpolated)
    bool m_unk539;  // 2.011 +0x498 (voted)
    bool m_unk53A;  // 2.011 +0x499 (interpolated)
    bool m_unk53B;  // 2.011 +0x49a (interpolated)
    bool m_isInPlayLayer;  // 2.011 +0x49b (voted)
    PAD = win 0x3c;
    GameObject* m_objectSnappedTo;  // 2.011 +0x4d8 (voted)
    CheckpointObject* m_checkpoint;  // 2.011 +0x4dc (voted)
    int m_unknown6a0;  // 2.011 +0x4e0 (voted)
    PAD = win 0x18;
    cocos2d::CCParticleSystemQuad* m_unk5C4;  // 2.011 +0x4fc (voted)
    PAD = win 0x4;
    void* m_unk5D0;  // 2.011 +0x504 (voted)
    PAD = win 0x20;
    bool m_unk5FC;  // 2.011 +0x528 (interpolated)
    bool m_unk5FD;  // 2.011 +0x529 (interpolated)
    bool m_hasHitPortal;  // 2.011 +0x52a (interpolated)
    PAD = win 0xc;
    bool m_isHolding;  // 2.011 +0x537 (voted)
    PAD = win 0x1;
    bool m_canRobotJump;  // 2.011 +0x539 (voted)
    PAD = win 0x6;
    double m_yVelocity;  // 2.011 +0x540 (voted)
    bool m_wasOnSlope;  // 2.011 +0x548 (accessor)
    PAD = win 0x8;
    bool m_isBird;  // 2.011 +0x551 (voted)
    bool m_isBall;  // 2.011 +0x552 (voted)
    bool m_isDart;  // 2.011 +0x553 (voted)
    bool m_isRobot;  // 2.011 +0x554 (voted)
    bool m_isDead;  // 2.011 +0x555 (accessor)
    PAD = win 0x2;
    float m_vehicleSize;  // 2.011 +0x558 (voted)
    float m_playerSpeed;  // 2.011 +0x55c (voted)
    cocos2d::CCPoint m_unk64C;  // 2.011 +0x560 (interpolated)
    cocos2d::CCPoint m_lastPortalPos;  // 2.011 +0x568 (voted)
    cocos2d::CCLayer* m_unk65C;  // 2.011 +0x570 (voted)
    bool m_isOnGround;  // 2.011 +0x574 (accessor)
    bool m_isRising;  // 2.011 +0x575 (interpolated)
    bool m_isLocked;  // 2.011 +0x576 (accessor)
    PAD = win 0x1;
    cocos2d::CCPoint m_lastGroundedPos;  // 2.011 +0x578 (voted)
    cocos2d::CCArray* m_touchingRings;  // 2.011 +0x580 (voted)
    GameObject* m_lastActivatedPortal;  // 2.011 +0x584 (interpolated)
    bool m_unk674;  // 2.011 +0x588 (interpolated)
    bool m_unk675;  // 2.011 +0x589 (interpolated)
    cocos2d::ccColor3B m_playerColor1;  // 2.011 +0x58a (voted)
    cocos2d::ccColor3B m_playerColor2;  // 2.011 +0x58d (voted)
    cocos2d::CCPoint m_position;  // 2.011 +0x590 (voted)
    PAD = win 0x8;
    double m_unk688;  // 2.011 +0x5a0 (voted)
    PAD = win 0x4;
    float m_meteringValue;  // 2.011 +0x5ac (interpolated)
    float m_groundHeight;  // 2.011 +0x5b0 (accessor)
    float m_unk69C;  // 2.011 +0x5b4 (voted)
}

class PointNode : cocos2d::CCObject {
    static PointNode* create(cocos2d::CCPoint point) = win 0xe4dc0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_9() = win 0xe44a0;  // 2.0 slot (getPoint, types unknown)
    virtual void setPoint(cocos2d::CCPoint) = win 0xe44c0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x18 ----
    cocos2d::CCPoint m_point;  // 2.011 +0x18 (same own size)
}

class ProfilePage : FLAlertLayer, FLAlertLayerProtocol, LevelCommentDelegate, CommentUploadDelegate, UserInfoDelegate, UploadActionDelegate, UploadPopupDelegate, LeaderboardManagerDelegate {
    static ProfilePage* create(int accountID, bool idk) = mac 0x45eed0, win 0x17f870;
    ProfilePage() = win 0x17f330;
    virtual void getUserInfoFailed(int) = mac 0x463FB0, win 0x183900;
    virtual void userInfoChanged(GJUserScore*) = mac 0x464070, win 0x183950;
    bool init(int accountID, bool idk) = mac 0x45f170, win 0x17f920;
    void onYoutube(cocos2d::CCObject*) = mac 0x462360;
    void onTwitter(cocos2d::CCObject*) = mac 0x462500;
    void onTwitch(cocos2d::CCObject*) = mac 0x4626a0;
    void onCommentHistory(cocos2d::CCObject*) = mac 0x462840;
    void onSendMessage(cocos2d::CCObject*) = mac 0x462870, win 0x1824d0;
    void onFriend(cocos2d::CCObject*) = mac 0x4628c0, win 0x1826b0;
    void onBlockUser(cocos2d::CCObject*) = mac 0x462b60, win 0x1828f0;
    void onMyLevels(cocos2d::CCObject*) = mac 0x462d70, win 0x182350;
    void onMessages(cocos2d::CCObject*) = mac 0x462f10, win 0x1837f0;
    void onFriends(cocos2d::CCObject*) = mac 0x462f60, win 0x183820;
    void onRequests(cocos2d::CCObject*) = mac 0x462fb0, win 0x183850;
    void onSettings(cocos2d::CCObject*) = mac 0x463000, win 0x1837d0;
    void onComment(cocos2d::CCObject*) = mac 0x463020, win 0x182590;
    void onUpdate(cocos2d::CCObject*) = mac 0x460150, win 0x180460;
    void onClose(cocos2d::CCObject*) = mac 0x45fd20;
    virtual void keyBackClicked() = mac 0x464A60, win 0xdf810;
    void loadPageFromUserInfo(GJUserScore* score) = mac 0x460480, win 0x180b00;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1e4 ----
    GJUserScore* m_score;  // 2.011 +0x1e4 (voted)
    int m_accountID;  // 2.011 +0x1e8 (voted)
    PAD = win 0x34;
    cocos2d::CCArray* m_buttons;  // 2.011 +0x220 (interpolated)
    PAD = win 0x20;
}

class PulseEffectAction : cocos2d::CCNode {
    static PulseEffectAction* createFromString(gd::string) = mac 0x179e90, win 0xc55f0;
    gd::string getSaveString() = mac 0x17a850, win 0xc5b80;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x13500;  // 2.0 slot, name unknown
    virtual void gd20_slot_108() = win 0x13510;  // 2.0 slot, name unknown
    virtual void gd20_slot_109() = win 0x14010;  // 2.0 slot, name unknown
    virtual void gd20_slot_110() = win 0x140b0;  // 2.0 slot, name unknown
    virtual void gd20_slot_111() = win 0xc2fe0;  // 2.0 slot, name unknown
    virtual void gd20_slot_112() = win 0x135b0;  // 2.0 slot, name unknown
    virtual void gd20_slot_113() = win 0xc3000;  // 2.0 slot, name unknown
    virtual void gd20_slot_114() = win 0xe080;  // 2.0 slot, name unknown
    virtual void gd20_slot_115() = win 0x15770;  // 2.0 slot, name unknown
    virtual void gd20_slot_116() = win 0x15790;  // 2.0 slot, name unknown
}

class RateLevelDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void rateLevelClosed() {}
}

class RateStarsLayer : FLAlertLayer, UploadPopupDelegate, UploadActionDelegate {

    static RateStarsLayer* create(int levelID, bool isModSuggest) = mac 0x135e50, win 0x184f40;
    bool init(int levelID, bool isModSuggest) = mac 0x136050, win 0x184ff0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_144() = win 0x10d70;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(RateLevelDelegate*) = win 0x10d80;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1d0 ----
    bool m_uploadFinished;  // 2.011 +0x1d0 (voted)
    bool m_isModSuggest;  // 2.011 +0x1d1 (interpolated)
    bool m_selectedFeature;  // 2.011 +0x1d2 (voted)
    PAD = win 0x1;
    CCMenuItemSpriteExtra* m_confirmBtn;  // 2.011 +0x1d4 (interpolated)
    cocos2d::CCArray* m_starBtns;  // 2.011 +0x1d8 (interpolated)
    cocos2d::CCSprite* m_difficultySprite;  // 2.011 +0x1dc (interpolated)
    int m_levelID;  // 2.011 +0x1e0 (interpolated)
    int m_selectedRating;  // 2.011 +0x1e4 (voted)
    bool m_selectedCoin;  // 2.011 +0x1e8 (interpolated)
    PAD = win 0x3;
    cocos2d::CCSprite* m_featureSprite;  // 2.011 +0x1ec (interpolated)
    UploadActionPopup* m_rateAction;  // 2.011 +0x1f0 (voted)
    PAD = win 0x4;
}

class RateLevelLayer : FLAlertLayer {
    RateLevelLayer();
    virtual ~RateLevelLayer();

    bool init(int levelID) = win 0x184600;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_144() = win 0xfc00;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(RateLevelDelegate*) = win 0x7d000;
}

class RetryLevelLayer : GJDropDownLayer {
    static RetryLevelLayer* create() = mac 0x28dd60, win 0x185cf0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

// GD 2.011 port: 2.1-only class, stub
class RewardsPage {
}

class RingObject : GameObject {
    static RingObject* create(char const*);  // GD 2.011 port: 0x59D0D0 takes the string in ecx
    bool init(char const*);
    void spawnCircle() = win 0x19d270;
    virtual void setRotation(float) = win 0xb17d0;
    virtual void setScale(float) = win 0x19d4a0;
    virtual void resetObject() = win 0x19d480;
    virtual void customObjectSetup(gd::map<gd::string, gd::string>&) = win 0x2ce50;
    virtual gd::string getSaveString() = win 0xb5fd0;
    virtual void powerOnObject() = win 0x19d220;
    virtual void powerOffObject() = win 0xb2320; // same as GameObject
    virtual void setRScale(float) = win 0x19d4f0;
    virtual void triggerActivated() = win 0x19d210;
    void triggerActivated(float) { this->triggerActivated(); }

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class ScrollingLayer : cocos2d::CCLayerColor {
    static ScrollingLayer* create(cocos2d::CCSize, cocos2d::CCPoint, float) = mac 0x41a900, win 0x29640;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_128() = win 0x29610;  // 2.0 slot, name unknown
    virtual void gd20_slot_129() = win 0x29620;  // 2.0 slot (getScaleParent, types unknown)
    virtual void setScaleParent(cocos2d::CCNode*) = win 0x29630;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x194 ----
    PAD = win 0x28;
    float m_layerHeight;  // 2.011 +0x1bc (same own size)
    PAD = win 0x4;
    cocos2d::CCLayer* m_scrollLayer;  // 2.011 +0x1c4 (same own size)
    cocos2d::CCNode* m_parent;  // 2.011 +0x1c8 (same own size)
}

class SelectArtLayer : FLAlertLayer {
    static SelectArtLayer* create(SelectArtType type) = win 0x105de0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_144() = win 0xfbe0;  // 2.0 slot, name unknown
    virtual void gd20_slot_145() = win 0xfbf0;  // 2.0 slot, name unknown
    virtual void gd20_slot_146() = win 0xfc00;  // 2.0 slot, name unknown
    virtual void gd20_slot_147() = win 0xfc10;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(SelectArtDelegate*) = win 0xed390;
}

class SelectFontLayer : FLAlertLayer {
    static SelectFontLayer* create(LevelEditorLayer* lel) = win 0xd6ea0;
    bool init(LevelEditorLayer* lel) = win 0xd6f40;
    void onChangeFont(cocos2d::CCObject* sender) = win 0xd75f0;
    void updateFontLabel() = win 0xd74b0;
    // Shared with many other classes
    void onClose(cocos2d::CCObject* sender) = win 0xd7680;
    // Shared with many other classes
    virtual void keyBackClicked() = win 0xd76c0;
    virtual ~SelectFontLayer();

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1c8 ----
    int m_selectedFont;  // 2.011 +0x1c8 (same own size)
    LevelEditorLayer* m_editorLayer;  // 2.011 +0x1cc (same own size)
    cocos2d::CCLabelBMFont* m_fontLabel;  // 2.011 +0x1d0 (same own size)
}

class SetGroupIDLayer : FLAlertLayer, TextInputDelegate {
    bool init(GameObject* object, cocos2d::CCArray* objects) = mac 0x1947c0, win 0x18b1b0; 
    void onNextGroupID1(cocos2d::CCObject*) = mac 0x1967a0, win 0x18d170;
    void textChanged(CCTextInputNode*) = mac 0x197af0, win 0x18d000;
    void updateGroupIDLabel() = mac 0x197260, win 0x18dfd0;
    ~SetGroupIDLayer() = mac 0x194410, win 0x18aee0;
    void updateEditorLayerID() = win 0x18db20;
    void updateEditorLayerID2() = win 0x18db90;
    void updateZOrder() = win 0x18df40;
    void onAddGroup(cocos2d::CCObject* sender) = mac 0x1967d0, win 0x18d8f0;
    void onClose(cocos2d::CCObject* sender) = mac 0x1966a0, win 0x18e300;
    void onEditorLayer(cocos2d::CCObject* sender) = mac 0x196800, win 0x18d070;
    void onEditorLayer2(cocos2d::CCObject* sender) = mac 0x196a40, win 0x18d0f0;
    void onZOrder(cocos2d::CCObject* sender) = mac 0x196920, win 0x18d960;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_144() = win 0x7d0b0;  // 2.0 slot (getNextFreeGroupID, types unknown)
    virtual void setNextFreeGroupID(int) = win 0x7d0c0;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1cc ----
    GameObject* m_targetObject;  // 2.011 +0x1cc (interpolated)
    cocos2d::CCArray* m_targetObjects;  // 2.011 +0x1d0 (interpolated)
    cocos2d::CCArray* m_array0;  // 2.011 +0x1d4 (interpolated)
    cocos2d::CCArray* m_array1;  // 2.011 +0x1d8 (interpolated)
    cocos2d::CCLabelBMFont* m_editorLayerText;  // 2.011 +0x1dc (interpolated)
    cocos2d::CCLabelBMFont* m_editorLayer2Text;  // 2.011 +0x1e0 (interpolated)
    cocos2d::CCLabelBMFont* m_zOrderText;  // 2.011 +0x1e4 (interpolated)
    CCTextInputNode* m_groupIDInput;  // 2.011 +0x1e8 (interpolated)
    int m_groupIDValue;  // 2.011 +0x1ec (interpolated)
    int m_editorLayerValue;  // 2.011 +0x1f0 (interpolated)
    int m_editorLayer2Value;  // 2.011 +0x1f4 (interpolated)
    int m_zOrderValue;  // 2.011 +0x1f8 (voted)
    ZLayer m_zLayerValue;  // 2.011 +0x1fc (interpolated)
    bool m_unk204;  // 2.011 +0x200 (voted)
    PAD = win 0xf;
}

class SetIDLayer : FLAlertLayer {
    static SetIDLayer* create(GameObject*) = mac 0x168f20, win 0x18e610;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

// GD 2.011 port: 2.1-only class, stub
class SetIDPopup {
}

// GD 2.011 port: 2.1-only class, stub
class SetIDPopupDelegate {
}

// GD 2.011 port: 2.1-only class, stub
class SetItemIDLayer {
}

// GD 2.011 port: 2.1-only class, stub
class SetTargetIDLayer {
}

// GD 2.011 port: 2.1-only class, stub
class SetTextPopupDelegate {
}

// GD 2.011 port: 2.1-only class, stub
class SetupAnimationPopup {
}

// GD 2.011 port: 2.1-only class, stub
class SetupCollisionTriggerPopup {
}

// GD 2.011 port: 2.1-only class, stub
class SetupCountTriggerPopup {
}

// GD 2.011 port: 2.1-only class, stub
class SetupInstantCountPopup {
}

// GD 2.011 port: 2.1-only class, stub
class SetupInteractObjectPopup {
}

class SetupObjectTogglePopup : FLAlertLayer, TextInputDelegate {
    static SetupObjectTogglePopup* create(EffectGameObject*, cocos2d::CCArray*) = mac 0x1c0860, win 0x18ee10;
    bool init(EffectGameObject*, cocos2d::CCArray*) = mac 0x1c0a40, win 0x18eec0;
    void onTargetIDArrow(cocos2d::CCObject*) = mac 0x1c1c40, win 0x18fe70;
    void textChanged(CCTextInputNode*) = mac 0x1c2660, win 0x18feb0;
    void updateTargetID() = mac 0x1c2440, win 0x1900a0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class SetupOpacityPopup : FLAlertLayer, TextInputDelegate {
    static SetupOpacityPopup* create(EffectGameObject*, cocos2d::CCArray*) = mac 0x32b70, win 0x190420;
    void onTargetIDArrow(cocos2d::CCObject*) = mac 0x340a0, win 0x1913f0;
    void textChanged(CCTextInputNode*) = mac 0x34a60, win 0x1915d0;
    void updateTargetID() = mac 0x34760, win 0x1917d0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

// GD 2.011 port: 2.1-only class, stub
class SetupPickupTriggerPopup {
}

class SetupPulsePopup : FLAlertLayer, cocos2d::extension::ColorPickerDelegate, TextInputDelegate, GJSpecialColorSelectDelegate {
    virtual void colorValueChanged(cocos2d::ccColor3B color) = mac 0x1ec680, win 0x1958e0;
    SetupPulsePopup() {}

    bool init(EffectGameObject* triggerObj, cocos2d::CCArray* triggerObjs) = mac 0x1e7010, win 0x191e20;
    void updateColorValue();
    void onSelectPulseMode(cocos2d::CCObject*) = mac 0x1eb020, win 0x194770;
    void updatePulseMode() = win 0x195f70; // 0x38c on mac

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1d4 ----
    cocos2d::extension::CCControlColourPicker* m_colorPicker;  // 2.011 +0x1d4 (interpolated)
    PAD = win 0x30;
    cocos2d::CCSprite* m_currentColorSpr;  // 2.011 +0x208 (interpolated)
    cocos2d::CCSprite* m_prevColorSpr;  // 2.011 +0x20c (interpolated)
    PAD = win 0x64;
    int m_pulseMode;  // 2.011 +0x274 (voted)
    PAD = win 0x18;
}

// GD 2.011 port: 2.1-only class, stub
class SetupRotatePopup {
}

// GD 2.011 port: 2.1-only class, stub
class SetupShakePopup {
}

class SetupSpawnPopup : FLAlertLayer, TextInputDelegate {
    static SetupSpawnPopup* create(EffectGameObject*, cocos2d::CCArray*) = mac 0x139790, win 0x196550;
    void createToggleButton(gd::string, cocos2d::SEL_MenuHandler, bool, cocos2d::CCMenu*, cocos2d::CCPoint, cocos2d::CCArray*) = mac 0x13b0e0;
    void onTargetIDArrow(cocos2d::CCObject*) = mac 0x13ad80, win 0x197040;
    void textChanged(CCTextInputNode*) = mac 0x13b990, win 0x197080;
    void updateTargetID() = mac 0x13b770;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1cc ----
    PAD = win 0x18;
}

// GD 2.011 port: 2.1-only class, stub
class SetupTouchTogglePopup {
}

class ShareCommentLayer : FLAlertLayer, TextInputDelegate, UploadActionDelegate, UploadPopupDelegate {
    static ShareCommentLayer* create(gd::string, int, CommentType, int) = win 0x197460;
    bool init(gd::string, int, CommentType, int) = win 0x197530;
    void onShare(CCObject*) = win 0x197dc0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class SimplePlayer : cocos2d::CCSprite {
    SimplePlayer() {}
    void setSecondColor(const cocos2d::ccColor3B& color) = win 0xd15f0;  // GD 2.011 port: real function (inline body needed m_secondLayer)

    bool hasGlowOutline() {
        return m_hasGlowOutline;
    }
    void setGlowOutline(bool value) {
        m_hasGlowOutline = value;
        updateColors();
    }

    bool init(int iconID) = mac 0x1bc570, win 0xd1290;
    static SimplePlayer* create(int iconID) = mac 0x1b6140, win 0xd11f0;
    void updatePlayerFrame(int iconID, IconType iconType) = mac 0x1b62f0, win 0xd1790;
    void updateColors() = mac 0x1ba1f0, ios 0x224f2c, win 0xd1620;
    void setFrames(const char* firstLayer, const char* secondLayer, const char* birdDome, const char* outlineSprite, const char* detailSprite) = mac 0x1bca10;
    virtual void setColor(const cocos2d::ccColor3B& color) = mac 0x1bc9b0, win 0xd15c0;
    virtual void setOpacity(unsigned char opacity) = mac 0x135370, win 0xd1be0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_133() = win 0x163b0;  // 2.0 slot (getSpecial, types unknown)
    virtual void setSpecial(int) = win 0x7cfd0;
    virtual void gd20_slot_135() = win 0xcbf40;  // 2.0 slot (getUseGlow, types unknown)
    virtual void setUseGlow(bool) = win 0xcbf50;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1b8 ----
    PAD = win 0x18;
    bool m_hasGlowOutline;  // 2.011 +0x1d0 (voted)
    PAD = win 0x3;
}

class Slider : cocos2d::CCLayer {
    void setValue(float val) {
        m_touchLogic->getThumb()->setValue(val);
    }
    void setBarVisibility(bool v) {
        m_sliderBar->setVisible(v);
    }
    // GD 2.011 port (v3): 2.2's two-argument create
    static Slider* create(cocos2d::CCNode* target, cocos2d::SEL_MenuHandler click) {
        return Slider::create(target, click, 1.f);
    }
    static Slider* create(cocos2d::CCNode* target, cocos2d::SEL_MenuHandler click, float scale) {
        return create(target, click, "sliderBar.png", "slidergroove.png", "sliderthumb.png", "sliderthumbsel.png", scale);
    }

    float getValue() = mac 0x18e0c0;
    void updateBar() {
        auto value = m_touchLogic->getThumb()->getValue();
        auto width = m_width * value;
        if (width > m_width) width = m_width;
        m_sliderBar->setTextureRect(cocos2d::CCRect(0.f, 0.f, width, m_height));
    }
    static Slider* create(cocos2d::CCNode* target, cocos2d::SEL_MenuHandler click, const char* unused, const char* grooveSpr, const char* thumbSpr, const char* thumbSprSel, float scale) = mac 0x18dd80, ios 0x2113f4, win 0x2a630;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x118 ----
    SliderTouchLogic* m_touchLogic;  // 2.011 +0x118 (manual)
    cocos2d::CCSprite* m_sliderBar;  // 2.011 +0x11c (manual)
    float m_width;  // 2.011 +0x120 (manual)
    float m_height;  // 2.011 +0x124 (manual)
}

class SliderThumb : cocos2d::CCMenuItemImage {
    void setValue(float val) {
        auto len = static_cast<SliderTouchLogic*>(this->getParent())->m_length;
        this->setPositionX(val * (m_fScaleX * len) - m_fScaleX * len * .5f);
    }
    float getValue() {
        auto len = static_cast<SliderTouchLogic*>(this->getParent())->m_length;
        return (m_fScaleX * len * .5f + this->getPositionX()) / (m_fScaleX * len);
    }

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x114 ----

}

class SliderTouchLogic : cocos2d::CCMenu {
    SliderThumb* getThumb() const { return m_thumb; }

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_127() = win 0x176a0;  // 2.0 slot, name unknown
    virtual void gd20_slot_128() = win 0x176c0;  // 2.0 slot (getSliderDelegate, types unknown)
    virtual void gd20_slot_129() = win 0x176d0;  // 2.0 slot, name unknown
    virtual void gd20_slot_130() = win 0x2a210;  // 2.0 slot (getLiveDragging, types unknown)
    virtual void gd20_slot_131() = win 0x2a220;  // 2.0 slot, name unknown
    virtual void gd20_slot_132() = win 0x2a230;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x134 ----
    float m_unknownUnused;  // 2.011 +0x134 (manual)
    float m_length;  // 2.011 +0x138 (manual)
    SliderThumb* m_thumb;  // 2.011 +0x13c (manual)
    Slider* m_slider;  // 2.011 +0x140 (manual)
    bool m_activateThumb;  // 2.011 +0x144 (manual)
    PAD = win 0x3;
    cocos2d::CCPoint m_position;  // 2.011 +0x148 (manual)
}

class SongCell : TableViewCell {
    void updateBGColor(int index) = win 0x49ba0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class SongInfoLayer : FLAlertLayer {
    static SongInfoLayer* create(int songID);
    static SongInfoLayer* create(gd::string songName, gd::string artistName, gd::string downloadLink, gd::string artistNG, gd::string artistYT, gd::string artistFB);

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1c8 ----

}

class SongInfoObject : cocos2d::CCNode {
    virtual ~SongInfoObject() = mac 0x2f2040;
    virtual void encodeWithCoder(DS_Dictionary*) = mac 0x2f2c70, win 0x124100;
    virtual bool canEncode() = mac 0x2f2da0, win 0xd720;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x202a0;  // 2.0 slot (getSongID, types unknown)
    virtual void setSongID(int) = win 0x202b0;
    virtual void gd20_slot_109() = win 0x7e2d0;  // 2.0 slot (getSongName, types unknown)
    virtual void setSongName(gd::string) = win 0x7e310;
    virtual void gd20_slot_111() = win 0x7e380;  // 2.0 slot (getArtistName, types unknown)
    virtual void setArtistName(gd::string) = win 0x7e3c0;
    virtual void gd20_slot_113() = win 0x2ad10;  // 2.0 slot (getSongYT, types unknown)
    virtual void setSongYT(gd::string) = win 0x2ad50;
    virtual void gd20_slot_115() = win 0x7c340;  // 2.0 slot (getArtistYT, types unknown)
    virtual void setArtistYT(gd::string) = win 0x7c380;
    virtual void gd20_slot_117() = win 0x7c3f0;  // 2.0 slot (getSongURL, types unknown)
    virtual void setSongURL(gd::string) = win 0x7c430;
    virtual void gd20_slot_119() = win 0x7c4a0;  // 2.0 slot (getArtistID, types unknown)
    virtual void setArtistID(int) = win 0x7c4b0;
    virtual void gd20_slot_121() = win 0x120f90;  // 2.0 slot (getFileSize, types unknown)
    virtual void setFileSize(float) = win 0x120fa0;
    virtual void gd20_slot_123() = win 0x120fc0;  // 2.0 slot (getIsUnloaded, types unknown)
    virtual void setIsUnloaded(bool) = win 0x120fd0;
    virtual void gd20_slot_125() = win 0x120fe0;  // 2.0 slot (getIsVerified, types unknown)
    virtual void setIsVerified(bool) = win 0x120ff0;
    virtual void gd20_slot_127() = win 0x121000;  // 2.0 slot (getIsBlocked, types unknown)
    virtual void setIsBlocked(bool) = win 0x121010;
    virtual void gd20_slot_129() = win 0x7c500;  // 2.0 slot (getSongPriority, types unknown)
    virtual void setSongPriority(int) = win 0x7c510;
    virtual void gd20_slot_131() = win 0x19320;  // 2.0 slot (getLevelSettings, types unknown)
    virtual void setLevelSettings(LevelSettingsObject*) = win 0x7c520;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    int m_songID;  // 2.011 +0xe8 (consistent evidence)
    gd::string m_songName;  // 2.011 +0xec (consistent evidence)
    gd::string m_artistName;  // 2.011 +0x104 (consistent evidence)
    gd::string m_youtubeVideo;  // 2.011 +0x11c (consistent evidence)
    gd::string m_youtubeChannel;  // 2.011 +0x134 (consistent evidence)
    gd::string m_songURL;  // 2.011 +0x14c (consistent evidence)
    int m_artistID;  // 2.011 +0x164 (consistent evidence)
    float m_fileSize;  // 2.011 +0x168 (consistent evidence)
    bool m_isUnknownSong;  // 2.011 +0x16c (consistent evidence)
    PAD = win 0x3;
    int m_priority;  // 2.011 +0x170 (consistent evidence)
    LevelSettingsObject* m_levelSettings;  // 2.011 +0x174 (consistent evidence)
}

class SpawnTriggerAction : cocos2d::CCNode {
    static SpawnTriggerAction* createFromString(gd::string) = mac 0x17bf50, win 0xc6310;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x134a0;  // 2.0 slot (getDelayTime, types unknown)
    virtual void setDelayTime(float) = win 0x134b0;
    virtual void gd20_slot_109() = win 0x134d0;  // 2.0 slot (getDeltaTime, types unknown)
    virtual void setDeltaTime(float) = win 0x134e0;
    virtual void gd20_slot_111() = win 0x6680;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    PAD = win 0x10;
}

class SpeedObject : cocos2d::CCNode {

    static SpeedObject* create(GameObject* object, Speed speed, float x);

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_107() = win 0x202a0;  // 2.0 slot, name unknown
    virtual void gd20_slot_108() = win 0x134a0;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0xe8 ----
    Speed m_speed;  // 2.011 +0xe8 (same own size)
    float m_xPos;  // 2.011 +0xec (same own size)
    GameObject* m_object;  // 2.011 +0xf0 (same own size)
}

// GD 2.011 port: 2.1-only class, stub
class SpritePartDelegate {
}

class StartPosObject : EffectGameObject {
    static StartPosObject* create() = mac 0xda7c0;
    void setSettings(LevelSettingsObject*) = mac 0xda910;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_386() = win 0x19d020;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x458 ----
    LevelSettingsObject* m_levelSettings;  // 2.011 +0x458 (voted)
}

class StatsCell : TableViewCell {
    inline StatsCell() {}
    inline StatsCell(char const* identifier, float parentHeight, float height) : TableViewCell(identifier, parentHeight, height) {}
    void updateBGColor(int index);
    virtual void draw() = mac 0x11bf80, win 0x47b20;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class StatsLayer : GJDropDownLayer {
    static StatsLayer* create() = win 0x1a2710;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
}

class TableView : CCScrollLayerExt, CCScrollLayerExtDelegate {
    inline TableView() {}
    inline TableView(cocos2d::CCRect rect) : CCScrollLayerExt(rect) {}

    static TableView* create(TableViewDelegate*, TableViewDataSource*, cocos2d::CCRect) = mac 0x37eb30, win 0x2d150;
    void reloadData() = mac 0x37f970, win 0x2da80;

    virtual void onEnter() {
        CCLayer::onEnter();
    }
    virtual void onExit() {
        CCLayer::onExit();
    }
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x380120, ios 0x21de24, win 0x2e0b0;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x380be0, ios 0x21e5e8, win 0x2e240;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x3809a0, ios 0x21e46c, win 0x2e170;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*) = mac 0x380b20, ios 0x21e580, win 0x2e1d0;
    virtual void registerWithTouchDispatcher() = mac 0x37ff50, ios 0x21dcb4, win 0xf2a0;
    virtual void scrollWheel(float, float) = mac 0x380cd0, ios 0x21e6b4, win 0x2e460;
    virtual void scrllViewWillBeginDecelerating(CCScrollLayerExt*) {}
    virtual void scrollViewDidEndDecelerating(CCScrollLayerExt*) {}
    virtual void scrollViewTouchMoving(CCScrollLayerExt*) {}
    virtual void scrollViewDidEndMoving(CCScrollLayerExt*) {}

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_159() = win 0x2cf20;  // 2.0 slot (getIsScheduled, types unknown)
    virtual void setIsScheduled(bool) = win 0x2cf30;
    virtual void gd20_slot_161() = win 0x2cf40;  // 2.0 slot (getBeginTouch, types unknown)
    virtual void setBeginTouch(cocos2d::CCTouch*) = win 0x2cf50;
    virtual void gd20_slot_163() = win 0x2cf60;  // 2.0 slot, name unknown
    virtual void gd20_slot_164() = win 0x2cf80;  // 2.0 slot, name unknown
    virtual void gd20_slot_165() = win 0x2cfa0;  // 2.0 slot, name unknown
    virtual void gd20_slot_166() = win 0x2cfc0;  // 2.0 slot, name unknown
    virtual void gd20_slot_167() = win 0x2cfe0;  // 2.0 slot, name unknown
    virtual void gd20_slot_168() = win 0x2d000;  // 2.0 slot, name unknown
    virtual void gd20_slot_169() = win 0x2d020;  // 2.0 slot (getTouchCell, types unknown)
    virtual void setTouchCell(TableViewCell*) = win 0x2d030;
    virtual void gd20_slot_171() = win 0x2d040;  // 2.0 slot (getEditable, types unknown)
    virtual void setEditable(bool) = win 0x2d050;
    virtual void gd20_slot_173() = win 0x2d080;  // 2.0 slot (getCellVisibleArray, types unknown)
    virtual void setCellVisibleArray(cocos2d::CCArray*) = win 0x2d090;
    virtual void gd20_slot_175() = win 0x2d0a0;  // 2.0 slot (getCellRemovedArray, types unknown)
    virtual void setCellRemovedArray(cocos2d::CCArray*) = win 0x2d0b0;
    virtual void gd20_slot_177() = win 0x26080;  // 2.0 slot (getindexPathAddedArray, types unknown)
    virtual void setindexPathAddedArray(cocos2d::CCArray*) = win 0x2d0c0;
    virtual void gd20_slot_179() = win 0x26090;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(TableViewDelegate*) = win 0xdf70;
    virtual void gd20_slot_181() = win 0x1eeb0;  // 2.0 slot (getDataSource, types unknown)
    virtual void setDataSource(TableViewDataSource*) = win 0xdfa0;
    virtual void gd20_slot_183() = win 0x2d0f0;  // 2.0 slot (getScrollingToIndexPath, types unknown)
    virtual void setScrollingToIndexPath(CCIndexPath*) = win 0x2d100;
    virtual void gd20_slot_185() = win 0x2d130;  // 2.0 slot (getStealTouches, types unknown)
    virtual void setStealTouches(bool) = win 0x2d140;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x164 ----
    bool m_touchOutOfBoundary;  // 2.011 +0x164 (interpolated)
    PAD = win 0x3;
    cocos2d::CCTouch* m_touchStart;  // 2.011 +0x168 (interpolated)
    cocos2d::CCPoint m_touchStartPosition2;  // 2.011 +0x16c (interpolated)
    cocos2d::CCPoint m_unknown2;  // 2.011 +0x174 (interpolated)
    cocos2d::CCPoint m_touchPosition2;  // 2.011 +0x17c (interpolated)
    void* m_idk;  // 2.011 +0x184 (interpolated)
    bool m_touchMoved;  // 2.011 +0x188 (interpolated)
    PAD = win 0x3;
    cocos2d::CCArray* m_cellArray;  // 2.011 +0x18c (voted)
    cocos2d::CCArray* m_array2;  // 2.011 +0x190 (interpolated)
    cocos2d::CCArray* m_array3;  // 2.011 +0x194 (voted)
    TableViewDelegate* m_tableDelegate;  // 2.011 +0x198 (interpolated)
    TableViewDataSource* m_dataSource;  // 2.011 +0x19c (accessor)
    PAD = win 0x14;
}

[[depends(CCIndexPath)]]
class TableViewCell : cocos2d::CCLayer {
    inline TableViewCell() {}
    inline ~TableViewCell() {
        removeAllChildrenWithCleanup(true);
    }

    inline TableViewCell(const char* p0, float p1, float p2) : m_unknownString(p0), m_width(p1), m_height(p2) {
        m_backgroundLayer = cocos2d::CCLayerColor::create(cocos2d::ccc4(0,0,0,0), m_width, m_height);
        addChild(m_backgroundLayer, -1);
        m_mainLayer = cocos2d::CCLayer::create();
        addChild(m_mainLayer);
        auto raw = reinterpret_cast<uintptr_t>(this);
        *reinterpret_cast<void**>(raw + 0x11c) = nullptr;
        *reinterpret_cast<uint8_t*>(raw + 0x140) = 0;
        *reinterpret_cast<cocos2d::ccColor3B*>(raw + 0x141) = cocos2d::ccc3(255, 0, 0);
        union { uintptr_t addr; cocos2d::SEL_MenuHandler sel; } onDelete { geode::base::get() + 0x2f680 };
        auto deleteItem = cocos2d::CCMenuItemLabel::create(cocos2d::CCLabelTTF::create("Delete", "Arial", 16.f), this, onDelete.sel);
        auto deleteMenu = cocos2d::CCMenu::create(deleteItem, nullptr);
        *reinterpret_cast<cocos2d::CCMenu**>(raw + 0x118) = deleteMenu;
        *reinterpret_cast<cocos2d::CCMenuItemLabel**>(raw + 0x144) = deleteItem;
        addChild(deleteMenu, 0x14);
        deleteMenu->setVisible(false);
        deleteItem->setVisible(false);
    }

    static TableViewCell* create(const char* name, float width, float height) {
        auto pRet = new TableViewCell(name, width, height);

        if (pRet) {
            pRet->autorelease();
            return pRet;
        }

        CC_SAFE_DELETE(pRet);
        return nullptr;
    }

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_125() = win 0xd080;  // 2.0 slot (getEditable, types unknown)
    virtual void setEditable(bool) = win 0xd090;
    virtual void gd20_slot_127() = win 0xd0a0;  // 2.0 slot (getDelBtnColor, types unknown)
    virtual void setDelBtnColor(cocos2d::ccColor3B) = win 0xd0c0;
    virtual void gd20_slot_129() = win 0xd0e0;  // 2.0 slot (getDeleteButton, types unknown)
    virtual void setDeleteButton(cocos2d::CCMenuItem*) = win 0xd0f0;
    virtual void gd20_slot_131() = win 0xd100;  // 2.0 slot (getCellIdentifier, types unknown)
    virtual void setCellIdentifier(gd::string const&) = win 0xd110;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x118 ----
    bool m_unknown;  // 2.011 +0x118 (manual)
    PAD = win 0x3;
    TableView* m_tableView;  // 2.011 +0x11c (manual)
    CCIndexPath m_indexPath;  // 2.011 +0x120 (manual)
    int m_unknownThing;  // 2.011 +0x140 (manual)
    PAD = win 0x4;
    gd::string m_unknownString;  // 2.011 +0x148 (manual)
    float m_width;  // 2.011 +0x160 (manual)
    float m_height;  // 2.011 +0x164 (manual)
    cocos2d::CCLayerColor* m_backgroundLayer;  // 2.011 +0x168 (manual)
    cocos2d::CCLayer* m_mainLayer;  // 2.011 +0x16c (manual)
}

class TableViewDataSource {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual int numberOfRowsInSection(unsigned int, TableView*) { return 0; }
    virtual unsigned int numberOfSectionsInTableView(TableView*) { return 0; }
    virtual void TableViewCommitCellEditingStyleForRowAtIndexPath(TableView*, TableViewCellEditingStyle, CCIndexPath&) {}
    virtual TableViewCell* cellForRowAtIndexPath(CCIndexPath&, TableView*) { return nullptr; }
}

class TableViewDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void willTweenToIndexPath(CCIndexPath&, TableViewCell*, TableView*) {}
    virtual void didEndTweenToIndexPath(CCIndexPath&, TableView*) {}
    virtual void TableViewWillDisplayCellForRowAtIndexPath(CCIndexPath&, TableViewCell*, TableView*) {}
    virtual void TableViewDidDisplayCellForRowAtIndexPath(CCIndexPath&, TableViewCell*, TableView*) {}
    virtual void TableViewWillReloadCellForRowAtIndexPath(CCIndexPath&, TableViewCell*, TableView*) {}
    virtual float cellHeightForRowAtIndexPath(CCIndexPath&, TableView*) { return 0.0; }
    virtual void didSelectRowAtIndexPath(CCIndexPath&, TableView*) {}
}

class TeleportPortalObject : GameObject {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_320() = win 0x1a1e20;  // 2.0 slot, name unknown
    virtual void gd20_slot_321() = win 0x1a1e40;  // 2.0 slot, name unknown
    virtual void gd20_slot_322() = win 0x1a1e50;  // 2.0 slot, name unknown
    virtual void gd20_slot_323() = win 0x19d060;  // 2.0 slot (getTargetPortal, types unknown)
    virtual void setTargetPortal(TeleportPortalObject*) = win 0x19d070;
    virtual void gd20_slot_325() = win 0x19d080;  // 2.0 slot (getLockX, types unknown)
    virtual void setLockX(bool) = win 0x19d090;
    virtual void gd20_slot_327() = win 0x19d0a0;  // 2.0 slot (getPortalTargetY, types unknown)
    virtual void setPortalTargetY(float) = win 0x19d0b0;
    virtual void gd20_slot_329() = win 0x19cb30;  // 2.0 slot (getSmoothEase, types unknown)
    virtual void setSmoothEase(bool) = win 0x19cb40;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x3e0 ----
    PAD = win 0x4;
    TeleportPortalObject* m_orangePortal;  // 2.011 +0x3e4 (same own size)
    bool m_isYellowPortal;  // 2.011 +0x3e8 (same own size)
    PAD = win 0x3;
    float m_teleportYOffset;  // 2.011 +0x3ec (same own size)
    bool m_teleportEase;  // 2.011 +0x3f0 (same own size)
    PAD = win 0x3;
}

// GD 2.011 port: 2.1-only class, stub
class TextAlertPopup {
}

class TextArea : cocos2d::CCSprite {
    // https://www.youtube.com/watch?v=1LVW7IUyKMg
    TextArea() = mac 0x19fba0, ios 0x92c28, win 0x2f6d0;
    inline TextArea(TextArea const&) : m_fontFile() {}
    inline ~TextArea() {}
    virtual void draw() {}
    virtual void setOpacity(unsigned char) = mac 0x19f760, win 0x2ff00;
    bool init(gd::string str, char const* font, float width, float height, cocos2d::CCPoint anchor, float scale, bool disableColor) = mac 0x19ec70, ios 0x92444, win 0x2fa80;
    static TextArea* create(gd::string str, char const* font, float scale, float width, cocos2d::CCPoint anchor, float lineHeight, bool disableColor) = mac 0x19eb40, win 0x2f980;
    void colorAllCharactersTo(cocos2d::ccColor3B color) = win 0x2ff30;
    void setString(gd::string str) = mac 0x19eda0, win 0x2fb90;                 // 0x20c

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_133() = win 0x2f7d0;  // 2.0 slot (getMaxWidth, types unknown)
    virtual void setMaxWidth(float) = win 0x2f7e0;
    virtual void gd20_slot_135() = win 0x2f800;  // 2.0 slot (getMaxWidth, types unknown)
    virtual void setLineSpace(float) = win 0x2f810;
    virtual void gd20_slot_137() = win 0x2f830;  // 2.0 slot (getLineSpace, types unknown)
    virtual void setOnTimer(bool) = win 0x2f840;
    virtual void gd20_slot_139() = win 0x2f850;  // 2.0 slot (getAlign, types unknown)
    virtual void setAlign(cocos2d::CCPoint) = win 0x2f870;
    virtual void gd20_slot_141() = win 0x2f890;  // 2.0 slot (getFadeInFinished, types unknown)
    virtual void setFadeInFinished(bool) = win 0x2f8a0;
    virtual void gd20_slot_143() = win 0x2f8b0;  // 2.0 slot (getFontScale, types unknown)
    virtual void setFontScale(float) = win 0x2f8c0;
    virtual void gd20_slot_145() = win 0x10d90;  // 2.0 slot, name unknown
    virtual void gd20_slot_146() = win 0x2f8e0;  // 2.0 slot, name unknown
    virtual void gd20_slot_147() = win 0x2f8f0;  // 2.0 slot, name unknown
    virtual void gd20_slot_148() = win 0x2f900;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1b8 ----
    bool m_disableColor;  // 2.011 +0x1b8 (consistent evidence)
    PAD = win 0x3;
    MultilineBitmapFont* m_label;  // 2.011 +0x1bc (consistent evidence)
    float m_width;  // 2.011 +0x1c0 (consistent evidence)
    int m_unknown;  // 2.011 +0x1c4 (consistent evidence)
    gd::string m_fontFile;  // 2.011 +0x1c8 (consistent evidence)
    float m_height;  // 2.011 +0x1e0 (consistent evidence)
    PAD = win 0x28;
}

class TextInputDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void textChanged(CCTextInputNode*) {}
    virtual void textInputOpened(CCTextInputNode*) {}
    virtual void textInputClosed(CCTextInputNode*) {}
    virtual void textInputShouldOffset(CCTextInputNode*, float) {}
    virtual void textInputReturn(CCTextInputNode*) {}
    virtual bool allowTextInput(CCTextInputNode*) {return true;}
}

// GD 2.011 port: 2.1-only class, stub
class ToggleTriggerAction {
}

// GD 2.011 port: 2.1-only class, stub
class TopArtistsLayer {
}

// GD 2.011 port: 2.1-only class, stub
class TouchToggleAction {
}

// GD 2.011 port: 2.1-only class, stub
class TriggerEffectDelegate {
}

class UILayer : cocos2d::CCLayerColor, cocos2d::CCKeyboardDelegate {
    static UILayer* create() = mac 0x27fd10, win 0x1a4dc0;
    virtual bool init() = mac 0x27fe40, win 0x1a4e70;
    void disableMenu() = mac 0x280960;
    void enableMenu() = mac 0x280940;
    void pCommand(cocos2d::CCNode*) = mac 0x280830;
    inline void toggleCheckpointsMenu(bool toggled);  // GD 2.011 port: inline body needs m_checkPointMenu (no 2.0 offset)

    void onCheck(cocos2d::CCObject* sender) = mac 0x2803e0, win 0x1a5620;
    void onDeleteCheck(cocos2d::CCObject* sender) = mac 0x280410, win 0x1a5760;
    void onPause(cocos2d::CCObject* sender) = mac 0x2803c0, win 0x1a5590;
    virtual void keyDown(cocos2d::enumKeyCodes key) = mac 0x280470, win 0x1a5340;
    virtual void keyUp(cocos2d::enumKeyCodes key) = mac 0x280600, win 0x1a54d0;
    UILayer() = win 0x1a4cd0;
    ~UILayer() = mac 0x280c90, win 0x1a4cd0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_128() = win 0x1a4d80;  // 2.0 slot, name unknown

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x198 ----
    PAD = win 0x20;
}

class UndoObject : cocos2d::CCObject {
    ~UndoObject() = mac 0xa2fd0;
    static UndoObject* create(GameObject*, UndoCommand) = mac 0x94ea0, win 0xfcff0;
    static UndoObject* createWithArray(cocos2d::CCArray*, UndoCommand) = mac 0x96ee0, win 0xfd2b0;
    static UndoObject* createWithTransformObjects(cocos2d::CCArray* pObjects, UndoCommand nCommand);

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_9() = win 0x45e20;  // 2.0 slot, name unknown
    virtual void gd20_slot_10() = win 0x26660;  // 2.0 slot, name unknown
    virtual void gd20_slot_11() = win 0x26680;  // 2.0 slot, name unknown
    virtual void gd20_slot_12() = win 0xecd70;  // 2.0 slot (getIsLinked, types unknown)
    virtual void setIsLinked(bool) = win 0xecd80;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x18 ----
    GameObjectCopy* m_objectCopy;  // 2.011 +0x18 (same own size)
    UndoCommand m_command;  // 2.011 +0x1c (same own size)
    cocos2d::CCArray* m_objects;  // 2.011 +0x20 (same own size)
    bool m_redo;  // 2.011 +0x24 (same own size)
    PAD = win 0x3;
}

class UploadActionDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void uploadActionFinished(int, int) {}
    virtual void uploadActionFailed(int, int) {}
}

class UploadActionPopup : FLAlertLayer {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_144() = win 0x29620;  // 2.0 slot (getDelegate, types unknown)
    virtual void setDelegate(UploadPopupDelegate*) = win 0x29630;

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1c8 ----
    UploadPopupDelegate* m_popupDelegate;  // 2.011 +0x1c8 (same own size)
    TextArea* m_messageArea;  // 2.011 +0x1cc (same own size)
    LoadingCircle* m_loadingCircle;  // 2.011 +0x1d0 (same own size)
    CCMenuItemSpriteExtra* m_closeBtn;  // 2.011 +0x1d4 (same own size)
}

class UploadMessageDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void gd20_slot_0() = win 0x2ce50;  // 2.0 slot (uploadMessageFinished, types unknown)
    virtual void gd20_slot_1() = win 0x2ce50;  // 2.0 slot (uploadMessageFailed, types unknown)
}

class UploadPopupDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void onClosePopup() {}
}

class UserInfoDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void getUserInfoFinished(GJUserScore *) {}
    virtual void getUserInfoFailed(int) {}
    virtual void userInfoChanged(GJUserScore *) {}
}

class UserListDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void getUserListFinished(cocos2d::CCArray*, UserListType) {}
    virtual void getUserListFailed(UserListType, GJErrorCode) {}
    virtual void userListChanged(cocos2d::CCArray*, UserListType) {}
    virtual void forceReloadList(UserListType) {}
}

class VideoOptionsLayer : FLAlertLayer {
    VideoOptionsLayer* create() = win 0x158e90;
    bool init() = win 0x158f30;
    void onAdvanced(cocos2d::CCObject*) = win 0x159c70;
    void onFullscreen(cocos2d::CCObject*) = win 0x159c90;
    void onTextureQualityNext(cocos2d::CCObject*) = win 0x159cc0;
    void onTextureQualityPrev(cocos2d::CCObject*) = win 0x159cb0;
    void updateTextureQuality(int index) = win 0x159cd0;
    void onResolutionPrev(cocos2d::CCObject*) = win 0x159d70;
    void onResolutionNext(cocos2d::CCObject*) = win 0x159d80;
    void updateResolution(int index) = win 0x159d90;
    void toggleResolution() = win 0x159ec0;
    void onApply(cocos2d::CCObject*) = win 0x159fa0;

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----

    // ---- GD 2.011 member layout (fieldrebuild.py), base ends at +0x1c8 ----
    CCMenuItemSpriteExtra* m_prevResolution;  // 2.011 +0x1c8 (same own size)
    CCMenuItemSpriteExtra* m_nextResolution;  // 2.011 +0x1cc (same own size)
    cocos2d::CCLabelBMFont* m_resolutionLabel;  // 2.011 +0x1d0 (same own size)
    cocos2d::CCLabelBMFont* m_resolutionText;  // 2.011 +0x1d4 (same own size)
    cocos2d::CCLabelBMFont* m_qualityLabel;  // 2.011 +0x1d8 (same own size)
    cocos2d::TextureQuality m_quality;  // 2.011 +0x1dc (same own size)
    cocos2d::CCArray* m_resolutions;  // 2.011 +0x1e0 (same own size)
    bool m_isFullscreen;  // 2.011 +0x1e4 (same own size)
    PAD = win 0x3;
    int m_currentResolution;  // 2.011 +0x1e8 (same own size)
}

class LevelTools {
    static gd::string base64EncodeString(gd::string) = mac 0x294470, win 0x117a90;
    static gd::string base64DecodeString(gd::string) = mac 0x294510, win 0x117b30;
    static GJGameLevel* getLevel(int, bool) = mac 0x2908c0, win 0x1161c0;
    static bool verifyLevelIntegrity(gd::string, int) = mac 0x294360, win 0x117900;
    static float xPosForTime(float, cocos2d::CCArray*, int) = mac 0x293d90, win 0x117470;
    static float timeForXPos(float, cocos2d::CCArray*, int) = mac 0x293eb0, win 0x1175f0;
    static gd::string getAudioFileName(int) = mac 0x292840, win 0x116ad0;
    static gd::string getAudioTitle(int) = mac 0x2922f0, win 0x1168d0;
    static int artistForAudio(int) = mac 0x292d90, win 0x116cc0;
    static gd::string urlForAudio(int) = mac 0x292f10, win 0x116e30;
    static gd::string nameForArtist(int) = win 0x116d50;
    static gd::string ngURLForArtist(int) = win 0x117020;
    static gd::string ytURLForArtist(int) = win 0x117100;
    static gd::string fbURLForArtist(int) = win 0x1171c0;
    static gd::string getAudioString(int) = win 0x117280;
}
// clang-format on

// GD 2.011 port: protocols that 2.0 classes inherit (RTTI) but 2.1's bindings do not declare
class BoomScrollLayerDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void scrollLayerScrollingStarted(BoomScrollLayer*) {}
    virtual void scrollLayerScrolledToPage(BoomScrollLayer*, int) {}
    virtual void scrollLayerMoved(cocos2d::CCPoint) {}
}

class DynamicScrollDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    // one pure virtual in 2.0 (name not recovered); only the slot matters for the layout
    virtual void dynamicScrollDelegateSlot0() {}
}

class SpawnTriggerDelegate {

    // ---- GD 2.011 new virtuals, in vtable slot order (vtrebuild.py) ----
    virtual void spawnGroup(int) {}
}

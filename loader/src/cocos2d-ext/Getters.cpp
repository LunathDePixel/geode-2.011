#include <cocos2d.h>

using namespace cocos2d;

#pragma warning(push)
#pragma warning(disable : 4273)

CCKeyboardDispatcher* CCKeyboardDispatcher::get() {
    return CCDirector::get()->getKeyboardDispatcher();
}

CCTouchDispatcher* CCTouchDispatcher::get() {
    return CCDirector::sharedDirector()->getTouchDispatcher();
}

CCApplication* CCApplication::get() {
    return CCApplication::sharedApplication();
}

CCDirector* CCDirector::get() {
    return CCDirector::sharedDirector();
}

CCEGLView* CCEGLView::get() {
    return CCDirector::sharedDirector()->getOpenGLView();
}

CCFileUtils* CCFileUtils::get() {
    return CCFileUtils::sharedFileUtils();
}

CCSpriteFrameCache* CCSpriteFrameCache::get() {
    return CCSpriteFrameCache::sharedSpriteFrameCache();
}

CCTextureCache* CCTextureCache::get() {
    return CCTextureCache::sharedTextureCache();
}

CCScene* CCScene::get() {
    return CCDirector::get()->getRunningScene();
}

CCScheduler* CCScheduler::get() {
    return CCDirector::get()->getScheduler();
}

#pragma warning(pop)

#ifdef GEODE_IS_WINDOWS32
// GD 2.011 port: 2.0 keeps the tag in CCNode; v3 calls it on CCObject* (see CCObject.h)
int CCObject::getTag() const {
    if (auto node = dynamic_cast<CCNode const*>(this)) return const_cast<CCNode*>(node)->getTag();
    return -1;
}
void CCObject::setTag(int tag) {
    if (auto node = dynamic_cast<CCNode*>(this)) node->setTag(tag);
}
#endif

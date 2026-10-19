#include <cocos2d.h>
#include <Geode/utils/cocos.hpp>
#include <Geode/utils/ranges.hpp>
#include <Geode/loader/Log.hpp>
#include <Geode/binding/CCMenuItemSpriteExtra.hpp>
#include <Geode/binding/CCMenuItemToggler.hpp>

using namespace geode::prelude;

#pragma warning(disable: 4273)

void CCNode::swapChildIndices(CCNode* first, CCNode* second) {
    m_pChildren->exchangeObject(first, second);
    std::swap(first->m_nZOrder, second->m_nZOrder);
    std::swap(first->m_uOrderOfArrival, second->m_uOrderOfArrival);
}

// GD 2.011 port: GD 2.0 renumbers orderOfArrival from 0 when it sorts the children, so "arrival of
// the neighbour +/- 1" can underflow (an unsigned 0 - 1 sorted the child last). Make room by shifting
// the arrivals at or above the target instead, and also move the child in the array itself
static void placeChild(CCArray* children, CCNode* child, CCNode* target, bool after) {
    unsigned int slot = target->getOrderOfArrival() + (after ? 1 : 0);
    for (auto other : CCArrayExt<CCNode*>(children)) {
        if (other != child && other->getOrderOfArrival() >= slot) {
            other->setOrderOfArrival(other->getOrderOfArrival() + 1);
        }
    }
    child->setZOrder(target->getZOrder());
    child->setOrderOfArrival(slot);

    child->retain();
    children->removeObject(child, true);
    auto idx = children->indexOfObject(target) + (after ? 1 : 0);
    children->insertObject(child, idx);
    child->release();
}

void CCNode::insertBefore(CCNode* child, CCNode* before) {
    this->addChild(child);
    if (
        (before && m_pChildren->containsObject(before)) ||
        (before = static_cast<CCNode*>(m_pChildren->firstObject()))
    ) {
        if (before != child) placeChild(m_pChildren, child, before, false);
    }
}

void CCNode::insertAfter(CCNode* child, CCNode* after) {
    this->addChild(child);
    if (m_pChildren->containsObject(after) && after != child) {
        placeChild(m_pChildren, child, after, true);
    }
}

bool CCNode::hasAncestor(CCNode* ancestor) {
    if (!ancestor) {
        ancestor = CCScene::get();
    }
    if (m_pParent == ancestor) {
        return true;
    }
    if (m_pParent) {
        return m_pParent->hasAncestor(ancestor);
    }
    return false;
}

// these use setContentSize and getContentSize because they're virtuals and
// some node may override those for wacky behaviour

void CCNode::setScaledContentSize(CCSize const& size) {
    this->setContentSize({ size.width / m_fScaleX, size.height / m_fScaleY });
}

void CCNode::setContentWidth(float width) {
    this->setContentSize({ width, m_obContentSize.height });
}

void CCNode::setContentHeight(float height) {
    this->setContentSize({ m_obContentSize.width, height });
}

float CCNode::getContentWidth() const {
    return this->getContentSize().width;
}

float CCNode::getContentHeight() const {
    return this->getContentSize().height;
}

// getScaledContentSize is not const bruh

float CCNode::getScaledContentWidth() const {
    return this->getContentWidth() * m_fScaleX;
}

float CCNode::getScaledContentHeight() const {
    return this->getContentHeight() * m_fScaleY;
}

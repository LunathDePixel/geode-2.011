/*
 * Copyright (c) 2012 cocos2d-x.org
 * http://www.cocos2d-x.org
 *
 * Copyright 2012 Stewart Hamilton-Arrandale.
 * http://creativewax.co.uk
 *
 * Modified by Yannick Loriot.
 * http://yannickloriot.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * Converted to c++ / cocos2d-x by Angus C
 */

#ifndef __CCCONTROL_COLOUR_PICKER_H__
#define __CCCONTROL_COLOUR_PICKER_H__


#include "CCControl.h"
#include "CCControlUtils.h"
#include "CCControlHuePicker.h"
#include "CCControlSaturationBrightnessPicker.h"
#include "ColorPickerDelegate.h"

NS_CC_EXT_BEGIN

/**
 * @addtogroup GUI
 * @{
 * @addtogroup control_extension
 * @{
 */

class CC_DLL CCControlColourPicker : public CCControl
{
    GEODE_FRIEND_MODIFY

public:
    RT_ADD(
        // 2.0: own virtuals are, in order, getColorValue, setColorValue, getBackground,
        // get/setColorTarget, get/setDelegate (colourPicker / HuePicker accessors are not virtual)
        virtual ccColor3B const& getColorValue() const;
        virtual void setColorValue(ccColor3B const&);
    )

    GEODE_CUSTOM_CONSTRUCTOR_COCOS(CCControlColourPicker, CCControl)
    CCControlColourPicker();
    virtual ~CCControlColourPicker();

public:
    // @note RobTop Addition
    ccColor3B m_rgb;
    HSV m_hsv;
    CCControlSaturationBrightnessPicker* m_colourPicker;
    CCControlHuePicker* m_huePicker;
    CCSprite* m_background;
public:
    CCControlSaturationBrightnessPicker* getcolourPicker() const { return m_colourPicker; }
    void setcolourPicker(CCControlSaturationBrightnessPicker* v) {
        if (m_colourPicker != v) { CC_SAFE_RETAIN(v); CC_SAFE_RELEASE(m_colourPicker); m_colourPicker = v; }
    }
    CCControlHuePicker* getHuePicker() const { return m_huePicker; }
    void setHuePicker(CCControlHuePicker* v) {
        if (m_huePicker != v) { CC_SAFE_RETAIN(v); CC_SAFE_RELEASE(m_huePicker); m_huePicker = v; }
    }
    virtual CCSprite* getBackground() const { return m_background; }
    void setBackground(CCSprite* v) {
        if (m_background != v) { CC_SAFE_RETAIN(v); CC_SAFE_RELEASE(m_background); m_background = v; }
    }
protected:

    // @note RobTop Addition
    CC_SYNTHESIZE_NV(CCSprite*, m_colorTarget, ColorTarget)
    // @note RobTop Addition
    CC_SYNTHESIZE_NV(ColorPickerDelegate*, m_delegate, Delegate)


public:
    // @note RobTop Addition
    static CCControlColourPicker* colourPicker();
    inline static CCControlColourPicker* create() {
        return colourPicker();
    }

    virtual bool init();
    void hueSliderValueChanged(CCObject * sender, CCControlEvent controlEvent);
    void colourSliderValueChanged(CCObject * sender, CCControlEvent controlEvent);

protected:
    void updateControlPicker();
    void updateHueAndControlPicker();
    virtual bool ccTouchBegan(CCTouch* touch, CCEvent* pEvent);

};

// end of GUI group
/// @}
/// @}

NS_CC_EXT_END

#endif

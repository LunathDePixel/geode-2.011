#pragma once

#include <Geode/platform/platform.hpp>

#include "string.hpp"

#if defined(GEODE_IS_ANDROID)
#include "gnustl.hpp"
#elif defined(GEODE_IS_WINDOWS32)
// GD 2.011 port: VS2013-layout containers (unordered_map/set) for 32-bit 2.0
#include "msvcstl.hpp"
#else
#include "aliastl.hpp"
#endif

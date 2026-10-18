#pragma once

#include "msvc/allocator.hpp"
#include "msvc/umap.hpp"
#include "msvc/uset.hpp"

#include <map>
#include <vector>
#include <set>

// GD 2.011 port: gdstring.lib is a set of /alternatename directives (gd::string-signature names ->
// libcocos2d's std::string exports); force its object into every link so the linker reads them
#pragma comment(linker, "/include:_geode_gdstring_2011_anchor")

namespace gd {
    template <class T>
    using vector = std::vector<T>;

    template <class K, class V>
    using map = std::map<K, V>;

    template <class K, class V>
    using unordered_map = geode::stl::unordered_map<K, V, std::hash<K>, std::equal_to<K>, geode::stl::allocator<std::pair<const K, V>>>;

    template <class K>
    using set = std::set<K>;

    template <class K>
    using unordered_set = geode::stl::unordered_set<K, std::hash<K>, std::equal_to<K>, geode::stl::allocator<K>>;
}

if(NOT GEODE_DONT_BUILD_TEST_MODS)
    add_subdirectory(dependency)
    add_subdirectory(main)
    # GD 2.011 port: sample / jukebox / addrverify return once ported to the v2 API
endif()

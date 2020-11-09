# Set up some internal requirements for the Startup target.
#
# The creation of the Startup target and its linkage setup happens in 2 places:
# - in src/corelib/CMakeLists.txt when building qtbase.
# - at find_package(Qt6Core) time.
#
# See _qt_internal_setup_startup_target() in Qt6CoreMacros.cmake for the implementation of that.
function(qt_internal_setup_startup_target)
    set(dependent_target "Core")

    # On platforms that have a Qt entry-point, find_package(Qt6Core) should call
    # find_package(Qt6EntryPoint) so that we can link against EntryPoint.
    if(WIN32 OR CMAKE_SYSTEM_NAME STREQUAL "iOS")
        qt_record_extra_qt_package_dependency("${dependent_target}" EntryPoint "${PROJECT_VERSION}")
    endif()
endfunction()

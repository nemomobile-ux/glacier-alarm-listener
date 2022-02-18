cmake_minimum_required(VERSION 3.6.0)

project(glacier-alarm-listener
        VERSION 0.0.1
        DESCRIPTION "The Glacier alarm-listener")

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

include(FeatureSummary)
include(GNUInstallDirs)

set(QT_MIN_VERSION "5.11.0")
find_package(Qt5 COMPONENTS Gui Qml Quick LinguistTools REQUIRED)
find_package(Glacier 0.8 COMPONENTS App REQUIRED)
find_package(Qt5QuickCompiler)

add_subdirectory(src)

# Translations
file(GLOB TS_FILES translations/*.ts)
qt5_add_translation(QM_FILES ${TS_FILES})
add_custom_target(translations DEPENDS ${QM_FILES})
add_dependencies(glacier-alarm-listener translations)

install(FILES ${QM_FILES}
        DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/glacier-alarm-listener/translations)

install(FILES com.nokia.voland.service
        DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/dbus-1/services)

install(FILES glacier-alarm-listener.service
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/systemd/user/)

install(FILES voland.conf
        DESTINATION ${CMAKE_INSTALL_SYSCONFDIR}/dbus-1/system.d/)

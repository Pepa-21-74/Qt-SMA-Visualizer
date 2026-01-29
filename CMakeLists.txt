cmake_minimum_required(VERSION 3.16)

project(SMAA VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Gui Qml Quick Charts Widgets)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appSMAA
    main.cpp
)

qt_add_qml_module(appSMAA
    URI SMAA
    QML_FILES
        Main.qml
        SOURCES SMAgenerator.h
        SOURCES SMAgenerator.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appSMAA PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appSMAA
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appSMAA
    PRIVATE Qt6::Gui Qt6::Qml Qt6::Quick Qt6::Charts Qt6::Widgets
)

include(GNUInstallDirs)
install(TARGETS appSMAA
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

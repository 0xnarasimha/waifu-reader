cmake_minimum_required(VERSION 3.16)

project(WaifuReader VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appWaifuReader
    main.cpp
)

qt_add_qml_module(appWaifuReader
    URI WaifuReader
    VERSION 1.0
    QML_FILES
        Main.qml
        WaifuView.qml
        MangaReader.qml
)

target_link_libraries(appWaifuReader
    PRIVATE Qt6::Quick Qt6::QuickControls2
)

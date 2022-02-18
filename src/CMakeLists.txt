set(SRC
    main.cpp
)

qtquick_compiler_add_resources(RESOURCES qml/glacier-alarm-listener.qrc)

add_executable(glacier-alarm-listener ${SRC} ${RESOURCES})

target_link_libraries(glacier-alarm-listener
	Qt5::Gui
	Qt5::Qml
	Qt5::Quick
	Glacier::App)

install(TARGETS glacier-alarm-listener RUNTIME
	DESTINATION ${CMAKE_INSTALL_BINDIR})

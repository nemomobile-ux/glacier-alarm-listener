set(SRC
    main.cpp
)

qt_add_resources(RESOURCES qml/glacier-alarm-listener.qrc)

add_executable(glacier-alarm-listener ${SRC} ${RESOURCES})

target_link_libraries(glacier-alarm-listener
	Qt6::Gui
	Qt6::Qml
	Qt6::Quick
	Glacier::App)

install(TARGETS glacier-alarm-listener RUNTIME
	DESTINATION ${CMAKE_INSTALL_BINDIR})

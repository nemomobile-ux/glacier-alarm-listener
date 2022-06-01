import QtQuick 2.6

import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0

import Nemo.Alarms 1.0
import Nemo.Ngf 1.0
import "../components"


Page {

    id: mainPage

    property bool feedbackPlaying: app.visible && (countDialogsIfType(alarmHandler.activeDialogs, Alarm.Clock) > 0);

    headerTools: HeaderToolsLayout {
        id: tools
        title: qsTr("Alarm")

        tools: [
        ]
    }

    onFeedbackPlayingChanged: {
        if (feedbackPlaying) {
//            feedback.play();
        } else {
            feedback.stop();
        }
    }

    Text {
        visible: alarmHandler.activeDialogs.length === 0
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text:  qsTr("No alarm is active")
        font.pixelSize: Theme.fontSizeLarge
        color: Theme.textColor
    }


    ListView {
        anchors.fill: parent
        model: alarmHandler.activeDialogs.length

        delegate: Component {
            id: delegateComponent
            Loader {
                source: eventTypeToComponent(alarmHandler.activeDialogs[index].type)
                property var dialog: alarmHandler.activeDialogs[index]
                width: parent.width

            }
        }
    }

    function eventTypeToComponent(type) {
        switch (type) {
        case Alarm.Clock:
            return Qt.resolvedUrl("../components/ClockDelegate.qml")
        case Alarm.Calendar:
            return Qt.resolvedUrl("../components/CalendarDelegate.qml")
        case Alarm.Countdown:
            // FIXME
        case Alarm.Reminder:
            // FIXME
        default:
            return Qt.resolvedUrl("../components/GenericDialog.qml");
        }
    }

    NonGraphicalFeedback {
        id: feedback
        event: "clock"
    }

}

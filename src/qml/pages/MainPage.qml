import QtQuick 2.6

import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0

import Nemo.Alarms 1.0
import Nemo.Ngf 1.0
import "../components"


Page {

    id: mainPage

    property bool feedbackPlaying: app.visible && (alarmHandler.activeDialogs.length > 0);

    headerTools: HeaderToolsLayout {
        id: tools
        title: qsTr("Alarm")

        tools: [
        ]
    }

    onFeedbackPlayingChanged: {
        feedback.stop();
        if (feedback.event === "") {
            return;
        }
        if (feedbackPlaying) {
            feedback.play();
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
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: buttonRow.top
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


    Row {
        id: buttonRow
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        height: Theme.itemHeightLarge
        spacing: 1
        Button {
            width: parent.width/2
            height: parent.height
            primary: true
            text: qsTr("Dismiss All")
            onClicked: {
                while (alarmHandler.activeDialogs.length > 0) {
                    alarmHandler.activeDialogs[0].dismiss()
                }

            }
        }
        Button {
            width: parent.width/2
            height: parent.height
            text: qsTr("Snooze All")
            onClicked: {
                while (alarmHandler.activeDialogs.length > 0) {
                    alarmHandler.activeDialogs[0].snooze()
                }
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
            return Qt.resolvedUrl("../components/CountdownDelegate.qml")
        case Alarm.Reminder:
            return Qt.resolvedUrl("../components/ReminderDelegate.qml")
        default:
            return Qt.resolvedUrl("../components/GenericDialog.qml");
        }
    }

    function eventTypeToNGFEvent(type) {
        switch(type) {
        case Alarm.Clock:
            return "clock"
        case Alarm.Calendar:
            return "calendar"
        case Alarm.Countdown:
            return "clock"
        case Alarm.Reminder:
            return "calendar"
        default:
            return ""
        }
    }

    /**
      * defines priorities of events
      * alarmclock > calendar > other
      */

    function chooseEventToPlay(dialogs) {
        var max_event = Alarm.WakeUp

        for (var i = 0; i < dialogs.length; i++) {
            var current_type = dialogs[i].type
            switch (current_type) {
            case Alarm.Clock:
                max_event = current_type
                break;
            case Alarm.Calendar:
                if (max_event !== Alarm.Clock) {
                    max_event = current_type
                }
                break;
            case Alarm.Countdown:
                if (max_event !== Alarm.Clock) {
                    max_event = current_type
                }
                break;
            case Alarm.Reminder:
                if (max_event !== Alarm.Clock) {
                    max_event = current_type
                }
                break;
            default:
                break

            }
        }
        return max_event
    }

    NonGraphicalFeedback {
        id: feedback

        event: eventTypeToNGFEvent(chooseEventToPlay(alarmHandler.activeDialogs))
        onEventChanged: {
            console.log("event " + event)
        }
    }

}

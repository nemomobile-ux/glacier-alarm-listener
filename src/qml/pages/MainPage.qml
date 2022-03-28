import QtQuick 2.6

import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0

import Nemo.Alarms 1.0
import Nemo.Ngf 1.0


Page {

    id: mainPage

    property var dialog: (alarmHandler.activeDialogs.length > 0) ? alarmHandler.activeDialogs[0] : null
    property bool feedbackPlaying: app.visible && (dialog !== null);

    headerTools: HeaderToolsLayout {
        id: tools
        title: qsTr("Alarm")

        tools: [
        ]
    }

    onFeedbackPlayingChanged: {
        if (feedbackPlaying) {
            feedback.play();
        } else {
            feedback.stop();
        }
    }


    Text {
        width: parent.width !== undefined ? parent.width : 200;
        height: parent.height !== undefined ? parent.height - buttonRow.height : 200;
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        text: (dialog === null) ? qsTr("No alarm is active") : (
                                      dialog.title + "\n"
                                      + dialog.hour + ":" + dialog.minute + "\n"
//                                      + dialog.timeoutSnoozeCounter
                                      )
        font.pixelSize: Theme.fontSizeLarge
        color: Theme.textColor
    }

    Row {
        id: buttonRow
        width: parent.width
        height: Theme.itemHeightLarge
        anchors.bottom: parent.bottom;
        spacing: 1
        Button {
            width: parent.width/2
            height: parent.height
            primary: true
            text: qsTr("Dismiss")
            enabled: (dialog !== null) && !dialog.hideDismissButton
            onClicked: {
                console.log("dismiss alarm")
                dialog.dismiss()
                Qt.quit();
            }
        }
        Button {
            width: parent.width/2
            height: parent.height
            text: qsTr("Snooze")
            enabled: (dialog !== null) && !dialog.hideSnoozeButton
            onClicked: {
                console.log("snooze alarm")
                dialog.snooze()
                Qt.quit();

            }
        }

    }


    NonGraphicalFeedback {
        id: feedback
        event: "clock"
    }


}

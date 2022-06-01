import QtQuick 2.6

import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0

Column {
    width: parent.width
    Text {
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        text: dialog.title + "\n"
              + dialog.hour + ":" + ((dialog.minute < 10) ? "0" : "") + dialog.minute
        //                      + dialog.timeoutSnoozeCounter

        font.pixelSize: Theme.fontSizeLarge
        color: Theme.textColor
    }

    Row {
        id: buttonRow
        width: parent.width
        height: Theme.itemHeightLarge
        spacing: 1
        Button {
            width: parent.width/2
            height: parent.height
            primary: true
            text: qsTr("Dismiss")
            enabled: !dialog.hideDismissButton
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
                  + ((dialog.timeoutSnoozeCounter > 0) ? "("+dialog.timeoutSnoozeCounter+")" : "")
            enabled: !dialog.hideSnoozeButton
            onClicked: {
                console.log("snooze alarm")
                dialog.snooze()
                Qt.quit();

            }
        }
    }
}

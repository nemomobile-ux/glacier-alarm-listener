import QtQuick
import Nemo.Controls

//ListViewItemForEvent {
ListViewItemWithActions {
    label: dialog.title
    description: dialog.hour + ":" + ((dialog.minute < 10) ? "0" : "") + dialog.minute

//    enabled: !dialog.hideDismissButton
//    enabled: !dialog.hideSnoozeButton
//    subdescription: ((dialog.timeoutSnoozeCounter > 0) ? "("+dialog.timeoutSnoozeCounter+")" : "")

    icon: "image://theme/clock-o"
    onClicked:  {
        dialog.dismiss()
//        dialog.snooze()

    }
}

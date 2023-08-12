import QtQuick
import Nemo.Controls

//ListViewItemForEvent {
ListViewItemWithActions {
    label: dialog.title
    description: dialog.hour + ":" + ((dialog.minute < 10) ? "0" : "") + dialog.minute + ":" + (dialog.second < 10 ? "0" + dialog.second : dialog.second)
    icon: "image://theme/stopwatch"
    onClicked:  {
        dialog.dismiss()
    }
}

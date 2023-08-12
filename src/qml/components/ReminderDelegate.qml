import QtQuick
import Nemo.Controls

//ListViewItemForEvent {
ListViewItemWithActions {
    label: dialog.title
//    description: dialog.hour + ":" + ((dialog.minute < 10) ? "0" : "") + dialog.minute

    icon: "image://theme/calendar-check"
    onClicked:  {
        console.log(JSON.stringify(dialog, null, 2))
        dialog.dismiss()
    }
}

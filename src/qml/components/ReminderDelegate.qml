import QtQuick 2.6

import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0

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

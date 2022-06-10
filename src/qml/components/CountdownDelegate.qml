import QtQuick 2.6

import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0

//ListViewItemForEvent {
ListViewItemWithActions {
    label: dialog.title
    description: dialog.hour + ":" + ((dialog.minute < 10) ? "0" : "") + dialog.minute + ":" + (dialog.second < 10 ? "0" + dialog.second : dialog.second)
    icon: "image://theme/stopwatch"
    onClicked:  {
        dialog.dismiss()
    }
}

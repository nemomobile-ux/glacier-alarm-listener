import QtQuick
import Nemo.Controls

ListViewItemWithActions {
    icon: "image://theme/calendar"
    label: dialog.title
    description: dialog.startDate + " " + dialog.endDate
    onClicked: {
        console.log(dialog.calendarEventUid)
        dialog.dismiss()
    }
}

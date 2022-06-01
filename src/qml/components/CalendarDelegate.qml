import QtQuick 2.6

import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0

ListViewItemWithActions {
    icon: "image://theme/calendar"
    label: dialog.title
    description: dialog.startDate + " " + dialog.endDate
    onClicked: {
        console.log(dialog.calendarEventUid)
        dialog.dismiss()
    }
}

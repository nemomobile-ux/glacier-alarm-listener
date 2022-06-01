import QtQuick 2.6

import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0

ListViewItemWithActions {
    label: "Generic Event"
    description: JSON.stringify(dialog)
    iconVisible: false
    onClicked: {
        console.log(JSON.stringify(dialog))
        dialog.dismiss()
    }
}

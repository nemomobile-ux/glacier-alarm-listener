import QtQuick
import Nemo.Controls

ListViewItemWithActions {
    label: "Generic Event"
    description: JSON.stringify(dialog)
    iconVisible: false
    onClicked: {
        console.log(JSON.stringify(dialog, null, 2))
        dialog.dismiss()
    }
}

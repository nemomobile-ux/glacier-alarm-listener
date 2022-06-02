import QtQuick 2.6

import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0

Item {
    id: root
    width: parent ? parent.width : 0
    height: Theme.itemHeightLarge

    property alias icon: icon.source
    property alias label: labelItem.text
    property alias description: descriptionItem.text

    NemoIcon {
        id: icon
        color: Theme.textColor
    }

    Label {
        id: labelItem
        color: Theme.textColor
        anchors{
            left: parent.left
            right: parent.right
        }
        font.pixelSize: Theme.fontSizeMedium
        clip: true
    }

    Label {
        id: descriptionItem
        color: Theme.textColor
        anchors{
            left: parent.left
            right: parent.right
            top: labelItem.bottom
        }
        font.pixelSize: Theme.fontSizeTiny
        clip: true
        visible: description != ""
    }

}

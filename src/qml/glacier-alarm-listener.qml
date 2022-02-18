import QtQuick 2.6
import QtQuick.Window 2.1

import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0

import Nemo.Alarms 1.0

import "pages"
// import "components"

ApplicationWindow {
    id: app

    AlarmHandler {
        id: alarmHandler

        onActiveDialogsChanged: {
            console.log("ALARM!")
            console.log ( activeDialogs.length )
        }

        onError: {
            console.log("AlarmHandler error: ", message)
        }
    }

    initialPage: MainPage {

    }

}

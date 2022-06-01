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
        property var activeClockDialogs: []

        onActiveDialogsChanged: {
//            var wakeups = countDialogsIfType(activeDialogs, Alarm.WakeUp)
//            var non_wakeups = (activeDialogs.length - wakeups);
//            console.log("num of events" + non_wakeups)
//            if (non_wakeups <= 0) {
////                app.visible = false;
//            }
        }

        onError: {
            console.log("AlarmHandler error: ", message)
        }
    }

    function countDialogsIfType(dialogs, type) {
        var c = 0;
        for (var i = 0; i < dialogs.length; i++) {
            if (dialogs[i].type === type) {
                c = c + 1;
            }
        }
        return c;
    }



    initialPage: MainPage {

    }

}

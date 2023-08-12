import QtQuick
import QtQuick.Window

import Nemo.Controls
import Nemo.Alarms

import "pages"
// import "components"

ApplicationWindow {
    id: app

    AlarmHandler {
        id: alarmHandler
        property var activeClockDialogs: []

        onActiveDialogsChanged: {
            if (activeDialogs.length === 0) {
                console.log("All dialogs was dismissed or snozed")
                Qt.quit();
            }

            var wakeups = countDialogsIfType(activeDialogs, Alarm.WakeUp)
            var non_wakeups = (activeDialogs.length - wakeups);
            console.log("Number of non wakeup events: " + non_wakeups)
            if (non_wakeups <= 0) {

                console.log("Dismiss wakeUp events")
                while (activeDialogs.length > 0) {
                    activeDialogs[0].dismiss()
                }
            }
        }

        onError: {
            console.log("AlarmHandler error: " + message)
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

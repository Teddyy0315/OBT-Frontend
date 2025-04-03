import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    Button {
        text: "Toggle Pump 0"
        onClicked: pumpTestViewModel.togglePump(0)
    }

    // Optional: feedback
    Connections {
        target: pumpTestViewModel
        onPumpStateChanged: (newState) => {
            console.log("Pump is now", newState ? "ON" : "OFF")
        }
    }
}
// view/pages/Page1.qml
import QtQuick 6.5
import QtQuick.Controls
import QtQuick.Layouts

Item {
    property bool pumpActive: false
    property bool isToggling: false

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Column {
            anchors.centerIn: parent
            spacing: 12

            Button {
                text: pumpActive ? "Turn Off Pump" : "Turn On Pump"
                font.pixelSize: 18
                padding: 12
                enabled: !isToggling
                onClicked: {
                    isToggling = true

                    // Simulate async toggle
                    Qt.callLater(() => {
                        pumpActive = !pumpActive
                        isToggling = false
                    })
                }
            }

            Text {
                font.pixelSize: 16
                color: "#666"

                text: isToggling
                      ? (pumpActive ? "Turning off pump..." : "Turning on pump...")
                      : (pumpActive ? "Pump is active" : "Pump is inactive")
            }
        }
    }
}
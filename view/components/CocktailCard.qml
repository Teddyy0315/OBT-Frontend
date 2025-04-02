import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Components

Rectangle {
    id: root

    property string status: "active" // active, disabled, error
    property string recipeName: ""
    property string ingredients: ""
    property string mixers: ""

    width: 233
    height: 328
    radius: 8
    color: status === "disabled" ? "#F0F0F3" : "#ffffff"
    border.width: status === "error" ? 2 : 1
    border.color: status === "error" ? "#E5484D" : "#E8E8EC"

    Rectangle {
        width: 12
        height: 12
        radius: 999
        color: status === "error" ? "#E5484D"
              : status === "disabled" ? "#B0B0C0"
              : "#21C9AB"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 16
        anchors.rightMargin: 16
        z: 1
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12

        // Title and status
        ColumnLayout {
            spacing: 4
            Layout.fillWidth: true

            Text {
                text: recipeName
                font.pixelSize: 18
                font.weight: Font.Medium
                font.family: "Roboto"
                wrapMode: Text.Wrap
                width: 201
                color: status === "disabled" ? "#B9BBC6" : "#1C2024"
                Layout.fillWidth: true
            }

            Text {
                text: status === "error" ? "Refill needed" 
                        : status === "disabled" ? "Offline" : "Ready"
                font.pixelSize: 14
                font.weight: Font.Medium
                font.family: "Roboto"
                color: status === "error" ? "#E5484D"
                       : status === "disabled" ? "#B9BBC6"
                       : "#21C9AB"
                Layout.fillWidth: true
            }
        }

        // Ingredients section
        ColumnLayout {
            spacing: 8
            Layout.fillWidth: true

            Text {
                text: "Machine Ingredients"
                font.pixelSize: 14
                font.weight: Font.Bold
                font.family: "Roboto"
                color: status === "disabled" ? "#B9BBC6" : "#4A5568"
                Layout.fillWidth: true
            }

            Text {
                text: ingredients
                font.pixelSize: 14
                font.family: "Roboto"
                wrapMode: Text.Wrap
                width: 201
                color: status === "disabled" ? "#B9BBC6" : "#1A202C"
                Layout.fillWidth: true
            }

            Text {
                text: "Mixers"
                font.pixelSize: 14
                font.weight: Font.Bold
                font.family: "Roboto"
                color: status === "disabled" ? "#B9BBC6" : "#4A5568"
                Layout.fillWidth: true
            }

            Text {
                text: mixers
                font.pixelSize: 14
                font.family: "Roboto"
                wrapMode: Text.Wrap
                width: 201
                color: status === "disabled" ? "#B9BBC6" : "#1A202C"
                Layout.fillWidth: true
            }
        }

        // Spacer
        Item {
            Layout.fillHeight: true
        }

        // Buttons
        ColumnLayout {
            spacing: 8
            Layout.fillWidth: true

            PrimaryButton {
                text: "Add custom"
                backgroundColor: (status === "disabled" || status === "error")
                                 ? "#E0E0E0" : "#E2E2E8"
                textColor: (status === "disabled" || status === "error")
                           ? "#A0A0B0" : "#60646C"
                Layout.fillWidth: true
                height: 32
            }

            PrimaryButton {
                text: "Add"
                backgroundColor: (status === "disabled" || status === "error")
                                 ? "#E0E0E0" : "#E2E2E8"
                textColor: (status === "disabled" || status === "error")
                           ? "#A0A0B0" : "#60646C"
                Layout.fillWidth: true
                height: 32
            }
        }
    }
}
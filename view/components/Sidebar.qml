import QtQuick 6.5
import QtQuick.Controls
import "."

Rectangle {
    id: root
    width: 250
    height: parent?.height || 720
    color: "#F0F0F3"
    border.color: "#D9D9E0"
    border.width: 1

    signal pageSelected(string pageName)
    property string currentPage: "Page1"

    Column {
        anchors.fill: parent
        spacing: 16

        // 🔝 Logo Header
        Frame {
            width: parent.width
            height: 72
            padding: 16
            background: Rectangle {
                color: "transparent"
                border.color: "transparent"
            }

            Row {
                spacing: 8
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter

                Rectangle {
                    width: 56
                    height: 56
                    color: "#E0E1E6"
                    radius: 12

                    Image {
                        anchors.centerIn: parent
                        source: "../assets/pfp-placeholder.svg"
                        width: 32
                        height: 32
                        fillMode: Image.PreserveAspectFit
                    }
                }

                Column {
                    spacing: 2
                    anchors.verticalCenter: parent.verticalCenter

                    Text {
                        text: "Odense Bartech"
                        font.pixelSize: 16
                        font.bold: true
                        color: "#1A202C"
                    }

                    Text {
                        text: "Odense"
                        font.pixelSize: 14
                        color: "#4A5568"
                    }
                }
            }
        }

        // 📄 Menu Section
        Frame {
            width: parent.width
            background: Rectangle {
                color: "transparent"
                border.color: "transparent"
            }
            padding: 0

            Column {
                width: parent.width
                spacing: 8
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 16
                anchors.rightMargin: 16

                SidebarTab {
                    text: "Page1"
                    active: root.currentPage === "Page1"
                    onClicked: {
                        root.currentPage = "Page1"
                        root.pageSelected("Page1")
                    }
                }

                SidebarTab {
                    text: "Page2"
                    active: root.currentPage === "Page2"
                    onClicked: {
                        root.currentPage = "Page2"
                        root.pageSelected("Page2")
                    }
                }
            }
        }
    }
}
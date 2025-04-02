import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "."

Rectangle {
    id: root
    width: 250
    height: 640
    color: "#F0F0F3"
    border.color: "#D9D9E0"
    border.width: 1

    signal pageSelected(string pageName)
    signal logoutRequested()
    property string currentPage: "Page1"

    ColumnLayout {
        anchors.fill: parent
        spacing: 16

        // 🔝 Logo Header
        Frame {
            Layout.fillWidth: true
            Layout.preferredHeight: 72
            padding: 16
            background: Rectangle { color: "transparent"; border.color: "transparent" }

            RowLayout {
                spacing: 8
                anchors.fill: parent

                Rectangle {
                    width: 56
                    height: 56
                    color: "#E0E1E6"
                    radius: 12
                    Layout.alignment: Qt.AlignVCenter

                    Image {
                        anchors.centerIn: parent
                        source: "../assets/pfp-placeholder.svg"
                        width: 32
                        height: 32
                        fillMode: Image.PreserveAspectFit
                    }
                }

                ColumnLayout {
                    spacing: 2
                    Layout.alignment: Qt.AlignVCenter

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

        // 📄 Menu Tabs
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 8
            Layout.leftMargin: 16
            Layout.rightMargin: 16

            SidebarTab {
                text: "Create Order"
                active: root.currentPage === "Page1"
                Layout.fillWidth: true
                onClicked: {
                    root.currentPage = "Page1"
                    root.pageSelected("Page1")
                }
            }

            SidebarTab {
                text: "Machine Info"
                active: root.currentPage === "Page2"
                Layout.fillWidth: true
                onClicked: {
                    root.currentPage = "Page2"
                    root.pageSelected("Page2")
                }
            }

            SidebarTab {
                text: "Containers"
                active: root.currentPage === "Page3"
                Layout.fillWidth: true
                onClicked: {
                    root.currentPage = "Page3"
                    root.pageSelected("Page3")
                }
            }

            SidebarTab {
                text: "Test Hardware"
                active: root.currentPage === "Page4"
                Layout.fillWidth: true
                onClicked: {
                    root.currentPage = "Page4"
                    root.pageSelected("Page4")
                }
            }
        }

        // Push logout to bottom
        Item {
            Layout.fillHeight: true
        }

        // 🔻 Logout
        Frame {
            Layout.fillWidth: true
            Layout.preferredHeight: 72
            padding: 16
            background: Rectangle {
                color: "transparent"
                border.color: "transparent"
            }

            PrimaryButton {
                text: "Logout"
                backgroundColor: "#E2E2E8"
                textColor: "#60646C"
                width: parent.width
                onClicked: root.logoutRequested()
            }
        }
    }
}
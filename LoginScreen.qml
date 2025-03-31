import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    width: 1280
    height: 720
    color: "#F7FAF9"

    // Top bar
    Rectangle {
        width: parent.width
        height: 80
        color: "#20C4A6"

        RowLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 16

            Image {
                source: "assets/logo1.svg"
                width: 140
                height: 48
                fillMode: Image.PreserveAspectFit
            }

            Item { Layout.fillWidth: true }

            Image {
                source: "assets/logo2.svg"
                width: 140
                height: 48
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    // Login Card
    Rectangle {
        width: 400
        height: 360
        radius: 12
        color: "white"
        anchors.centerIn: parent
        border.color: "#E2E8F0"
        border.width: 1

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 32
            spacing: 20

            Text {
                text: "Log ind"
                font.pixelSize: 22
                font.bold: true
                color: "#2D3748"
                Layout.alignment: Qt.AlignHCenter
            }

            ColumnLayout {
                spacing: 8
                Layout.fillWidth: true

                Text {
                    text: "Brugernavn"
                    font.pixelSize: 14
                    color: "#4A5568"
                }

                Rectangle {
                    height: 40
                    width: 350
                    radius: 6
                    color: "#EDF2F7"
                    border.color: "#CBD5E0"

                    TextField {
                        anchors.fill: parent
                        anchors.margins: 8
                        font.pixelSize: 14
                        color: "#2D3748"
                        placeholderText: "Indtast brugernavn"
                        placeholderTextColor: "#A0AEC0"
                        background: null
                    }
                }
            }

            ColumnLayout {
                spacing: 8
                Layout.fillWidth: true

                Text {
                    text: "Adgangskode"
                    font.pixelSize: 14
                    color: "#4A5568"
                }

                Rectangle {
                    height: 40
                    width: 350
                    radius: 6
                    color: "#EDF2F7"
                    border.color: "#CBD5E0"

                    TextField {
                        anchors.fill: parent
                        anchors.margins: 8
                        font.pixelSize: 14
                        color: "#2D3748"
                        placeholderText: "Indtast adgangskode"
                        placeholderTextColor: "#A0AEC0"
                        echoMode: TextInput.Password
                        background: null
                    }
                }
            }

            Rectangle {
                width: 350
                height: 40
                radius: 6
                color: "#498E6C"

                Text {
                    text: "Log ind"
                    anchors.centerIn: parent
                    color: "white"
                    font.pixelSize: 16
                    font.bold: true
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        console.log("Login clicked")
                    }
                }
            }
        }
    }
}
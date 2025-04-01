// views/screens/LoginScreen.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Components 1.0

Rectangle {
    width: 1280
    height: 720
    color: "#F7FAF9"

    property var viewModel
    signal loginSuccessful()

    Connections {
        target: viewModel
        function onLoginSuccess() {
            loginSuccessful()
        }
    }

    // Navbar
    Rectangle {
        id: navbar
        width: parent.width
        height: 80
        color: "#20C4A6"

        RowLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 16

            Image {
                source: "../assets/logo1.svg"
                width: 140
                height: 48
                fillMode: Image.PreserveAspectFit
            }

            Item { Layout.fillWidth: true }

            Image {
                source: "../assets/logo2.svg"
                width: 140
                height: 48
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    // Content area
    Item {
        id: contentArea
        anchors.top: navbar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        Rectangle {
            id: loginCard
            width: 398
            height: 340
            radius: 4
            color: "white"
            border.color: "#E2E8F0"
            border.width: 1
            anchors.centerIn: parent

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 24
                spacing: 48

                Text {
                    font.family: "Roboto"
                    font.weight: Font.Medium
                    text: "Enter ID to continue"
                    font.pixelSize: 28
                    color: "#000"
                    Layout.alignment: Qt.AlignHCenter
                }

                ColumnLayout {
                    spacing: 24
                    width: parent.width
                    Layout.alignment: Qt.AlignHCenter

                    LinedTextField {
                        id: userField
                        placeholderText: "Enter username"
                        text: viewModel.username
                        onTextChanged: viewModel.username = text
                    }

                    LinedTextField {
                        id: passwordField
                        placeholderText: "Enter password"
                        echoMode: TextInput.Password
                        text: viewModel.password
                        onTextChanged: viewModel.password = text
                    }

                    PrimaryButton {
                        text: "Continue"
                        onClicked: viewModel.login()
                    }

                    Text {
                        text: viewModel.errorMessage
                        color: "red"
                        font.pixelSize: 14
                        visible: viewModel.errorMessage !== ""
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }
        }
    }
}
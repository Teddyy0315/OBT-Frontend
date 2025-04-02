import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "../components"

Item {
    id: root
    width: 1280
    height: 720

    property var viewModel
    signal loginSuccess  // Exposed for main.qml to connect to

    Connections {
        target: viewModel
        function onLoginSuccess() {
            root.loginSuccess()  // Relay Python signal to main.qml
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Navbar {
            Layout.fillWidth: true
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

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
                            placeholderText: "Enter username"
                            text: viewModel ? viewModel.username : ""
                            onTextChanged: if (viewModel) viewModel.username = text
                        }

                        LinedTextField {
                            placeholderText: "Enter password"
                            echoMode: TextInput.Password
                            text: viewModel ? viewModel.password : ""
                            onTextChanged: if (viewModel) viewModel.password = text
                        }

                        PrimaryButton {
                            text: "Continue"
                            onClicked: if (viewModel) viewModel.login()
                        }

                        Text {
                            text: viewModel ? viewModel.errorMessage : ""
                            color: "red"
                            font.pixelSize: 14
                            visible: viewModel && viewModel.errorMessage !== ""
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }
                }
            }
        }
    }
}
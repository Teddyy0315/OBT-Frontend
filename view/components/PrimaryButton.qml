// view/components/PrimaryButton.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: buttonWrapper
    width: 350
    height: 40
    radius: 6
    color: "#21C9AB"

    signal clicked()

    Text {
        text: buttonWrapper.text
        anchors.centerIn: parent
        color: "white"
        font.pixelSize: 16
        font.bold: true
        font.family: "Roboto"
    }

    property string text: "Button"

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: buttonWrapper.clicked()
    }
}
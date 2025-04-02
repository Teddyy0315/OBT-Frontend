// view/components/PrimaryButton.qml
import QtQuick
import QtQuick.Controls

Rectangle {
    id: buttonWrapper
    width: 350
    height: 40
    radius: 6
    color: backgroundColor

    signal clicked()

    property string text: "Button"
    property color backgroundColor: "#21C9AB"
    property color textColor: "white"

    Text {
        text: buttonWrapper.text
        anchors.centerIn: parent
        color: textColor
        font.pixelSize: 16
        font.bold: true
        font.family: "Roboto"
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: buttonWrapper.clicked()
    }
}
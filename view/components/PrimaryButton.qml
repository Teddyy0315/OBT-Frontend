// view/components/PrimaryButton.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

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
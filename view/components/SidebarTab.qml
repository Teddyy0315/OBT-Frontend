import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: tab
    width: parent.width
    height: 40
    radius: 4
    color: active ? "#C5EDE1" : "transparent"
    border.color: "transparent"
    border.width: 1

    property alias text: label.text
    property bool active: false
    signal clicked()

    MouseArea {
        anchors.fill: parent
        onClicked: tab.clicked()
    }

    Text {
        id: label
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.right: parent.right
        anchors.rightMargin: 12
        elide: Text.ElideRight
        color: active ? "#1E1E1E" : "#1E1E1E"
        font.pixelSize: 16
        font.family: "Roboto"
    }
}
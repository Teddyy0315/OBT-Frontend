import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: fieldWrapper
    width: 350
    height: 40
    radius: 6
    color: "transparent"
    border.color: "#CBD5E0"
    border.width: 1

    property alias text: textField.text
    property alias placeholderText: textField.placeholderText
    property alias echoMode: textField.echoMode

    TextField {
        id: textField
        anchors.fill: parent
        anchors.margins: 6  // Tweak for best vertical alignment

        font.pixelSize: 14
        font.family: "Roboto"  // Use system-safe font
        verticalAlignment: Text.AlignVCenter

        color: "#2D3748"
        placeholderTextColor: "#80838D"

        background: Rectangle {
            color: "transparent"
        }
    }
}
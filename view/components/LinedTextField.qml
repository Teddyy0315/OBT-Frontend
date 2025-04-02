// view/components/LinedTextField.qml
import QtQuick
import QtQuick.Controls

Rectangle {
    id: fieldWrapper
    width: 350
    height: 40
    radius: 6
    color: "transparent"
    border.color: "#CBD5E0"

    property alias text: textField.text
    property alias placeholderText: textField.placeholderText
    property alias echoMode: textField.echoMode

    TextField {
        id: textField
        anchors.fill: parent
        anchors.margins: 8
        font.pixelSize: 14
        font.family: "Roboto"
        font.weight: Font.Normal
        color: "#2D3748"
        placeholderTextColor: "#80838D"
        background: null
    }
}
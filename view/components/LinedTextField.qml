// view/components/LinedTextField.qml
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
// view/components/PrimaryButton.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
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

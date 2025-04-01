import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

import Components 1.0
import "screens"

Window {
    width: 1280
    height: 720
    visible: true
    title: "OBT Machine Client"

    Loader {
        id: pageLoader
        anchors.fill: parent
        source: "screens/LoginScreen.qml"
    }

    Component.onCompleted: {
        console.log("App loaded")
    }

    Connections {
        target: pageLoader.item
        function onLoginSuccessful() {
            pageLoader.source = "screens/Dashboard.qml";
        }
    }
}
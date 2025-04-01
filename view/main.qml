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
    color: "#F9F9FB"

    Loader {
        id: pageLoader
        anchors.fill: parent
        source: "screens/LoginScreen.qml"
        onLoaded: {
            pageLoader.item.viewModel = loginScreenViewModel;
        }
    }
    
    Component.onCompleted: {
        console.log("App loaded")
    }

    Connections {
        target: pageLoader.item
        function onLoginSuccessful() {
            pageLoader.source = "screens/Dashboard.qml"
            pageLoader.item.viewModel = dashboardScreenViewModel;
    }
}}
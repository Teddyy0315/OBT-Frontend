import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

import "components"
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
            if (pageLoader.item && pageLoader.item.hasOwnProperty("viewModel")) {
                pageLoader.item.viewModel = loginScreenViewModel
            }
        }

        onSourceChanged: {
            Qt.callLater(function() {
                if (pageLoader.item &&
                    pageLoader.item.hasOwnProperty("viewModel") &&
                    pageLoader.source.toString().indexOf("Dashboard") !== -1) {
                    pageLoader.item.viewModel = dashboardScreenViewModel
                }
            })
        }
    }

    Connections {
        target: pageLoader.item
        function onLoginSuccess() {
            pageLoader.source = "screens/Dashboard.qml"
        }
    }

    Component.onCompleted: {
        console.log("App loaded")
    }
}
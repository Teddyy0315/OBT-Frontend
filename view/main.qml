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

            Qt.callLater(function() {
                if (pageLoader.item && pageLoader.item.loginSuccess) {
                    console.log("✅ Connecting loginSuccess...")
                    pageLoader.item.loginSuccess.connect(function() {
                        console.log("✅ loginSuccess received — switching to Dashboard")
                        pageLoader.source = "screens/Dashboard.qml"
                    })
                }
            })
        }

        onSourceChanged: {
            Qt.callLater(function() {
                if (pageLoader.item &&
                    pageLoader.source.toString().indexOf("Dashboard") !== -1 &&
                    pageLoader.item.hasOwnProperty("viewModel")) {
                    pageLoader.item.viewModel = dashboardScreenViewModel
                }
            })
        }
    }

    Component.onCompleted: {
        console.log("App loaded")
    }
}
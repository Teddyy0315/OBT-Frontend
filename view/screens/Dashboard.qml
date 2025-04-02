import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "../components"

ColumnLayout {
    anchors.fill: parent
    spacing: 0

    property var viewModel

    Navbar {
        Layout.fillWidth: true
    }

    RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 0

        Sidebar {
            width: 250
            onPageSelected: function(pageName) {
                if (viewModel) {
                    viewModel.loadPage(pageName)
                }
            }
        }

        Loader {
            id: outlet
            Layout.fillWidth: true
            Layout.fillHeight: true
            source: viewModel && viewModel.currentPageComponent !== "" ? viewModel.currentPageComponent : ""
        }
    }
}
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Components

ColumnLayout {
    anchors.fill: parent
    spacing: 0

    Navbar {
        Layout.fillWidth: true
    }

    RowLayout {
        spacing: 0

        Layout.fillWidth: true
        Layout.fillHeight: true

        Sidebar {
            width: 250
            onPageSelected: (pageName) => viewModel.loadPage(pageName)
        }

        Loader {
            id: outlet
            Layout.fillWidth: true
            Layout.fillHeight: true
            source: viewModel?.currentPageComponent || ""
        }
    }

    property var viewModel
}
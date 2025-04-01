import QtQuick 6.5
import QtQuick.Controls
import QtQuick.Layouts

import Components 1.0

ColumnLayout {
    anchors.fill: parent
    spacing: 0

    Navbar {
        Layout.fillWidth: true
        height: 80
    }

    RowLayout {
        spacing: 0

        Layout.fillWidth: true
        Layout.fillHeight: true

        Sidebar {
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
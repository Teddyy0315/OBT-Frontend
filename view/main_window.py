# view/main_window.py

from PySide6.QtWidgets import QWidget, QVBoxLayout, QHBoxLayout
from PySide6.QtCore import Qt
from view.components.navbar import NavBar

class MainWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setObjectName("MainWindow")
        self.setAttribute(Qt.WA_StyledBackground, True)

        # Root layout
        root_layout = QVBoxLayout(self)
        root_layout.setContentsMargins(0, 0, 0, 0)
        root_layout.setSpacing(0)

        # NavBar
        self.navbar = NavBar()
        root_layout.addWidget(self.navbar)

        # Body layout
        self.body_layout = QHBoxLayout()
        self.body_layout.setContentsMargins(0, 0, 0, 0)
        self.body_layout.setSpacing(0)

        # Outlets
        self.left_outlet = QWidget()
        self.right_panel = QWidget()

        self.body_layout.addWidget(self.left_outlet)
        self.body_layout.addWidget(self.right_panel)

        root_layout.addLayout(self.body_layout)

    def set_left_widget(self, widget):
        self.body_layout.replaceWidget(self.left_outlet, widget)
        self.left_outlet.deleteLater()
        self.left_outlet = widget

    def set_right_widget(self, widget):
        self.body_layout.replaceWidget(self.right_panel, widget)
        self.right_panel.deleteLater()
        self.right_panel = widget
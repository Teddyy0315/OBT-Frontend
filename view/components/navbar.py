from PySide6.QtWidgets import QWidget, QHBoxLayout, QLabel, QSpacerItem, QSizePolicy
from PySide6.QtSvgWidgets import QSvgWidget
from PySide6.QtCore import Qt
import os

ASSETS_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), "../../assets"))

class NavBar(QWidget):
    def __init__(self):
        super().__init__()
        self.setObjectName("NavBar")
        self.setFixedHeight(80)
        self.setAttribute(Qt.WA_StyledBackground, True)

        layout = QHBoxLayout()
        layout.setContentsMargins(48, 8, 48, 8)
        layout.setSpacing(24)

        # --- Left side: logos ---
        logo1 = QSvgWidget(os.path.join(ASSETS_PATH, "logo1.svg"))
        logo1.setObjectName("Logo1")
        logo1.setFixedSize(266, 24)

        logo2 = QSvgWidget(os.path.join(ASSETS_PATH, "logo2.svg"))
        logo2.setObjectName("Logo2")
        logo2.setFixedSize(137, 30)

        layout.addWidget(logo1)

        # --- Spacer in the middle ---
        spacer = QWidget()
        spacer.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Preferred)
        layout.addWidget(spacer)
        layout.addWidget(logo2)


        self.setLayout(layout)
from PySide6.QtWidgets import QLineEdit

class Input(QLineEdit):
    def __init__(self, placeholder: str = ""):
        super().__init__()
        self.setObjectName("AppInput")
        self.setPlaceholderText(placeholder)
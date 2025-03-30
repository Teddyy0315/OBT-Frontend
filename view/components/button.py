from PySide6.QtWidgets import QPushButton

class Button(QPushButton):
    def __init__(self, text: str, on_click=None):
        super().__init__(text)
        self.setObjectName("AppButton")

        if on_click:
            self.clicked.connect(on_click)
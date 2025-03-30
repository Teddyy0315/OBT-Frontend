# view/components/login_form.py

from PySide6.QtWidgets import QWidget, QVBoxLayout, QLabel
from view.components.input import Input
from view.components.button import Button

class LoginForm(QWidget):
    def __init__(self, on_login):
        super().__init__()
        self.setObjectName("LoginForm")
        self.setFixedWidth(398)

        layout = QVBoxLayout(self)
        layout.setContentsMargins(24, 24, 24, 24)
        layout.setSpacing(48)

        title = QLabel("Enter ID to continue")
        title.setObjectName("LoginTitle")

        self.username_input = Input("Enter ID")
        self.login_btn = Button("Login", on_click=self.submit)

        layout.addWidget(title)
        layout.addWidget(self.username_input)
        layout.addWidget(self.login_btn)

        self.on_login = on_login

    def submit(self):
        self.on_login(self.username_input.text(), None)
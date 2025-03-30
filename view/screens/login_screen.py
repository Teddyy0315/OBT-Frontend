from PySide6.QtWidgets import QWidget, QVBoxLayout, QLabel, QMessageBox
from viewmodel.screens.login_screen_viewmodel import LoginScreenViewModel
from view.components.navbar import NavBar
from view.components.input import Input
from view.components.button import Button

class LoginScreen(QWidget):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Login")
        self.setObjectName("Screen")
        self.vm = LoginScreenViewModel()

        # --- Main layout with NavBar ---
        main_layout = QVBoxLayout()
        main_layout.addWidget(NavBar())
        main_layout.setContentsMargins(0, 0, 0, 0)

        # --- Login form layout ---
        form_layout = QVBoxLayout()
        form_layout.addWidget(QLabel("Login to System"))

        self.username_input = Input("Username")
        form_layout.addWidget(self.username_input)

        self.password_input = Input("Password")
        self.password_input.setEchoMode(Input.Password)
        form_layout.addWidget(self.password_input)

        login_button = Button("Login", on_click=self.on_login_clicked)
        form_layout.addWidget(login_button)

        # Wrap the form in a container widget
        form_container = QWidget()
        form_container.setLayout(form_layout)
        main_layout.addWidget(form_container)

        self.setLayout(main_layout)

        # --- Connect signals ---
        self.vm.login_success.connect(self.show_success)
        self.vm.login_failed.connect(self.show_error)

    def on_login_clicked(self):
        username = self.username_input.text()
        password = self.password_input.text()
        self.vm.login(username, password)

    def show_success(self):
        QMessageBox.information(self, "Success", "Login successful!")

    def show_error(self, message):
        QMessageBox.critical(self, "Error", message)
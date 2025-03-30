from PySide6.QtCore import QObject, Signal

class LoginScreenViewModel(QObject):
    login_success = Signal()
    login_failed = Signal(str)

    def __init__(self):
        super().__init__()

    def login(self, username: str, password: str):
        # Temporary hardcoded auth
        if username == "admin" and password == "1234":
            self.login_success.emit()
        else:
            self.login_failed.emit("Invalid username or password.")
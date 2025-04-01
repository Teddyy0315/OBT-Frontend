# viewmodel/login_viewmodel.py
from PySide6.QtCore import QObject, Slot, Property, Signal

class LoginScreenViewModel(QObject):
    loginSuccess = Signal()

    def __init__(self, api_service):
        super().__init__()
        self._username = ""
        self._password = ""
        self._errorMessage = ""
        self.api_service = api_service

    usernameChanged = Signal()
    passwordChanged = Signal()
    errorMessageChanged = Signal()

    def getUsername(self): return self._username
    def setUsername(self, value):
        if self._username != value:
            self._username = value
            self.usernameChanged.emit()
    
    username = Property(str, getUsername, setUsername, notify=usernameChanged)

    def getPassword(self): return self._password
    def setPassword(self, value):
        if self._password != value:
            self._password = value
            self.passwordChanged.emit()
    password = Property(str, getPassword, setPassword, notify=passwordChanged)

    def getErrorMessage(self): return self._errorMessage
    def setErrorMessage(self, value):
        if self._errorMessage != value:
            self._errorMessage = value
            self.errorMessageChanged.emit()
    errorMessage = Property(str, getErrorMessage, setErrorMessage, notify=errorMessageChanged)

    @Slot()
    def login(self):
        success, error = self.api_service.login(self._username, self._password)
        if success:
            print("Login successful!")  # You could trigger navigation here
            self.loginSuccess.emit()
        else:
            self.errorMessage = error
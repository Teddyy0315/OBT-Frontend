from PySide6.QtCore import QObject, Signal, Property, Slot

class LoginScreenViewModel(QObject):
    loginSuccess = Signal()
    usernameChanged = Signal()
    passwordChanged = Signal()
    errorMessageChanged = Signal()

    def __init__(self, api_service):
        super().__init__()
        self.api_service = api_service
        self._username = ""
        self._password = ""
        self._errorMessage = ""

    @Slot()
    def login(self):
        success, error = self.api_service.login(self._username, self._password)
        if success:
            print("Login successful!")
            self.loginSuccess.emit()
        else:
            self._setErrorMessage(error)

    def _setErrorMessage(self, message):
        if self._errorMessage != message:
            self._errorMessage = message
            self.errorMessageChanged.emit()

    def getUsername(self): return self._username
    def setUsername(self, value):
        if self._username != value:
            self._username = value
            self.usernameChanged.emit()

    def getPassword(self): return self._password
    def setPassword(self, value):
        if self._password != value:
            self._password = value
            self.passwordChanged.emit()

    def getErrorMessage(self): return self._errorMessage

    username = Property(str, getUsername, setUsername, notify=usernameChanged)
    password = Property(str, getPassword, setPassword, notify=passwordChanged)
    errorMessage = Property(str, getErrorMessage, notify=errorMessageChanged)
from PyQt5.QtCore import QObject, pyqtSignal, pyqtProperty, pyqtSlot

class LoginScreenViewModel(QObject):
    loginSuccess = pyqtSignal()
    usernameChanged = pyqtSignal()
    passwordChanged = pyqtSignal()
    errorMessageChanged = pyqtSignal()

    def __init__(self, api_service):
        super().__init__()
        self.api_service = api_service
        self._username = ""
        self._password = ""
        self._errorMessage = ""

    @pyqtSlot()
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

    username = pyqtProperty(str, fget=getUsername, fset=setUsername, notify=usernameChanged)
    password = pyqtProperty(str, fget=getPassword, fset=setPassword, notify=passwordChanged)
    errorMessage = pyqtProperty(str, fget=getErrorMessage, notify=errorMessageChanged)
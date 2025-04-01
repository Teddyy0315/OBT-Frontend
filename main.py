import sys
import os

from PySide6.QtWidgets import QApplication  # type: ignore
from PySide6.QtQml import QQmlApplicationEngine  # type: ignore
from PySide6.QtGui import QFontDatabase # type: ignore

# Viewmodels

from viewmodel.screens.login_screen_viewmodel import LoginScreenViewModel

# Service

from services.api_service import APIService


loginScreen_vm = LoginScreenViewModel(APIService())


if __name__ == "__main__":
    app = QApplication(sys.argv)
    
    engine = QQmlApplicationEngine()

    font_id = QFontDatabase.addApplicationFont("view/fonts/Roboto-Regular.ttf")

    engine.addImportPath(os.path.join(os.path.dirname(__file__), "view"))
    engine.rootContext().setContextProperty("loginScreenViewModel", loginScreen_vm)
    
    qml_file = os.path.join(os.path.dirname(__file__), "view", "main.qml")
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
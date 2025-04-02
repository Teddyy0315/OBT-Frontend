import sys
import os

from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtGui import QFontDatabase

# Viewmodels
from viewmodel.screens.login_screen_viewmodel import LoginScreenViewModel
from viewmodel.screens.dashboard_screen_viewmodel import DashboardViewModel

# Service
from services.api_service import APIService

loginScreen_vm = LoginScreenViewModel(APIService())
dashboardScreen_vm = DashboardViewModel(APIService())

if __name__ == "__main__":
    os.environ["QT_QUICK_BACKEND"] = "software"  # Use software backend for QML on Pi

    app = QApplication(sys.argv)

    engine = QQmlApplicationEngine()

    font_id = QFontDatabase.addApplicationFont("view/fonts/Roboto-Regular.ttf")

    engine.addImportPath(os.path.join(os.path.dirname(__file__), "view"))

    engine.rootContext().setContextProperty("loginScreenViewModel", loginScreen_vm)
    engine.rootContext().setContextProperty("dashboardScreenViewModel", dashboardScreen_vm)

    qml_file = os.path.join(os.path.dirname(__file__), "view", "main.qml")
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
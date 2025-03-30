import sys
import os

# Add root dir to sys.path for proper imports
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from PySide6.QtWidgets import QApplication
from view.main_window import MainWindow
from view.components.login_form import LoginForm
from view.styles.qss import APP_QSS
from PySide6.QtCore import Qt

def handle_login(username, _):
    print("Logged in:", username)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    app.setStyleSheet(APP_QSS)

    window = MainWindow()

    # Center LoginForm vertically and horizontally in right panel
    from PySide6.QtWidgets import QVBoxLayout, QWidget
    from PySide6.QtCore import Qt

    login_container = QWidget()
    login_layout = QVBoxLayout(login_container)
    login_layout.addStretch()
    login_layout.addWidget(LoginForm(on_login=handle_login), alignment=Qt.AlignHCenter)
    login_layout.addStretch()

    window.set_right_widget(login_container)
    window.set_left_widget(QWidget())  # Empty left side for now

    window.setGeometry(200, 200, 1280, 720)
    window.setWindowTitle("Odense Bartech")
    window.show()

    sys.exit(app.exec())
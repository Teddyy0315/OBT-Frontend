from PyQt6.QtCore import QObject, pyqtSignal as Signal, pyqtProperty as Property, pyqtSlot as Slot

class DashboardViewModel(QObject):
    currentPageComponentChanged = Signal()

    def __init__(self, api_service):
        super().__init__()
        self.api_service = api_service
        self._currentPageComponent = "../../view/pages/Page1.qml"
        self._allowedPages = ["Page1", "Page2", "Page3", "Page4"]

    @Slot(str)
    def loadPage(self, pageName):
        if pageName in self._allowedPages:
            self._currentPageComponent = f"../../view/pages/{pageName}.qml"
            self.currentPageComponentChanged.emit()

    def getCurrentPageComponent(self):
        return self._currentPageComponent

    currentPageComponent = Property(str, getCurrentPageComponent, notify=currentPageComponentChanged)
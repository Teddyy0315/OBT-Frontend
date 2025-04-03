from PyQt5.QtCore import QObject, pyqtSlot, pyqtSignal
from hardware.pump_controller import PumpController

class PumpTestViewModel(QObject):
    pumpStateChanged = pyqtSignal(int)

    def __init__(self):
        super().__init__()
        self.controller = PumpController()

    @pyqtSlot(int)
    def togglePump(self, pump_index):
        new_state = self.controller.toggle_pump(pump_index)
        self.pumpStateChanged.emit(new_state)
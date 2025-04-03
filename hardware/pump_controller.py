import smbus

class I2CDevice:
    def __init__(self, address=0x08, bus=1):
        self.address = address
        self.bus = smbus.SMBus(bus)

    def control_pump(self, pump_states):
        if len(pump_states) != 12:
            raise ValueError("Expected 12 pump states")
        try:
            self.bus.write_i2c_block_data(self.address, 0, pump_states)
            print(f"Pump states sent: {pump_states}")
        except Exception as e:
            print(f"Pump control error: {e}")

    def close(self):
        self.bus.close()


class PumpController:
    def __init__(self):
        self.device = I2CDevice()
        self.pump_states = [0] * 12
        self.is_on = False

    def toggle_pump(self, index):
        self.is_on = not self.is_on
        self.pump_states = [1 if self.is_on else 0] * 12
        self.device.control_pump(self.pump_states)
        return self.is_on  # Just return on/off state

    def shutdown(self):
        self.device.close()
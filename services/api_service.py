
class APIService:
    def login(self, username, password):
        if username == "Theodor" and password == "123":
            return True, ""
        else:
            return False, "Error"
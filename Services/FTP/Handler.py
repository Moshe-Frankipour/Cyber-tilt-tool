from pyftpdlib.handlers import FTPHandler
import requests


class ToolHandler(FTPHandler):
    session = ""

    def on_connect(self):
        print("on_connect")
        print(f"IP:{self.remote_ip} Port:{self.remote_port}")

    def on_disconnect(self):
        print("on_disconnect")
        pass

    def on_login(self, username):
        print("## on_login ##")
        print("username:", username)
        print(f"{self.remote_ip} {self.remote_port}")
        pass

    def on_logout(self, username):
        print("on_logout")
        print("username:", username)
        print(f"{self.remote_ip} {self.remote_port}")
        pass

    def on_file_sent(self, file):
        print("on_file_sent")
        pass

    def on_file_received(self, file):
        print("on_file_received")
        pass

    def on_incomplete_file_sent(self, file):
        print("on_incomplete_file_sent")
        pass

    def on_incomplete_file_received(self, file):
        print("on_incomplete_file_received")
        import os
        os.remove(file)


def log(session, msg):
    requests.post('http://backend/api/log',
                  {"sessionID": session,
                   "description": msg}
                  )


def init():
    data = requests.post('http://backend/api/log/init',
                         {
                             "serviceID": 0,
                             "companyID": 0,
                             "attackerID": 0,
                             "trapID": 0
                         }
                         )
    return data

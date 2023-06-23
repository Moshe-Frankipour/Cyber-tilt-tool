from pyftpdlib.handlers import FTPHandler
import requests
import os


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
        self.session = init(self.remote_ip)
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
    res = requests.post('http://backend/api/log',
                        {"sessionID": session,
                         "description": msg}
                        )
    print(res.text)
    print(res.status_code)


def init(attackerIP) -> str:
    data = requests.post('http://backend/api/log/init',
                         {
                             "serviceID": os.environ.get('SERVICE_ID'),
                             "companyID": os.environ.get('COMPANY_ID'),
                             "attackerIP": attackerIP,
                             "trapID": 0
                         }
                         )
    print(data.text)
    print(data.status_code)
    return data.text

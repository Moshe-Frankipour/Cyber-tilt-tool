#!/usr/bin/env python
"""Fake SSH Server Utilizing Paramiko"""
import argparse
import threading
import socket
import sys
import traceback
import paramiko
import requests
import os
from users import FAKE_ADMIN, FAKE_SUPERADMIN
import requests

HOST_KEY = paramiko.RSAKey(filename='keys/private.key')
SSH_BANNER = "SSH-2.0-OpenSSH_8.2p1 Ubuntu-4ubuntu0.3"


def handle_cmd(cmd, chan, isSuperAdmin, session):
    """Branching statements to handle and prepare a response for a command"""
    response = ""
    if cmd.startswith("sudo"):
        send_ascii("sudo.txt", chan)
        return
    elif cmd.startswith("ls"):
        response = "pw.txt"
    elif cmd.startswith("version"):
        response = "Super Amazing Awesome (tm) Shell v1.1"
    elif cmd.startswith("pwd"):
        response = "/home/clippy"
    elif cmd.startswith("cd"):
        send_ascii("cd.txt", chan)
        return
    elif cmd.startswith("cat"):
        send_ascii("cat.txt", chan)
        return
    elif cmd.startswith("rm"):
        if (isSuperAdmin):
            send_ascii("bomb.txt", chan)
            response = "You blew up our files! How could you???"
        else:
            response = "You are not allow to this command"
    elif cmd.startswith("whoami"):
        send_ascii("wizard.txt", chan)
        response = "You are a wizard of the internet!"
    elif ".exe" in cmd:
        response = "Hmm, trying to access .exe files from an ssh terminal..... Your methods are unconventional"
    elif cmd.startswith("cmd"):
        response = "Command Prompt? We only use respectable shells on this machine.... Sorry"
    elif cmd.startswith("us"):
        response = "sudo: fullaccess\r\nadministrator: P@sw0rd"
    elif cmd == "help":
        send_ascii("help.txt", chan)
        return
    else:
        send_ascii("clippy.txt", chan)
        response = "Use the 'help' command to view available commands"

    log(session, cmd)
    chan.send(response + "\r\n")


def send_ascii(filename, chan):
    """Print ascii from a file and send it to the channel"""
    with open('ascii/{}'.format(filename)) as text:
        chan.send("\r")
        for line in enumerate(text):
            chan.send(line[1] + "\r")


class FakeSshServer(paramiko.ServerInterface):
    """Settings for paramiko server interface"""
    username = ''

    def __init__(self):
        self.event = threading.Event()
        self._is_super_admin = False

    def is_super(self):
        return self._is_super_admin

    def check_channel_request(self, kind, chanid):
        if kind == 'session':
            return paramiko.OPEN_SUCCEEDED
        return paramiko.OPEN_FAILED_ADMINISTRATIVELY_PROHIBITED

    def check_auth_password(self, username, password):
        self.username = username

        if (FAKE_ADMIN.get(username) is not None and FAKE_ADMIN[username] == password):
            return paramiko.AUTH_SUCCESSFUL
        elif (FAKE_SUPERADMIN.get(username) is not None and FAKE_SUPERADMIN[username] == password):
            self._is_super_admin = True
            return paramiko.AUTH_SUCCESSFUL

        return paramiko.AUTH_FAILED

    def get_allowed_auths(self, username):
        return 'password'

    def check_channel_shell_request(self, channel):
        self.event.set()
        return True

    def check_channel_pty_request(self, channel, term, width, height, pixelwidth, pixelheight, modes):
        return True


def handle_connection(client, addr, hostname):
    """Handle a new ssh connection"""
    print('Got a connection!')
    session = ''
    try:
        transport = paramiko.Transport(client)
        transport.add_server_key(HOST_KEY)
        # Change banner to appear legit on nmap (or other network) scans
        transport.local_version = SSH_BANNER
        server = FakeSshServer()
        try:
            transport.start_server(server=server)
        except paramiko.SSHException:
            print('*** SSH negotiation failed.')
            raise Exception("SSH negotiation failed")
        # wait for auth
        chan = transport.accept(20)
        if chan is None:
            print('*** No channel.')
            raise Exception("No channel")

        server.event.wait(10)
        if not server.event.is_set():
            print('*** Client never asked for a shell.')
            raise Exception("No shell request")

        try:
            session = init(attackerIP=str(addr[0]), username=server.username)
            chan.send("Welcome to the my control server\r\n\r\n")
            run = True
            while run:
                chan.send("$ ")
                command = ""
                while not command.endswith("\r"):
                    transport = chan.recv(1024)
                    # Echo input to psuedo-simulate a basic terminal
                    chan.send(transport)
                    command += transport.decode("utf-8")

                chan.send("\r\n")
                command = command.rstrip()
                log(session, f"command: {command}")
                if command == "exit":
                    run = False
                else:
                    handle_cmd(command, chan, server.is_super(), session)

        except Exception as err:
            print('!!! Exception: {}: {}'.format(err.__class__, err))
            traceback.print_exc()
            try:
                transport.close()
            except Exception:
                pass

        chan.close()

    except Exception as err:
        print('!!! Exception: {}: {}'.format(err.__class__, err))
        traceback.print_exc()
        try:
            transport.close()
        except Exception:
            pass


def start_server(port, bind):
    """Init and run the ssh server"""
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        sock.bind((bind, port))
    except Exception as err:
        print('*** Bind failed: {}'.format(err))
        traceback.print_exc()
        sys.exit(1)

    threads = []
    while True:
        try:
            sock.listen(100)
            print('Listening for connection ...')
            client, addr = sock.accept()
            hostname = socket.gethostname()
        except Exception as err:
            print('*** Listen/accept failed: {}'.format(err))
            traceback.print_exc()
        new_thread = threading.Thread(target=handle_connection, args=(client, addr, hostname))
        new_thread.start()
        threads.append(new_thread)

    for thread in threads:
        thread.join()


#### Log ####

def log(session, msg):
    requests.post('https://backend/api/log',
                  json={
                      "sessionID": session,
                      "description": msg
                  }, verify=False)


def init_report(attackerIP, username) -> str:
    obj = {
        "serviceID": os.environ.get('SERVICE_ID'),
        "companyID": os.environ.get('COMPANY_ID'),
        "attackerIP": attackerIP,
        "trapID": get_tarp_id(username)
    }
    data = requests.post('https://backend/api/log/init',
                         json=obj, verify=False
                         )
    return data.text  # return id


def get_tarp_id(username):
    # Options:
    # 6 - Fake User
    # 7 - Hidden Admin
    if username in FAKE_ADMIN:
        return 6
    if username == FAKE_SUPERADMIN:
        return 7

    return 6


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Run a fake ssh server')
    parser.add_argument("--port", "-p", help="The port to bind the ssh server to (default 22)", default=22, type=int, action="store")
    parser.add_argument("--bind", "-b", help="The address to bind the ssh server to", default="", type=str, action="store")
    args = parser.parse_args()
    start_server(args.port, args.bind)

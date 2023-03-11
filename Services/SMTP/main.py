import asyncio
from users import FAKE_ADMIN, FAKE_EMAILS
from datetime import timedelta, datetime

def write_attacker_details(client_ip, client_port, command, details=""):
    f = open("loginIP.txt", "a")
    f.write(f'{datetime.now().strftime("%d/%m/%Y %H:%M:%S")}: ')
    f.write(f"Client IP: {client_ip}:{client_port}")
    f.write(f", The command is: {command}")
    if (details != ""):
        f.write(f", The details are: {details}")
    f.write("\n")
    f.close()

async def handle_client(reader, writer):
    # Implement your SMTP protocol logic here
    writer.write(b"220 localhost ESMTP\r\n") #tell to the client that the connection succeed
    # Get the client's IP address and port number
    client_addr = writer.get_extra_info("peername")
    client_ip = client_addr[0]
    client_port = client_addr[1]
    print(f"New connection from {client_ip}:{client_port}")
    await writer.drain()

    authenticated = False
    while True: # read the data from the client until the connection will close
        data = await reader.readline()
        if not data:
            break
        command = data.strip().decode().upper()

        if command == "QUIT":
            writer.write(b"221 Bye\r\n")
            await writer.drain()
            break
        elif command == "HELO" or command == "EHLO":
            writer.write(b"250 Hello\r\n")
            await writer.drain()
        elif command == "HELP":
            writer.write(b"214-Commands supported:\r\n")
            writer.write(b"214 HELO, EHLO, AUTH LOGIN, AUTH GET USERS, MAIL FROM:, RCPT TO:, DATA, QUIT, HELP\r\n")
            writer.write(b"214 End of HELP\r\n")
            await writer.drain()

        if command.startswith("VRFY"):
            if command.count(' ') >= 1:
                email = command.split(" ")[1].lower()
                details = f"The mail that checked is: {email}"
                write_attacker_details(client_ip, client_port, command, details)
                if email in FAKE_EMAILS:
                    writer.write(b"250 OK\r\n")
                else:
                    writer.write(b"550 No such user\r\n")
            else:
                writer.write(b"501 Syntax error in parameters or arguments\r\n")
            await writer.drain()

        elif command == "AUTH GET USERS":
                    writer.write(b"250-Users list:\r\n")
                    for user in FAKE_ADMIN:
                        writer.write(f"250 - Username: {user} Password: {FAKE_ADMIN[user]}\r\n".encode())
                    writer.write(b"250 End of List\r\n")
                    write_attacker_details(client_ip, client_port, command)
                    await writer.drain()

        elif command.startswith("AUTH LOGIN"):
            writer.write(b"334 VXNlcm5hbWU6\r\n") # ask for username (Base64 encoded)
            await writer.drain()
            username = (await reader.readline()).strip().decode() # read the username
            writer.write(b"334 UGFzc3dvcmQ6\r\n") # ask for password (Base64 encoded)
            await writer.drain()
            password = (await reader.readline()).strip().decode() # read the password
            if (FAKE_ADMIN.get(username) is not None and FAKE_ADMIN[username] == password):
                details = f"Username is: {username}, Password is: {password}"
                write_attacker_details(client_ip, client_port, command, details)
                writer.write(b"235 Authentication successful\r\n") # authentication succeeded
                authenticated = True
            else:
                writer.write(b"535 Authentication failed\r\n") # authentication failed
            await writer.drain()
        elif authenticated:
            if command.startswith("MAIL FROM:"):
                writer.write(b"250 OK\r\n")
                await writer.drain()
            elif command.startswith("RCPT TO:"):
                writer.write(b"250 OK\r\n")
                await writer.drain()
            elif command == "DATA":
                writer.write(b"354 End data with <CR><LF>.<CR><LF>\r\n")
                await writer.drain()

                message = []
                while True:
                    line = await reader.readline()
                    if line.strip() == b".":
                        break
                    message.append(line.decode())

                print("Received message:")
                print("".join(message))
                writer.write(b"\r\n250 OK\r\n")
                await writer.drain()
            else:
                writer.write(b"502 Command not implemented\r\n")
                await writer.drain()
        else:
            writer.write(b"530 Authentication required\r\n") # authentication is required before executing any other commands
            await writer.drain()

    writer.close()

async def main():
    server = await asyncio.start_server(handle_client, "localhost", 25)
    async with server:
        await server.serve_forever()

if __name__ == "__main__":
    asyncio.run(main())
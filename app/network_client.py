import socket

class NetworkClient:
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.sock = None

    def connect(self):
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.sock.connect((self.host, self.port))

    def send_input(self, data):
        try:
            if self.sock:
                self.sock.sendall(data.encode())
        except Exception as e:
            print("Erro:", e)

    def close(self):
        if self.sock:
            self.sock.close()

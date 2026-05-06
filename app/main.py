from input_handler import InputHandler
from network_client import NetworkClient
import config

client = NetworkClient(config.HOST, config.PORT)
client.connect()

def handle_input(key):
    print("Input:", key)
    client.send_input(key)

handler = InputHandler(handle_input)
handler.start()

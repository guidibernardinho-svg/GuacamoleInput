from pynput import keyboard

class InputHandler:
    def __init__(self, callback):
        self.callback = callback

    def on_press(self, key):
        try:
            self.callback(key.char)
        except:
            self.callback(str(key))

    def start(self):
        with keyboard.Listener(on_press=self.on_press) as listener:
            listener.join()

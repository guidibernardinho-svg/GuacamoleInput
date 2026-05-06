# 🥑 GuacamoleInput

**GuacamoleInput** is a macOS application that allows you to send keyboard and controller inputs from your Mac to a Nintendo 3DS over the network.

Inspired by InputRedirection.

---

## 🚀 Features

* 🎮 Keyboard input support
* 🕹️ (Planned) Game controller support
* 🌐 Network-based communication
* 🍏 Built for macOS (no Xcode required)
* ⚡ Lightweight and simple

---

## 📦 Project Structure

```
GuacamoleInput/
│
├── app/
│   ├── main.py
│   ├── input_handler.py
│   ├── network_client.py
│   └── config.py
│
├── assets/
│   └── icon.icns
│
├── requirements.txt
├── build.sh
└── README.md
```

---

## ⚙️ Requirements

* Python 3.9+
* macOS
* Nintendo 3DS with:

  * BootNTR
  * InputRedirection plugin

---

## 🛠️ Installation

Clone the repository:

```
git clone https://github.com/guidibernardinho-svg/GuacamoleInput.git
cd GuacamoleInput
```

Install dependencies:

```
pip install -r requirements.txt
```

---

## ⚡ Usage

1. Open `app/config.py`
2. Set your 3DS IP address:

```
HOST = "192.168.0.10"
PORT = 8000
```

3. Run the app:

```
python app/main.py
```

---

## 🧪 How it works

* Captures keyboard input using `pynput`
* Sends data over TCP socket
* 3DS receives input via NTR plugin

---

## 🏗️ Build macOS App (.app)

Run:

```
chmod +x build.sh
./build.sh
```

The app will be generated in:

```
dist/GuacamoleInput
```

---

## ⚠️ Disclaimer

This project is a prototype (MVP).

To fully match InputRedirection, additional work is needed:

* Proper 3DS input protocol implementation
* Binary packet handling
* Button mapping (A, B, X, Y, L, R)
* Stable connection handling

---

## 🔮 Roadmap

* [ ] Gamepad (Xbox/PS) support
* [ ] GUI (Tkinter or PyQt)
* [ ] Auto IP detection
* [ ] DMG installer
* [ ] Native C++ version for performance

---

## 🤝 Contributing

Pull requests are welcome!

---

## 📜 License

MIT License

---

## 💡 Credits

Inspired by InputRedirection and the 3DS homebrew community.

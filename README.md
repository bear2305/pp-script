# PP — Python HTTP Server Launcher

PP is a small Bash utility that makes it quick and convenient to start Python's built-in HTTP server from the terminal.

Instead of repeatedly typing:

```bash
python -m http.server
```

you can simply use:

```bash
pp
```

or specify the directory you want to serve:

```bash
pp ~/Desktop
```

## Features

- 🚀 Start a Python HTTP server with one command
- 📂 Serve a directory of your choice
- 🌐 Display your network interface information
- 🔌 Uses Python's built-in `http.server`
- 🐚 Works with Bash and Zsh
- ⚡ Can be installed as a global terminal command
- 🐧 Designed for Linux

## Requirements

- Linux
- Bash
- Python 3
- `ip` command (`iproute2`)

Check your Python installation:

```bash
python3 --version
```

## Quick Start

Clone the repository:

```bash
git clone https://github.com/bear2305/pp-script.git
```

Enter the repository:

```bash
cd pp-script
```

Make the script executable:

```bash
chmod +x pp
```

Run it:

```bash
./pp ~/Desktop
```

You should see something similar to:

```
Creating Server for: /home/user/Desktop
Serving HTTP on 0.0.0.0 port 8000
```

The server is available on port 8000.

On the same machine, you can open:

```
http://127.0.0.1:8000
```

A device on the same local network may be able to connect using your laptop's private IP:

```
http://YOUR-PRIVATE-IP:8000
```

---

## Usage

### Serve a specific directory

```bash
./pp /path/to/directory
```

Example:

```bash
./pp ~/Desktop
```

### Serve the current directory

If no argument is provided, `pp` uses the current directory:

```bash
./pp
```

For example, if you are currently inside:

```
~/Documents
```

then:

```bash
./pp
```

serves `~/Documents`.

### Show help

```bash
./pp -h
```

You can also use:

```bash
./pp --help
```

---

## Install as a Global Command

One of the ways to use `pp` is by placing the script in a directory that is included in your `PATH`. This allows you to run `pp` from any directory, without needing to type `./pp` or specify the script's location.

### 1. Create a directory for personal commands

A convenient standard location is:

```bash
mkdir -p ~/.local/bin
```

### 2. Copy `pp` into it

From the repository directory:

```bash
cp pp ~/.local/bin/pp
```

Make it executable:

```bash
chmod +x ~/.local/bin/pp
```

### 3. Add it to your PATH

**Zsh**

If you use Zsh, edit:

```bash
nano ~/.zshrc
```

Add:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Then reload your configuration:

```bash
source ~/.zshrc
```

**Bash**

If you use Bash, edit:

```bash
nano ~/.bashrc
```

Add:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Then reload:

```bash
source ~/.bashrc
```

**`.profile`**

You can also add the PATH entry to:

```bash
nano ~/.profile
```

Add:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

You may need to log out and log back in for the change to take effect.

### 4. Verify the installation

Run:

```bash
which pp
```

You should see something similar to:

```
/home/your-user/.local/bin/pp
```

Now `pp` can be used from anywhere:

```bash
pp ~/Desktop
```

Or:

```bash
cd ~/Documents
pp
```

---

## How It Works

`pp` is a Bash wrapper around Python's built-in HTTP server.

The main command used by the script is:

```bash
python -m http.server -d "$dirx"
```

The script also checks the selected network interface and displays its IP information before starting the server.

By default, Python's HTTP server listens on:

```
0.0.0.0:8000
```

---

## Network & Security

Be careful about what directory you serve.

When the server is running, files inside the served directory may be accessible to other devices that can reach your computer on the network.

For example:

```bash
pp ~/Desktop
```

could make files inside your Desktop directory available through the HTTP server.

**Do not serve directories containing:**

- Passwords
- SSH private keys
- API keys
- `.env` files
- Personal documents
- Credentials
- Other sensitive information

For temporary file sharing, it is safer to create a dedicated directory containing only the files you intend to share.

For example:

```bash
mkdir ~/share
```

Copy files into it:

```bash
cp file.txt ~/share/
```

Then run:

```bash
pp ~/share
```

### Private IP vs Public IP

The IP displayed by your network interface may be a private/local IP, such as:

- `10.x.x.x`
- `192.168.x.x`
- `172.16.x.x` – `172.31.x.x`

A private IP is normally used inside your local network and is not directly reachable from the public Internet.

Your public IP is different and is normally associated with your router/Internet connection.

Knowing your private IP does not expose your laptop directly to the Internet. However, you should still be careful when running network services, especially if your router has port forwarding configured or you are connected to an untrusted network.

---

## Example

```
$ pp ~/Desktop
Creating Server for: /home/user/Desktop
Serving HTTP on 0.0.0.0 port 8000
```

Then visit:

```
http://127.0.0.1:8000
```

from the same machine.

A device on the same local network may be able to use:

```
http://YOUR-PRIVATE-IP:8000
```

Press `Ctrl+C` to stop the server.

---

## Why I Created PP

I wanted a simple way to start a Python HTTP server without repeatedly typing the full Python command.

After adding the script to my `PATH`, I can simply type:

```bash
pp
```

from anywhere and immediately start serving the current directory.

---

## Disclaimer

This project is intended for educational purposes, development, testing, and legitimate file sharing.

Only serve files and directories that you have permission to share. Use responsibly, especially when connected to public or untrusted networks.

---

## Author

**Banahene Emmanuel Adamnor**

If you find this project useful, feel free to ⭐ the repository.

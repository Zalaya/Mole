# 🐲 Mole

**Mole** is a minimal Bash tool that dumps the content of an entire directory into a single text file.  
It’s perfect for sharing code with **ChatGPT** or other AI tools, without needing Git.

> 🔁 Alternative to [Gitingest](https://github.com/cyclotruc/gitingest) — but no Git, no setup, just files.

---

## 💡 Why use it?

- 🧠 AI-friendly: share full codebase context in one go.
- ⚡ Fast: ideal for debugging, refactoring, or support.
- 📦 Git-free: works on any folder, no repo required.
- 🌍 Remote-ready: run with a single command from anywhere.

---

## ⚙️ What it does

- Recursively scans a directory.
- Excludes files/folders via blacklist (like `.gitignore`).
- Outputs all file contents in a single structured file.

---

## 🌀 Remote usage

```bash
bash <(curl -s https://raw.githubusercontent.com/Zalaya/Mole/main/script.sh) [options] [root_directory]
```

> [!TIP]
> **Use Mole as a global command**  
> Add this alias to your terminal config (e.g. `~/.bashrc`, `~/.zshrc`) to use Mole from anywhere:
>
> ```bash
> alias mole='bash <(curl -s https://raw.githubusercontent.com/Zalaya/Mole/main/script.sh)'
> ```
>
> Then you can run it like:
>
> ```bash
> mole -o output.txt -b blacklist.txt ./project
> ```


## 🖥️ Local usage

```bash
git clone https://github.com/Zalaya/Mole.git
cd Mole
chmod +x script.sh
./script.sh [options] [root_directory]
```

## 🔧 Options

```bash
./script.sh [-o output_file] [-b blacklist_file] [root_directory]
```

| Option         | Description                                     |
|----------------| ----------------------------------------------- |
| `-o`           | Output file name (default: `output.txt`)        |
| `-b`           | Path to blacklist file (excludes files/folders) |
| root_directory | Root directory (default: current folder `"."`)  |

---

## 🧾 Blacklist format

Just like `.gitignore`:

```txt
# Ignore folders
.git/
node_modules/
dist/
.env
```

* One relative path per line.
* Supports folders or files.
* Comments with `#`.

---

## ✅ Requirements

* Bash (v4+).
* Tools: `find`, `sed`, `cat`.

Compatible with Linux, macOS, WSL, Git Bash on Windows.

---

## 📘 License

[MIT License](https://github.com/Zalaya/Mole/blob/main/LICENSE) — © [Zalaya](https://github.com/Zalaya)


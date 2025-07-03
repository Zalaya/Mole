# 🐲 Mole

## 🤖 Why use Mole for prompting or AI code analysis?

**Mole** is especially useful when working with tools like **ChatGPT** or other AI-based code assistants. Here's why:

* ✅ **One file, full context**: Instead of pasting files one by one, Mole lets you generate a single file with all your source code — perfect for giving ChatGPT full project visibility.

* ⚡ **Instant prompting**: Whether you're debugging, reviewing, or refactoring, you can copy and paste the output directly into ChatGPT and get faster, more relevant responses.

* 🧼 **Clean and structured**: Each file is clearly labeled with its relative path and content, making it easy for the AI (or any human) to understand project structure.

* 📦 **No Git required**: Ideal for quickly packaging small projects, demos, or local folders without needing to create a repo or commit anything.

* 🌐 **Works remotely**: You can run it from anywhere with one command — no install, no setup, just results.

> 🧠 Whether you're submitting a codebase for analysis, extracting files for a support request, or testing AI-driven workflows — Mole gives you a clean, minimal, and complete view of your project in seconds.

---

## 🔧 What does it do?

* Scans a folder recursively.
* Excludes files/folders using a blacklist.
* Creates a single file with the content of all found files.

Each file in the output includes its relative path and contents.

---

## 🌀 Remote usage (No Cloning Needed)

You can run **Mole** directly from GitHub without downloading anything:

```bash
bash <(curl -s https://raw.githubusercontent.com/Zalaya/Mole/main/script.sh) [options] [root_directory]
```

---

## 🖥️ Local usage

```bash
git clone https://github.com/Zalaya/Mole.git
cd Mole
chmod +x script.sh
./script.sh [options] [root_directory]
```

---

## ⚙️ Parameters

```bash
./script.sh [-o output_file] [-b blacklist_file] [root_directory]
```

| Flag           | Description                                                               |
|----------------| ------------------------------------------------------------------------- |
| `-o`           | Output filename (default: `output.txt`)                                   |
| `-b`           | Path to a blacklist file (to exclude folders or files, like `.gitignore`) |
| root_directory | (Optional) Root folder to scan (default: current directory `"."`)         |

---

## 🚫 Blacklist format

Works like a `.gitignore`:

```txt
# Ignore these folders
.git/
node_modules/
build/
.env
```

* Relative paths, one per line.
* Comments with `#`.
* No globs/wildcards.

---

## ✅ Requirements

* Bash
* Tools: `find`, `sed`, `cat`

Works on Linux, macOS, WSL — or Git Bash on Windows.

---

## 📘 License

[MIT License](https://github.com/Zalaya/Mole/blob/main/LICENSE) — © [Zalaya](https://github.com/Zalaya)

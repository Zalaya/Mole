# 🐲 Mole

**Mole** is a simple yet powerful tool that extracts the entire contents of a directory into a single output file with just one command.

It’s a lightweight alternative to tools like [Gitingest](https://github.com/cyclotruc/gitingest), but **without requiring Git**. All you need is a Bash shell.

---

## 🚀 Features

* Recursively scans a directory.
* Excludes files and folders using a **blacklist file (with `.gitignore`-like syntax)**.
* Outputs all contents into a single, structured output file.
* Supports **remote execution** without cloning the repository.

---

## 📦 Installation

### 🖥️ Local Use (Cloning Needed)

```bash
git clone https://github.com/Zalaya/Mole.git
cd Mole
chmod +x script.sh
```

Then run it as:

```bash
./script.sh [options] [project_root]
```

### ☁️ Remote Use (No Cloning Needed)

You can run the script directly from GitHub using:

```bash
bash <(curl -s https://raw.githubusercontent.com/Zalaya/Mole/main/script.sh) [options] [project_root]
```

**Examples:**

```bash
bash <(curl -s https://raw.githubusercontent.com/Zalaya/Mole/main/script.sh) -o output.txt
bash <(curl -s https://raw.githubusercontent.com/Zalaya/Mole/main/script.sh) -b blacklist.txt
bash <(curl -s https://raw.githubusercontent.com/Zalaya/Mole/main/script.sh) -o dump.txt -b blacklist.txt ../folder
```

---

## 🛠️ Usage

```bash
script.sh [-o output_file] [-b blacklist_file] [project_root]
```

### Options

| Option              | Description                                                              |
| ------------------- | ------------------------------------------------------------------------ |
| `-o output_file`    | Name of the output file (default: `output.txt`)                          |
| `-b blacklist_file` | Path to a file listing paths to exclude (uses `.gitignore`-style syntax) |
| `project_root`    | Directory to scan (default: current directory `"."`)                     |

---

## 🚫 Blacklist File

The blacklist file defines which files or folders to **exclude from the output**. Its format is similar to a `.gitignore`:

* One pattern per line
* Lines starting with `#` are comments
* Empty lines are ignored
* Patterns are relative to the root directory
* No wildcards or globs — only simple path prefixes are supported

**Example `blacklist.txt`:**

```
# Ignore version control and build artifacts
.git/
node_modules/
dist/
.env
```

---

## 💡 Usage Examples

### ▶️ Local (After Cloning)

**1. Scan current directory:**

```bash
./script.sh
```

**2. Custom output file:**

```bash
./script.sh -o output.txt
```

**3. Use a blacklist file:**

```bash
./script.sh -b blacklist.txt
```

**4. Scan another directory:**

```bash
./script.sh ../folder
```

**5. Combine everything:**

```bash
./script.sh -o output.txt -b blacklist.txt ../folder
```

---

### ☁️ Remote (No Clone Needed)

**1. Basic scan:**

```bash
bash <(curl -s https://raw.githubusercontent.com/Zalaya/Mole/main/script.sh)
```

**2. Set a custom output file:**

```bash
bash <(curl -s https://raw.githubusercontent.com/Zalaya/Mole/main/script.sh) -o output.txt
```

**3. Exclude files using a blacklist:**

```bash
bash <(curl -s https://raw.githubusercontent.com/Zalaya/Mole/main/script.sh) -b blacklist.txt
```

**4. Target another directory:**

```bash
bash <(curl -s https://raw.githubusercontent.com/Zalaya/Mole/main/script.sh) ../folder
```

**5. Full combination:**

```bash
bash <(curl -s https://raw.githubusercontent.com/Zalaya/Mole/main/script.sh) -o output.txt -b blacklist.txt ../project
```

---

## 📄 Output Format

The output file contains the relative path and content of every included file:

```
File: main.js

console.log("Hello world");

File: README.md

# My Project
```

Each section is clearly separated for easy reading.

---

## ✅ Requirements

* Bash (v4+)
* Standard Unix tools: `find`, `sed`, `cat`

> Fully compatible with Linux, macOS, and WSL. On Windows, use Git Bash or any Unix-like shell.

---

## 📘 License

MIT © [Zalaya](https://github.com/Zalaya)

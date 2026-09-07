# Lesson 01 — Environment

## 🎯 Objective

The objective of this lesson is to understand the development environment used throughout the Micro Focus COBOL Lab.

The project is being developed from macOS using Visual Studio Code, while Micro Focus COBOL and Enterprise Server components will be evaluated in a compatible Linux environment.

---

## 💻 Local Development Environment

### Hardware

| Component | Configuration |
|---|---|
| Computer | Apple Mac |
| Processor | Apple M1 |
| Architecture | ARM64 |
| Memory | 8 GB RAM |
| Operating System | macOS 14.0 Sonoma |

### Development Tools

| Tool | Version |
|---|---|
| Visual Studio Code | 1.67.2 |
| Git | Local installation |
| GitHub | Remote repository |

---

## 🧩 Why Linux?

Micro Focus / Rocket COBOL development tooling is primarily documented for Windows and Linux environments.

The current Rocket COBOL / Enterprise extension for Visual Studio Code provides COBOL development support on Windows and Linux.

Full compilation, debugging, unit testing, and advanced language-server functionality require the corresponding licensed Micro Focus / Rocket development products.

Because this project is being developed on an Apple Silicon Mac, the Micro Focus execution environment will be evaluated separately from the local macOS environment.

---

## 🏗️ Environment Architecture

```text
┌─────────────────────────────────────┐
│              macOS                  │
│                                     │
│  Apple M1 / ARM64 / 8 GB RAM       │
│                                     │
│  Visual Studio Code                 │
│  Git                                │
│  GitHub                             │
│                                     │
└────────────────┬────────────────────┘
                 │
                 │ Development
                 │
                 ▼
┌─────────────────────────────────────┐
│          Linux Environment          │
│                                     │
│  Micro Focus / Enterprise COBOL     │
│  Enterprise Server                  │
│  COBOL compilation                  │
│  Batch execution                    │
│  Testing                            │
│                                     │
└─────────────────────────────────────┘
````

---

## 📚 Concepts Introduced

This lesson introduces the following concepts:

* Micro Focus COBOL
* Enterprise COBOL
* Enterprise Developer
* Enterprise Server
* Visual Studio Code
* Linux development environments
* Local vs remote development
* COBOL compilation
* Batch execution

---

## 🔍 Environment Verification

The local environment was verified using:

```bash
sw_vers
uname -m
system_profiler SPHardwareDataType
code --version
```

Current environment:

```text
macOS 14.0
Apple M1
ARM64
8 GB RAM
Visual Studio Code 1.67.2 ARM64
```

---

## 🧪 Lesson Exercise

Before continuing to the next lesson, verify that:

* [x] macOS version was identified
* [x] CPU architecture was identified
* [x] Available memory was identified
* [x] Visual Studio Code version was identified
* [x] Git repository was initialized
* [x] GitHub repository was created
* [x] Local repository is connected to GitHub

---

## 📌 Important Note

The Micro Focus execution environment has not yet been installed.

The next step will be to evaluate the available Linux environment options and determine the most appropriate setup for this Mac.

The goal is to avoid installing incompatible software directly on macOS ARM64.

---

## 🔗 Project

Repository:

`microfocus-cobol-lab`

This project is maintained independently from:

`cobol-payment-processing`


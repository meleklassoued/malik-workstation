# 🚀 Mac Apps Installation Script

A friendly automation script to set up your new Mac with all the essential apps and tools you need to be productive right away!

## What Does This Script Do?

This script automates the installation of carefully selected applications for:

- 💻 Development (VS Code, Docker, Postman, etc.)
- 🎯 Productivity (Notion, Raycast, Rectangle, etc.)
- 🌐 Browsers (Chrome, Firefox)
- 🛠️ Command Line Tools (Git, Node, Python3, PostgreSQL)

## Prerequisites

- A Mac (running macOS)
- Terminal access
- Internet connection
- Admin privileges

## How to Run

1. Open Terminal
2. Navigate to the script location:

```bash
cd path/to/script
```

3. Make the script executable:

```bash
chmod +x install_apps.sh
```

4. Run the script:

```bash
./install_apps.sh
```

## ✨ Features

- [x] Automatically checks if Homebrew is installed
- [x] Updates Homebrew before installation
- [x] Skips already installed applications
- [x] Provides clear error messages for failed installations
- [x] Shows helpful post-installation notes

## 📋 Included Applications

### Development Tools

- Visual Studio Code
- Cursor AI Editor
- Zed Editor
- Docker Desktop
- Postman
- Beekeeper Studio
- MongoDB Compass
- HTTPie Desktop

### Productivity & Utilities

- Notion
- Notion Calendar
- Raycast
- Rectangle
- Karabiner Elements
- Slack
- Spotify
- Figma

### Browsers

- Google Chrome
- Firefox
- Zen browser

### CLI Tools

- Git
- Node
- Python3
- PostgreSQL

## Customization

You can easily customize the script by:

1. Opening `install_apps.sh` in your favorite text editor
2. Commenting/uncommenting applications in the `APPS` array
3. Adding new CLI tools to the `CLI_TOOLS` array

## ⚠️ Note

Some applications might not be available through Homebrew and will need manual installation:

- Zen Browser
- GitButler
- Windows Snap
- Workfolio
- Trae
- Terminology
- SQLPro for MSSQL
- Ollama

## Contributing

Feel free to fork this repository and add your own favorite applications or improvements!

## 📜 License

This script is free to use and modify for your personal setup.

#!/bin/bash

# Mac App Installation Script using Homebrew


set -e  # Exit on any error

# Progress bar function
show_progress() {
    local total=$1
    local current=$2
    local width=50
    local percentage=$((current * 100 / total))
    local completed=$((width * current / total))
    local remaining=$((width - completed))
    
    printf "\rProgress: ["
    printf "%${completed}s" | tr " " "⬢"
    printf "%${remaining}s" | tr " " "⬡"
    printf "] %d%%" $percentage
}

echo "🍺 Installing Homebrew apps for your new Mac..."
echo "======================================================"

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew not found. Installing Homebrew first..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew is already installed"
fi

# Update Homebrew
echo "📦 Updating Homebrew..."
brew update

# Uncomment the apps you want to install
APPS=(
    # Development Tools
    "visual-studio-code"     # Visual Studio Code
    "cursor"                 # Cursor AI Editor
    "zed"                    # Zed Editor
    "windsurf"               # Windsurf
    "warp"                   # Warp Terminal
    "docker"                 # Docker Desktop
    "postman"                # Postman API Client
    "beekeeper-studio"       # Beekeeper Studio
    "mongodb-compass"        # MongoDB Compass
    "httpie"                 # HTTPie Desktop
    
    # Productivity & Utilities
    "notion"                 # Notion
    "notion-calendar"        # Notion Calendar
    "raycast"                # Raycast
    "rectangle"              # Rectangle Window Manager
    "karabiner-elements"     # Karabiner Elements
    "slack"                  # Slack
    "spotify"                # Spotify
    "figma"                  # Figma
    
    # Browsers
    "google-chrome"          # Google Chrome
    "firefox"                # Firefox
    "zen-browser"            # Zen Browser (might not be available)
    
    # Other Tools
    "speedtest"              # Speedtest by Ookla
    # "gitbutler"            # GitButler (might not be available)
    # "windows-snap"         # Windows Snap (might not be available)
    # "workfolio"            # Workfolio (might not be available)
)

# Install each app with progress bar
echo "🚀 Installing applications..."
total_apps=${#APPS[@]}
current_app=0
failed_apps=()

for app in "${APPS[@]}"; do
    ((current_app++))
    if [[ $app == \#* ]]; then
        continue  # Skip commented lines
    fi
    
    show_progress $total_apps $current_app
    echo -e "\nInstalling $app..."
    if brew list --cask "$app" &>/dev/null; then
        echo "✅ $app is already installed"
    else
        if brew install --cask "$app" 2>/dev/null; then
            echo "✅ Successfully installed $app"
        else
            echo "❌ Failed to install $app (might not be available via Homebrew)"
            failed_apps+=("$app")
        fi
    fi
done

# Install command line tools with progress bar
echo -e "\n🔧 Installing command line tools..."
CLI_TOOLS=(
    "git"
    "node"
    "python3"
    "postgresql"
    # Add other CLI tools you need
)

total_cli=${#CLI_TOOLS[@]}
current_cli=0
failed_cli=()

for tool in "${CLI_TOOLS[@]}"; do
    ((current_cli++))
    show_progress $total_cli $current_cli
    echo -e "\nInstalling $tool..."
    if brew list "$tool" &>/dev/null; then
        echo "✅ $tool is already installed"
    else
        if brew install "$tool" 2>/dev/null; then
            echo "✅ Successfully installed $tool"
        else
            echo "❌ Failed to install $tool"
            failed_cli+=("$tool")
        fi
    fi
done

echo -e "\n🎉 Installation complete!"
echo "======================================================"
echo "📝 Notes:"
echo "• Some apps might not be available via Homebrew Cask"
echo "• You can manually install missing apps from their websites"
echo "• Run 'brew cleanup' to remove old versions"

echo -e "\n🔍 Apps that need manual installation:"
echo "• Zen Browser"
echo "• GitButler"
echo "• Windows Snap"
echo "• Workfolio"
echo "• Trae"
echo "• Terminology"
echo "• SQLPro for MSSQL"
echo "• Ollama (can be installed via: brew install ollama)"

# Show failed installations if any
if [ ${#failed_apps[@]} -ne 0 ]; then
    echo -e "\n⚠️ Failed app installations:"
    printf '• %s\n' "${failed_apps[@]}"
fi

if [ ${#failed_cli[@]} -ne 0 ]; then
    echo -e "\n⚠️ Failed CLI tool installations:"
    printf '• %s\n' "${failed_cli[@]}"
fi

echo -e "\n✨ Your new Mac is ready to go!"
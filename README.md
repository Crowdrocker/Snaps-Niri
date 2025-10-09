# WehttamSnaps Niri Setup 🎮📸

> A complete Arch Linux + Niri window manager setup optimized for gaming, streaming, and photography work

![WehttamSnaps Banner](https://via.placeholder.com/1200x300/8A2BE2/FFFFFF?text=WehttamSnaps+Niri+Setup)

## 🎯 Overview

This is a fully customized Arch Linux environment built around the Niri window manager, featuring:
- **Noctalia Shell** - Beautiful Quickshell-based desktop environment
- **J.A.R.V.I.S. Theme** - Complete audio integration with custom sounds
- **Gaming Optimizations** - AMD RX580 tuned for maximum performance
- **Streaming Ready** - OBS with audio routing via PipeWire
- **Photography Workflow** - Optimized for GIMP, Krita, Inkscape
- **WehttamSnaps Branding** - Custom violet-to-cyan gradient theme

## 💻 Hardware Specs

- **CPU**: Intel i5-4430 (4 cores, 3.0-3.2 GHz)
- **GPU**: AMD RX 580
- **RAM**: 16GB DDR3
- **Storage**: 
  - 120GB SSD (Linux)
  - 120GB SSD (Windows)
  - 1TB SSD (Games & Files at `/run/media/wehttamsnaps/LINUXDRIVE-1`)
- **Monitor**: DP-3 @ 1920x1080
- **PSU**: 750W

## 🚀 Quick Start

### Prerequisites
```bash
# Ensure you're running Arch Linux
# Update your system first
sudo pacman -Syu
```

### One-Line Installation
```bash
curl -fsSL https://raw.githubusercontent.com/Crowdrocker/Snaps-Niri/main/install.sh | bash
```

### Manual Installation
```bash
# Clone the repository
git clone https://github.com/Crowdrocker/Snaps-Niri.git
cd Snaps-Niri

# Run the interactive installer
chmod +x install.sh
./install.sh
```

## 📁 Repository Structure

```
Snaps-Niri/
├── niri/                      # Niri window manager configs
│   ├── config.kdl            # Main config (sources all others)
│   ├── keybinds.kdl          # Keyboard shortcuts
│   ├── monitors.kdl          # Display configuration
│   ├── window-rules.kdl      # Application window rules
│   ├── workspaces.kdl        # Workspace setup
│   ├── animations.kdl        # Animation settings
│   └── appearance/
│       ├── colors.kdl        # Color scheme
│       └── decorations.kdl   # Window decorations
├── noctalia/                  # Noctalia shell configuration
│   ├── quickshell/           # Quickshell configs
│   │   ├── bar/              # Custom bar widgets
│   │   ├── widgets/          # Work & gaming launchers
│   │   └── power-menu/       # Branded power menu
│   └── matugen/              # Color generation templates
│       ├── niri.conf
│       ├── kitty.conf
│       └── rofi.conf
├── jarvis/                    # J.A.R.V.I.S. sound pack
│   ├── sounds/               # Audio files
│   ├── scripts/              # Trigger scripts
│   └── README.md             # Sound integration guide
├── gaming/                    # Gaming optimizations
│   ├── gamemode.ini          # Gamemode config
│   ├── corectrl/             # GPU control
│   ├── steam-launch-options/ # Per-game configs
│   └── scripts/              # Gaming utilities
├── audio/                     # Audio routing setup
│   ├── pipewire/             # PipeWire configs
│   ├── qpwgraph/             # Routing presets
│   └── guides/               # Setup documentation
├── streaming/                 # OBS Studio setup
│   ├── scenes/               # Scene collections
│   ├── profiles/             # OBS profiles
│   └── scripts/              # Streaming utilities
├── terminal/                  # Terminal configurations
│   ├── kitty/                # Kitty terminal
│   ├── zsh/                  # Zsh with aliases
│   ├── bash/                 # Bash configs
│   └── fastfetch/            # Custom fetch config
├── apps/                      # Application configs
│   ├── rofi/                 # Launcher
│   ├── dunst/                # Notifications
│   ├── thunar/               # File manager
│   └── sddm/                 # Login screen
├── scripts/                   # Utility scripts
│   ├── keybind-generator.sh  # Auto-document keybinds
│   ├── backup.sh             # Backup configs
│   ├── update.sh             # Update system
│   └── widget-creator.sh     # Create new widgets
├── docs/                      # Documentation
│   ├── INSTALLATION.md       # Detailed install guide
│   ├── KEYBINDS.md           # Keyboard shortcuts
│   ├── TROUBLESHOOTING.md    # Common issues
│   ├── GAMING.md             # Gaming setup guide
│   ├── STREAMING.md          # Streaming guide
│   └── CUSTOMIZATION.md      # Customization tips
├── install.sh                 # Interactive installer
└── README.md                  # This file
```

## 🎨 Brand Identity

**Name**: WehttamSnaps (Matthew spelled backwards)  
**Primary Colors**: Violet to Cyan gradient (#8A2BE2 → #00FFFF)  
**Secondary Colors**: Deep Blue (#0066CC), Hot Pink (#FF69B4)  
**Style**: Modern, tech-focused, photographic elements

## ✨ Features

### 🖥️ Niri Window Manager
- Modular configuration split into logical files
- Smooth scrolling workspaces
- Optimized for single monitor workflow
- Custom keybindings with auto-documentation
- Window rules for gaming and work applications

### 🎨 Noctalia Shell
- Beautiful Quickshell-based interface
- Custom bar with WehttamSnaps branding
- Work launcher (Inkscape, GIMP, Krita, Discord)
- Gaming launcher (Steam, Lutris, Heroic, Spotify)
- Branded power menu
- Matugen integration for dynamic theming

### 🤖 J.A.R.V.I.S. Integration
- Startup greetings (time-based)
- Shutdown confirmations
- Notification sounds
- Gaming mode activation
- Streaming mode activation
- System warnings (temperature, disk space)

### 🎮 Gaming Optimizations
- AMD RX580 specific tweaks
- Gamemode auto-activation
- CoreCtrl GPU control
- LACT (Linux AMDGPU Controller)
- Fan control based on temperature
- ZRAM configuration
- Steam launch options for all games
- Gamescope integration

### 🎙️ Streaming Setup
- OBS Studio optimized for RX580
- PipeWire audio routing
- qpwgraph presets
- Separate audio channels (game/browser/discord/spotify)
- Streaming keybindings
- Scene templates

### 🔧 Development Tools
- Widget template creator
- Matugen template generator
- Keybind auto-documentation
- Config backup/restore
- Quick editor for configs

## 🎮 Supported Games

Steam launch options included for:
- Call of Duty HQ
- Cyberpunk 2077
- Fallout 4
- FarCry 5
- Ghost Recon Breakpoint
- Marvel's Avengers
- Need for Speed Payback
- Rise of the Tomb Raider
- Shadow of the Tomb Raider
- The First Descendant
- Tom Clancy's The Division
- Tom Clancy's The Division 2
- Warframe
- Watch_Dogs series

## 📚 Documentation

- [Installation Guide](docs/INSTALLATION.md) - Detailed setup instructions
- [Keybindings](docs/KEYBINDS.md) - Complete keyboard shortcuts
- [Gaming Guide](docs/GAMING.md) - Gaming optimizations and setup
- [Streaming Guide](docs/STREAMING.md) - OBS and audio routing
- [Troubleshooting](docs/TROUBLESHOOTING.md) - Common issues and fixes
- [Customization](docs/CUSTOMIZATION.md) - Make it your own

## 🤝 Community

- **Discord**: [Join WehttamSnaps Community](https://discord.gg/nTaknDvdUA)
- **Twitch**: [WehttamSnaps](https://twitch.tv/WehttamSnaps)
- **YouTube**: [WehttamSnaps](https://youtube.com/@WehttamSnaps)
- **GitHub**: [Crowdrocker](https://github.com/Crowdrocker)

## 🌟 Credits

- **Noctalia Shell**: [noctalia-dev](https://github.com/noctalia-dev/noctalia-shell)
- **Niri**: [YaLTeR](https://github.com/YaLTeR/niri)
- **Quickshell**: [outfoxxed](https://github.com/outfoxxed/quickshell)
- Inspired by JaKooLit and Shell Ninja

## 📝 License

MIT License - Feel free to use and modify!

## 🚧 Roadmap

- [ ] Video installation tutorial
- [ ] More custom widgets
- [ ] Additional Matugen templates
- [ ] Hyprland compatibility branch
- [ ] Automated backup system
- [ ] Web-based config editor

## 💖 Support

If you find this setup helpful, consider:
- ⭐ Starring the repository
- 🐛 Reporting bugs
- 💡 Suggesting features
- 📢 Sharing with others
- ☕ [Buy me a coffee](https://ko-fi.com/wehttamsnaps)

---

**Made with 💜 by WehttamSnaps** | Full-time wedding & photobooth photographer | Gaming enthusiast
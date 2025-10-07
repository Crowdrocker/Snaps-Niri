# WehttamSnaps Niri Setup

<div align="center">
  <img src="https://img.shields.io/badge/Niri-Wayland-8A2BE2?style=for-the-badge" alt="Niri Wayland">
  <img src="https://img.shields.io/badge/Quickshell-Noctalia-00FFFF?style=for-the-badge" alt="Quickshell Noctalia">
  <img src="https://img.shields.io/badge/Theme-J.A.R.V.I.S.-FF69B4?style=for-the-badge" alt="J.A.R.V.I.S. Theme">
  <img src="https://img.shields.io/badge/Arch-Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white" alt="Arch Linux">
</div>

<p align="center">A complete Niri environment with Noctalia-shell, gaming optimizations, and J.A.R.V.I.S. theme integration.</p>

<div align="center">
  <img src="https://i.imgur.com/placeholder.png" alt="WehttamSnaps Niri Screenshot">
</div>

## 🌟 Features

- **Niri Wayland Compositor** - Modern, efficient tiling Wayland compositor
- **Noctalia-shell** - Beautiful, minimal desktop shell built on Quickshell
- **J.A.R.V.I.S. Theme** - Complete Iron Man-inspired theme with custom sounds
- **Gaming Optimizations** - Tailored for AMD RX 580 with performance presets
- **Advanced Audio Routing** - PipeWire setup similar to VoiceMeter on Windows
- **Modular Configuration** - Easy-to-maintain split configuration files
- **Custom Quickshell Widgets** - Work and gaming launchers, system monitors, and more

## 📋 Requirements

- Arch Linux (or Arch-based distribution)
- AMD GPU (optimized for RX 580)
- 16GB RAM recommended
- Internet connection for installation

## 🚀 Quick Start

### One-Command Installation

```bash
curl -sL https://raw.githubusercontent.com/Crowdrocker/Snaps-Niri/main/install.sh | bash
```

### Manual Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Crowdrocker/Snaps-Niri.git
   cd Snaps-Niri
   ```

2. Make the installation script executable:
   ```bash
   chmod +x install.sh
   ```

3. Run the installation script:
   ```bash
   ./install.sh
   ```

4. Reboot your system when prompted.

## 🎮 Gaming Features

- **GameMode Integration** - Optimize system performance when gaming
- **CoreCtrl Profiles** - Custom GPU profiles for different scenarios
- **Steam Launch Options** - Optimized launch options for popular games
- **Gamescope Support** - Enhanced gaming experience with AMD's Gamescope
- **Auto Game Detection** - Automatically activate gaming mode when games launch

### Optimized Steam Launch Options

The setup includes optimized launch options for games including:
- Cyberpunk 2077
- Fallout 4
- The Division series
- Watch Dogs series
- And many more!

## 🎧 Advanced Audio Routing

Similar to VoiceMeter on Windows, this setup includes:

- **Virtual Audio Devices** - Separate game, Discord, browser, and music audio
- **Audio Profiles** - Quick switching between gaming, streaming, and work profiles
- **OBS Integration** - Seamless audio routing for streaming
- **J.A.R.V.I.S. Sound Effects** - Custom system sounds for various events

## 🤖 J.A.R.V.I.S. Integration

- **Voice Notifications** - J.A.R.V.I.S. voice for system events
- **Themed Interface** - Iron Man-inspired visual design throughout
- **Custom Terminal** - J.A.R.V.I.S.-themed terminal with Starship prompt
- **Boot Animation** - Custom boot and login screens
- **J.A.R.V.I.S. Assistant** - Interactive system control interface

## ⌨️ Key Bindings

| Key Combination | Action |
|----------------|--------|
| `Mod+Return` | Open terminal |
| `Mod+d` | Application launcher |
| `Mod+q` | Close window |
| `Mod+f` | Toggle fullscreen |
| `Mod+1-9` | Switch workspace |
| `Mod+Shift+1-9` | Move window to workspace |
| `Mod+g` | Gaming mode |
| `Mod+w` | Work mode |
| `Mod+j` | J.A.R.V.I.S. assistant |
| `Mod+Shift+e` | Power menu |
| `Print` | Screenshot |
| `Shift+Print` | Screenshot selection |

[View full keybindings](keybindings.md)

## 🛠️ Customization

### Modular Configuration

The Niri configuration is split into multiple files for easier management:

```
~/.config/niri/
├── config.kdl              # Main config (auto-generated)
├── config.kdl.template     # Template with placeholders
├── build_config.sh         # Script to build config
├── modules/
│   ├── appearance.kdl      # Visual settings
│   ├── keybinds.kdl        # Keyboard shortcuts
│   ├── monitors.kdl        # Monitor configuration
│   ├── startup.kdl         # Autostart applications
│   └── windows.kdl         # Window rules
```

### Quickshell Widgets

Create custom widgets using the widget manager:

```bash
~/.config/quickshell/widget_manager.sh create <template> <name>
```

Available templates:
- `bar` - Top/bottom bar
- `gaming-launcher` - Game launcher
- `work-launcher` - Work application launcher
- And more!

### Adding J.A.R.V.I.S. Sounds

Place custom sound files in `~/.config/niri/assets/sounds/jarvis/` with the following names:
- `jarvis-startup.mp3`
- `jarvis-shutdown.mp3`
- `jarvis-notification.mp3`
- `jarvis-warning.mp3`
- `jarvis-gaming.mp3`
- `jarvis-streaming.mp3`

## 📦 Repository Structure

```
snaps-niri/
├── install.sh                  # Main installation script
├── update.sh                   # Update script
├── README.md                   # Main documentation
├── keybindings.md              # Keybinding reference
├── config/                     # Configuration files
│   ├── niri/                   # Niri configuration
│   ├── quickshell/             # Quickshell configuration
│   └── ...                     # Other app configs
├── scripts/                    # Utility scripts
│   ├── audio/                  # Audio routing scripts
│   ├── gaming/                 # Gaming optimization scripts
│   ├── jarvis/                 # J.A.R.V.I.S. integration
│   └── utils/                  # Utility scripts
└── assets/                     # Visual and audio assets
    ├── themes/                 # Visual themes
    ├── wallpapers/             # Wallpaper collection
    └── sounds/                 # Sound effects
```

## 🔄 Updates

To update your WehttamSnaps Niri setup:

```bash
~/update.sh
```

This will update all packages, rebuild configurations, and restart necessary services.

## 🤝 Contributing

Contributions are welcome! Feel free to submit pull requests or open issues.

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'Add some amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a pull request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Niri](https://github.com/YaLTeR/niri) - The Wayland compositor
- [Noctalia-shell](https://github.com/noctalia-dev/noctalia-shell) - The desktop shell
- [Quickshell](https://github.com/quickshell/quickshell) - The widget framework
- [JaKooLit](https://github.com/JaKooLit) - Inspiration for many configurations
- [Shell Ninja](https://github.com/shell-ninja) - Inspiration for many configurations
- Marvel Studios' Iron Man - For the J.A.R.V.I.S. concept

---

<p align="center">Created with ❤️ by <a href="https://github.com/Crowdrocker">WehttamSnaps</a></p>
<p align="center">
  <a href="https://www.twitch.tv/WehttamSnaps">Twitch</a> •
  <a href="https://www.youtube.com/WehttamSnaps">YouTube</a> •
  <a href="https://discord.gg/nTaknDvdUA">Discord</a>
</p>
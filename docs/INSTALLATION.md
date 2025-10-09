# WehttamSnaps Niri Setup - Installation Guide

Complete step-by-step installation guide for Arch Linux.

## 📋 Prerequisites

### System Requirements
- **OS**: Arch Linux (up to date)
- **CPU**: Intel i5-4430 or better
- **GPU**: AMD RX 580 or compatible
- **RAM**: 16GB recommended
- **Storage**: 120GB+ SSD for Linux
- **Internet**: Active connection for downloads

### Before You Begin
1. Backup your important data
2. Update your system: `sudo pacman -Syu`
3. Ensure you have sudo privileges
4. Have at least 10GB free space

## 🚀 Quick Installation

### One-Line Install (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/Crowdrocker/Snaps-Niri/main/install.sh | bash
```

### Manual Installation

```bash
# Clone the repository
git clone https://github.com/Crowdrocker/Snaps-Niri.git
cd Snaps-Niri

# Make installer executable
chmod +x install.sh

# Run installer
./install.sh
```

## 📦 Installation Options

The installer provides several options:

### 1. Full Installation (Recommended)
Installs everything:
- Niri window manager
- Noctalia shell
- J.A.R.V.I.S. theme
- Gaming optimizations
- Streaming setup
- Work applications
- All configurations

**Time**: ~30-45 minutes  
**Download**: ~5-8 GB

### 2. Niri Window Manager Only
Just the core Niri setup with basic configurations.

**Time**: ~10-15 minutes  
**Download**: ~1-2 GB

### 3. Noctalia Shell Only
Installs Quickshell and Noctalia without Niri.

**Time**: ~5-10 minutes  
**Download**: ~500 MB

### 4. J.A.R.V.I.S. Theme Only
Just the sound pack and scripts.

**Time**: ~2 minutes  
**Download**: ~50 MB (plus your sound files)

### 5. Gaming Optimizations Only
Gaming packages and optimizations.

**Time**: ~20-30 minutes  
**Download**: ~4-6 GB

### 6. Streaming Setup Only
OBS and audio routing setup.

**Time**: ~10 minutes  
**Download**: ~500 MB

## 🔧 Manual Step-by-Step Installation

If you prefer to install manually:

### Step 1: Install Base Packages

```bash
# Update system
sudo pacman -Syu

# Install Niri and essentials
sudo pacman -S niri kitty thunar firefox wayland xorg-xwayland wl-clipboard

# Install audio
sudo pacman -S pipewire pipewire-pulse pipewire-alsa wireplumber pavucontrol qpwgraph

# Install utilities
sudo pacman -S rofi-wayland fuzzel dunst grim slurp swaylock brightnessctl playerctl

# Install system tools
sudo pacman -S htop btop neofetch fastfetch git wget curl unzip zip

# Install fonts
sudo pacman -S ttf-jetbrains-mono-nerd ttf-fira-code noto-fonts noto-fonts-emoji
```

### Step 2: Install AUR Helper (yay)

```bash
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
```

### Step 3: Install Noctalia Shell

```bash
# Install Quickshell
yay -S quickshell-git

# Clone Noctalia
git clone https://github.com/noctalia-dev/noctalia-shell.git ~/.config/noctalia
```

### Step 4: Install Gaming Packages

```bash
# Gaming essentials
sudo pacman -S steam lutris wine wine-mono wine-gecko winetricks

# Performance tools
sudo pacman -S gamemode lib32-gamemode mangohud lib32-mangohud gamescope

# AMD GPU tools
sudo pacman -S corectrl

# Vulkan
sudo pacman -S vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader

# Additional launchers
sudo pacman -S discord
yay -S heroic-games-launcher-bin lact
```

### Step 5: Install Streaming Packages

```bash
sudo pacman -S obs-studio v4l2loopback-dkms linux-headers
```

### Step 6: Install Work Applications

```bash
sudo pacman -S gimp inkscape krita blender
```

### Step 7: Copy Configuration Files

```bash
# Clone this repository
git clone https://github.com/Crowdrocker/Snaps-Niri.git ~/Snaps-Niri
cd ~/Snaps-Niri

# Copy Niri configs
mkdir -p ~/.config/niri
cp -r niri/* ~/.config/niri/

# Copy J.A.R.V.I.S. configs
mkdir -p ~/.config/jarvis
cp -r jarvis/* ~/.config/jarvis/
chmod +x ~/.config/jarvis/scripts/*.sh

# Copy other configs as needed
```

### Step 8: Enable Services

```bash
# Enable audio
systemctl --user enable --now pipewire
systemctl --user enable --now pipewire-pulse
systemctl --user enable --now wireplumber

# Enable gamemode
systemctl --user enable --now gamemoded

# Add user to gamemode group
sudo usermod -a -G gamemode $USER

# Enable CoreCtrl (optional)
systemctl --user enable --now corectrl
```

### Step 9: Configure Display Manager

#### Option A: SDDM (Recommended)

```bash
# Install SDDM
sudo pacman -S sddm

# Enable SDDM
sudo systemctl enable sddm

# Create Niri session file
sudo nano /usr/share/wayland-sessions/niri.desktop
```

Add:
```ini
[Desktop Entry]
Name=Niri
Comment=WehttamSnaps Niri Setup
Exec=niri
Type=Application
```

#### Option B: Start Manually

Add to `~/.bash_profile` or `~/.zprofile`:
```bash
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec niri
fi
```

### Step 10: Add J.A.R.V.I.S. Sounds

```bash
# Create sounds directory
mkdir -p ~/.config/jarvis/sounds

# Add your MP3 files
# You can create them at: https://www.101soundboards.com/
# Place them in: ~/.config/jarvis/sounds/

# Required files:
# - startup.mp3 (or morning.mp3, afternoon.mp3, evening.mp3)
# - shutdown.mp3
# - notification.mp3
# - warning.mp3
# - gaming.mp3
# - streaming.mp3
```

## 🎨 Post-Installation Configuration

### 1. Configure Niri

```bash
# Edit main config
nano ~/.config/niri/config.kdl

# Edit keybindings
nano ~/.config/niri/keybinds.kdl

# Edit colors
nano ~/.config/niri/appearance/colors.kdl
```

### 2. Configure Noctalia

```bash
# Navigate to Noctalia config
cd ~/.config/noctalia

# Follow Noctalia documentation for customization
```

### 3. Set Up Audio Routing

```bash
# Start qpwgraph
qpwgraph

# Create your audio routing setup
# Save as preset for easy loading
```

### 4. Configure Gaming

```bash
# Copy gamemode config
mkdir -p ~/.config
cp ~/Snaps-Niri/gaming/gamemode.ini ~/.config/

# Test gamemode
gamemoded -s
```

### 5. Set Up Streaming

```bash
# Launch OBS
obs

# Import scene collections from ~/Snaps-Niri/streaming/scenes/
# Configure audio sources using qpwgraph
```

## 🔍 Verification

### Check Niri Installation

```bash
# Check if Niri is installed
which niri

# Test Niri config
niri validate
```

### Check Services

```bash
# Check audio
systemctl --user status pipewire
systemctl --user status wireplumber

# Check gamemode
systemctl --user status gamemoded

# Check CoreCtrl
systemctl --user status corectrl
```

### Test J.A.R.V.I.S. Sounds

```bash
# Test startup sound
~/.config/jarvis/scripts/jarvis-startup.sh

# Test gaming mode
~/.config/jarvis/scripts/jarvis-gaming.sh
```

## 🐛 Troubleshooting

### Niri Won't Start

```bash
# Check logs
journalctl -xe

# Validate config
niri validate

# Check for missing dependencies
niri --version
```

### Audio Not Working

```bash
# Restart audio services
systemctl --user restart pipewire
systemctl --user restart wireplumber

# Check audio devices
pactl list sinks
```

### Gaming Performance Issues

```bash
# Check gamemode status
gamemoded -s

# Verify GPU driver
glxinfo | grep "OpenGL renderer"

# Check CPU governor
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
```

### J.A.R.V.I.S. Sounds Not Playing

```bash
# Check if mpv is installed
which mpv

# Test sound manually
mpv ~/.config/jarvis/sounds/startup.mp3

# Check script permissions
ls -l ~/.config/jarvis/scripts/
```

## 📚 Next Steps

After installation:

1. **Read the keybindings**: `cat ~/.config/niri/keybinds.kdl`
2. **Customize colors**: Edit `~/.config/niri/appearance/colors.kdl`
3. **Add J.A.R.V.I.S. sounds**: Place MP3s in `~/.config/jarvis/sounds/`
4. **Configure audio routing**: Use qpwgraph
5. **Set up Steam games**: Add launch options from `gaming/steam-launch-options/`
6. **Join the community**: [Discord](https://discord.gg/nTaknDvdUA)

## 🔄 Updating

```bash
# Update the repository
cd ~/Snaps-Niri
git pull

# Re-run installer to update configs
./install.sh
```

## 🗑️ Uninstallation

```bash
# Remove configs
rm -rf ~/.config/niri
rm -rf ~/.config/noctalia
rm -rf ~/.config/jarvis

# Remove packages (optional)
sudo pacman -Rns niri quickshell-git

# Remove services
systemctl --user disable --now gamemoded
systemctl --user disable --now corectrl
```

## 💡 Tips

- **Backup regularly**: Use the backup script in `scripts/backup.sh`
- **Test in VM first**: If unsure, test in a virtual machine
- **Read the docs**: Check all README files in subdirectories
- **Ask for help**: Join the Discord community

---

**Made with 💜 by WehttamSnaps** | Let's get you set up! 🚀
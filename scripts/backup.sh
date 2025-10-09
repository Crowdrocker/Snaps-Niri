#!/bin/bash
# WehttamSnaps Configuration Backup Script
# Backs up all important configuration files

BACKUP_DIR="$HOME/Backups/niri-backup-$(date +%Y%m%d-%H%M%S)"
CONFIG_DIR="$HOME/.config"

echo "🔄 WehttamSnaps Configuration Backup"
echo "===================================="
echo ""

# Create backup directory
mkdir -p "$BACKUP_DIR"

echo "📁 Creating backup in: $BACKUP_DIR"
echo ""

# Backup Niri configuration
if [ -d "$CONFIG_DIR/niri" ]; then
    echo "✓ Backing up Niri configuration..."
    cp -r "$CONFIG_DIR/niri" "$BACKUP_DIR/"
fi

# Backup Noctalia configuration
if [ -d "$CONFIG_DIR/noctalia" ]; then
    echo "✓ Backing up Noctalia configuration..."
    cp -r "$CONFIG_DIR/noctalia" "$BACKUP_DIR/"
fi

# Backup J.A.R.V.I.S. configuration
if [ -d "$CONFIG_DIR/jarvis" ]; then
    echo "✓ Backing up J.A.R.V.I.S. configuration..."
    cp -r "$CONFIG_DIR/jarvis" "$BACKUP_DIR/"
fi

# Backup Kitty configuration
if [ -d "$CONFIG_DIR/kitty" ]; then
    echo "✓ Backing up Kitty configuration..."
    cp -r "$CONFIG_DIR/kitty" "$BACKUP_DIR/"
fi

# Backup audio configuration
if [ -d "$CONFIG_DIR/audio" ]; then
    echo "✓ Backing up audio configuration..."
    cp -r "$CONFIG_DIR/audio" "$BACKUP_DIR/"
fi

# Backup PipeWire configuration
if [ -d "$CONFIG_DIR/pipewire" ]; then
    echo "✓ Backing up PipeWire configuration..."
    cp -r "$CONFIG_DIR/pipewire" "$BACKUP_DIR/"
fi

# Backup gaming configuration
if [ -d "$CONFIG_DIR/gamemode.ini" ]; then
    echo "✓ Backing up gamemode configuration..."
    cp "$CONFIG_DIR/gamemode.ini" "$BACKUP_DIR/"
fi

# Backup OBS configuration
if [ -d "$CONFIG_DIR/obs-studio" ]; then
    echo "✓ Backing up OBS Studio configuration..."
    cp -r "$CONFIG_DIR/obs-studio" "$BACKUP_DIR/"
fi

# Backup shell configurations
echo "✓ Backing up shell configurations..."
[ -f "$HOME/.zshrc" ] && cp "$HOME/.zshrc" "$BACKUP_DIR/"
[ -f "$HOME/.bashrc" ] && cp "$HOME/.bashrc" "$BACKUP_DIR/"
[ -f "$HOME/.bash_profile" ] && cp "$HOME/.bash_profile" "$BACKUP_DIR/"

# Backup fastfetch configuration
if [ -d "$CONFIG_DIR/fastfetch" ]; then
    echo "✓ Backing up fastfetch configuration..."
    cp -r "$CONFIG_DIR/fastfetch" "$BACKUP_DIR/"
fi

# Create a list of installed packages
echo "✓ Creating package list..."
pacman -Qqe > "$BACKUP_DIR/pacman-packages.txt"
pacman -Qqm > "$BACKUP_DIR/aur-packages.txt"

# Create system info file
echo "✓ Creating system info..."
cat > "$BACKUP_DIR/system-info.txt" << EOF
Backup Date: $(date)
Hostname: $(hostname)
Kernel: $(uname -r)
User: $USER

Niri Version: $(niri --version 2>/dev/null || echo "Not installed")
Kitty Version: $(kitty --version 2>/dev/null || echo "Not installed")
PipeWire Version: $(pipewire --version 2>/dev/null || echo "Not installed")
EOF

# Compress backup
echo ""
echo "📦 Compressing backup..."
cd "$HOME/Backups"
tar -czf "$(basename $BACKUP_DIR).tar.gz" "$(basename $BACKUP_DIR)"
rm -rf "$BACKUP_DIR"

echo ""
echo "✅ Backup complete!"
echo "📁 Location: $HOME/Backups/$(basename $BACKUP_DIR).tar.gz"
echo ""
echo "To restore, extract the archive and copy files back to ~/.config/"
#!/bin/bash
# WehttamSnaps Configuration Restore Script
# Restores configuration from backup

echo "🔄 WehttamSnaps Configuration Restore"
echo "====================================="
echo ""

# Check if backup file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <backup-file.tar.gz>"
    echo ""
    echo "Available backups:"
    ls -1 "$HOME/Backups/"*.tar.gz 2>/dev/null || echo "No backups found"
    exit 1
fi

BACKUP_FILE="$1"

# Check if backup file exists
if [ ! -f "$BACKUP_FILE" ]; then
    echo "❌ Error: Backup file not found: $BACKUP_FILE"
    exit 1
fi

# Create temporary directory
TEMP_DIR=$(mktemp -d)
echo "📦 Extracting backup..."
tar -xzf "$BACKUP_FILE" -C "$TEMP_DIR"

# Find the extracted directory
BACKUP_DIR=$(find "$TEMP_DIR" -maxdepth 1 -type d -name "niri-backup-*" | head -1)

if [ -z "$BACKUP_DIR" ]; then
    echo "❌ Error: Invalid backup file"
    rm -rf "$TEMP_DIR"
    exit 1
fi

echo "✓ Backup extracted"
echo ""

# Ask for confirmation
echo "⚠️  This will overwrite your current configuration!"
read -p "Continue? (y/N): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Restore cancelled"
    rm -rf "$TEMP_DIR"
    exit 0
fi

CONFIG_DIR="$HOME/.config"

# Restore configurations
echo ""
echo "📁 Restoring configurations..."

# Restore Niri
if [ -d "$BACKUP_DIR/niri" ]; then
    echo "✓ Restoring Niri configuration..."
    rm -rf "$CONFIG_DIR/niri"
    cp -r "$BACKUP_DIR/niri" "$CONFIG_DIR/"
fi

# Restore Noctalia
if [ -d "$BACKUP_DIR/noctalia" ]; then
    echo "✓ Restoring Noctalia configuration..."
    rm -rf "$CONFIG_DIR/noctalia"
    cp -r "$BACKUP_DIR/noctalia" "$CONFIG_DIR/"
fi

# Restore J.A.R.V.I.S.
if [ -d "$BACKUP_DIR/jarvis" ]; then
    echo "✓ Restoring J.A.R.V.I.S. configuration..."
    rm -rf "$CONFIG_DIR/jarvis"
    cp -r "$BACKUP_DIR/jarvis" "$CONFIG_DIR/"
    chmod +x "$CONFIG_DIR/jarvis/scripts/"*.sh
fi

# Restore Kitty
if [ -d "$BACKUP_DIR/kitty" ]; then
    echo "✓ Restoring Kitty configuration..."
    rm -rf "$CONFIG_DIR/kitty"
    cp -r "$BACKUP_DIR/kitty" "$CONFIG_DIR/"
fi

# Restore audio
if [ -d "$BACKUP_DIR/audio" ]; then
    echo "✓ Restoring audio configuration..."
    rm -rf "$CONFIG_DIR/audio"
    cp -r "$BACKUP_DIR/audio" "$CONFIG_DIR/"
fi

# Restore PipeWire
if [ -d "$BACKUP_DIR/pipewire" ]; then
    echo "✓ Restoring PipeWire configuration..."
    rm -rf "$CONFIG_DIR/pipewire"
    cp -r "$BACKUP_DIR/pipewire" "$CONFIG_DIR/"
fi

# Restore gamemode
if [ -f "$BACKUP_DIR/gamemode.ini" ]; then
    echo "✓ Restoring gamemode configuration..."
    cp "$BACKUP_DIR/gamemode.ini" "$CONFIG_DIR/"
fi

# Restore OBS
if [ -d "$BACKUP_DIR/obs-studio" ]; then
    echo "✓ Restoring OBS Studio configuration..."
    rm -rf "$CONFIG_DIR/obs-studio"
    cp -r "$BACKUP_DIR/obs-studio" "$CONFIG_DIR/"
fi

# Restore shell configurations
echo "✓ Restoring shell configurations..."
[ -f "$BACKUP_DIR/.zshrc" ] && cp "$BACKUP_DIR/.zshrc" "$HOME/"
[ -f "$BACKUP_DIR/.bashrc" ] && cp "$BACKUP_DIR/.bashrc" "$HOME/"
[ -f "$BACKUP_DIR/.bash_profile" ] && cp "$BACKUP_DIR/.bash_profile" "$HOME/"

# Restore fastfetch
if [ -d "$BACKUP_DIR/fastfetch" ]; then
    echo "✓ Restoring fastfetch configuration..."
    rm -rf "$CONFIG_DIR/fastfetch"
    cp -r "$BACKUP_DIR/fastfetch" "$CONFIG_DIR/"
fi

# Clean up
rm -rf "$TEMP_DIR"

echo ""
echo "✅ Restore complete!"
echo ""
echo "📝 Notes:"
echo "  - Restart Niri to apply changes: Mod+Shift+Escape"
echo "  - Restart audio services: systemctl --user restart pipewire wireplumber"
echo "  - Package lists are in the backup for reference"
echo ""
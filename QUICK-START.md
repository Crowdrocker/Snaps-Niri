# WehttamSnaps Niri Setup - Quick Start Guide

> Get up and running in 15 minutes!

## 🚀 Fast Track Installation

### Step 1: Clone Repository (1 minute)
```bash
git clone https://github.com/Crowdrocker/Snaps-Niri.git
cd Snaps-Niri
```

### Step 2: Run Installer (10-15 minutes)
```bash
chmod +x install.sh
./install.sh
```

Select **Option 1: Full Installation** for everything.

### Step 3: Add J.A.R.V.I.S. Sounds (2 minutes)
```bash
# Create your sounds at: https://www.101soundboards.com/
# Place MP3 files in:
mkdir -p ~/.config/jarvis/sounds

# Required files:
# - startup.mp3 (or morning.mp3, afternoon.mp3, evening.mp3)
# - shutdown.mp3
# - notification.mp3
# - warning.mp3
# - gaming.mp3
# - streaming.mp3
```

### Step 4: Reboot (1 minute)
```bash
reboot
```

### Step 5: Select Niri at Login
- At login screen, select "Niri" session
- Login with your credentials

## ✅ You're Done!

### Essential Keybindings

| Action | Keybind |
|--------|---------|
| Terminal | `Mod + Return` |
| App Launcher | `Mod + D` |
| File Manager | `Mod + E` |
| Browser | `Mod + B` |
| Gaming Mode | `Mod + G` |
| Streaming Mode | `Mod + Shift + S` |
| Power Menu | `Mod + Shift + Q` |
| Keybinds Help | `Mod + /` |

**Mod** = Super/Windows key

### Quick Tests

**Test Audio:**
```bash
speaker-test -c 2
```

**Test Gaming Mode:**
```bash
# Press Mod+G
# Should hear J.A.R.V.I.S. say "Gaming mode activated"
```

**Test Streaming:**
```bash
# Press Mod+Shift+S
# Should hear J.A.R.V.I.S. say "Streaming systems online"
```

## 📚 Next Steps

1. **Read Keybindings**: `cat ~/.config/niri/keybinds.kdl`
2. **Customize Colors**: `nano ~/.config/niri/appearance/colors.kdl`
3. **Setup Audio Routing**: See `audio/README.md`
4. **Configure Games**: See `gaming/steam-launch-options/LAUNCH-OPTIONS.md`
5. **Join Discord**: https://discord.gg/nTaknDvdUA

## 🆘 Problems?

See `docs/TROUBLESHOOTING.md` or ask on Discord!

---

**Made with 💜 by WehttamSnaps** | Welcome to your new setup! 🎉
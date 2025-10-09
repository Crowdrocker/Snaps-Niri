# WehttamSnaps Niri Setup - Troubleshooting Guide

Common issues and their solutions for your Niri setup.

## 🔍 Quick Diagnostics

### Run System Check
```bash
# Check Niri
niri --version
niri validate

# Check services
systemctl --user status pipewire
systemctl --user status wireplumber
systemctl --user status gamemoded

# Check GPU
glxinfo | grep "OpenGL renderer"
```

## 🖥️ Niri Issues

### Niri Won't Start

**Symptoms:** Black screen, immediate logout, or error messages

**Solutions:**

1. **Check configuration syntax:**
```bash
niri validate
```

2. **Check logs:**
```bash
journalctl -xe | grep niri
```

3. **Try starting from TTY:**
```bash
# Press Ctrl+Alt+F2
# Login
niri
```

4. **Reset to default config:**
```bash
mv ~/.config/niri ~/.config/niri.backup
cp -r ~/Snaps-Niri/niri ~/.config/
```

### Niri Freezes or Crashes

**Solutions:**

1. **Emergency exit:**
   - Press `Ctrl+Alt+F2` to switch to TTY
   - Kill Niri: `pkill niri`
   - Restart: `niri`

2. **Check system resources:**
```bash
htop
# Look for high CPU/memory usage
```

3. **Check GPU driver:**
```bash
dmesg | grep -i amdgpu
```

### Keybindings Not Working

**Solutions:**

1. **Validate keybinds config:**
```bash
niri validate
```

2. **Check for conflicts:**
```bash
grep -r "Mod+" ~/.config/niri/keybinds.kdl
```

3. **Reload Niri:**
   - Press `Mod+Shift+Escape`

### Windows Not Following Rules

**Solutions:**

1. **Check window class:**
```bash
# In a terminal, run:
niri msg windows
```

2. **Update window rules:**
```bash
nano ~/.config/niri/window-rules.kdl
```

3. **Reload config:**
   - Press `Mod+Shift+Escape`

## 🔊 Audio Issues

### No Sound

**Solutions:**

1. **Check PipeWire status:**
```bash
systemctl --user status pipewire
systemctl --user status wireplumber
```

2. **Restart audio services:**
```bash
systemctl --user restart pipewire
systemctl --user restart wireplumber
```

3. **Check default sink:**
```bash
pactl info | grep "Default Sink"
pactl list sinks short
```

4. **Set default sink:**
```bash
pactl set-default-sink <sink-name>
```

### Audio Crackling/Popping

**Solutions:**

1. **Increase buffer size:**
```bash
nano ~/.config/pipewire/pipewire.conf
```
Add:
```
default.clock.quantum = 2048
default.clock.min-quantum = 1024
```

2. **Restart PipeWire:**
```bash
systemctl --user restart pipewire
```

### Virtual Sinks Disappear

**Solutions:**

1. **Add to startup:**
```bash
# Edit Niri config
nano ~/.config/niri/config.kdl
```
Add:
```kdl
exec-once "~/.config/audio/scripts/create-virtual-sinks.sh"
```

2. **Create systemd service:**
```bash
mkdir -p ~/.config/systemd/user
nano ~/.config/systemd/user/virtual-sinks.service
```
Add:
```ini
[Unit]
Description=Create Virtual Audio Sinks
After=pipewire.service

[Service]
Type=oneshot
ExecStart=/home/wehttamsnaps/.config/audio/scripts/create-virtual-sinks.sh

[Install]
WantedBy=default.target
```
Enable:
```bash
systemctl --user enable --now virtual-sinks.service
```

### Application Not Showing in pavucontrol

**Solutions:**

1. **Check if app is using PipeWire:**
```bash
pactl list sink-inputs
```

2. **Force PipeWire:**
```bash
PULSE_SERVER=unix:/run/user/1000/pulse/native <application>
```

## 🎮 Gaming Issues

### Gamemode Not Activating

**Solutions:**

1. **Check gamemode status:**
```bash
gamemoded -s
```

2. **Check service:**
```bash
systemctl --user status gamemoded
```

3. **Restart service:**
```bash
systemctl --user restart gamemoded
```

4. **Check user group:**
```bash
groups | grep gamemode
# If not present:
sudo usermod -a -G gamemode $USER
# Log out and back in
```

### Low FPS in Games

**Solutions:**

1. **Enable gaming mode:**
   - Press `Mod+G`

2. **Check GPU usage:**
```bash
watch -n 1 cat /sys/class/drm/card0/device/gpu_busy_percent
```

3. **Verify Vulkan:**
```bash
vulkaninfo | grep "deviceName"
```

4. **Check CPU governor:**
```bash
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
# Should be "performance" when gaming
```

5. **Disable compositor effects:**
   - Niri handles this automatically

6. **Check launch options:**
   - See `gaming/steam-launch-options/LAUNCH-OPTIONS.md`

### Steam Games Won't Launch

**Solutions:**

1. **Check Proton version:**
   - Right-click game → Properties → Compatibility
   - Try Proton Experimental or Proton-GE

2. **Check logs:**
```bash
tail -f ~/.steam/steam/logs/stderr.txt
```

3. **Verify game files:**
   - Right-click game → Properties → Local Files → Verify

4. **Clear shader cache:**
```bash
rm -rf ~/.steam/steam/steamapps/shadercache/<game-id>
```

### GPU Temperature Too High

**Solutions:**

1. **Check current temperature:**
```bash
cat /sys/class/drm/card0/device/hwmon/hwmon*/temp1_input
# Divide by 1000 for Celsius
```

2. **Increase fan speed with CoreCtrl:**
```bash
corectrl
```

3. **Check thermal paste:**
   - May need reapplication

4. **Improve case airflow:**
   - Clean dust filters
   - Add more fans if possible

## 🎙️ Streaming Issues

### OBS Won't Capture Screen

**Solutions:**

1. **Check Wayland support:**
```bash
obs --version
# Should show Wayland support
```

2. **Use PipeWire capture:**
   - Add Source → Screen Capture (PipeWire)

3. **Grant portal permissions:**
```bash
flatpak permission-show
```

### Audio Not Captured in OBS

**Solutions:**

1. **Check audio sources:**
   - Settings → Audio
   - Verify correct devices selected

2. **Check qpwgraph routing:**
```bash
qpwgraph
# Verify connections to OBS
```

3. **Restart audio:**
```bash
systemctl --user restart pipewire
```

### Stream Dropping Frames

**Solutions:**

1. **Lower output resolution:**
   - Settings → Video → Output Resolution

2. **Reduce bitrate:**
   - Settings → Output → Bitrate

3. **Use hardware encoding:**
   - Settings → Output → Encoder → H264 (AMD)

4. **Check CPU usage:**
```bash
htop
```

## 🤖 J.A.R.V.I.S. Issues

### Sounds Not Playing

**Solutions:**

1. **Check mpv installation:**
```bash
which mpv
# If not found:
sudo pacman -S mpv
```

2. **Test sound manually:**
```bash
mpv ~/.config/jarvis/sounds/startup.mp3
```

3. **Check script permissions:**
```bash
ls -l ~/.config/jarvis/scripts/
chmod +x ~/.config/jarvis/scripts/*.sh
```

4. **Check sound files exist:**
```bash
ls ~/.config/jarvis/sounds/
```

### Wrong Greeting Time

**Solutions:**

1. **Check system time:**
```bash
date
```

2. **Verify timezone:**
```bash
timedatectl
# Should show America/Chicago
```

3. **Set timezone:**
```bash
sudo timedatectl set-timezone America/Chicago
```

### Startup Sound Not Playing

**Solutions:**

1. **Check Niri config:**
```bash
grep "jarvis-startup" ~/.config/niri/config.kdl
```

2. **Add to config if missing:**
```kdl
exec-once "~/.config/jarvis/scripts/jarvis-startup.sh"
```

## 💻 System Issues

### High CPU Usage

**Solutions:**

1. **Identify process:**
```bash
htop
# Press F5 to sort by CPU
```

2. **Check for runaway processes:**
```bash
ps aux | sort -nrk 3,3 | head -n 5
```

3. **Restart problematic service:**
```bash
systemctl --user restart <service>
```

### High Memory Usage

**Solutions:**

1. **Check memory:**
```bash
free -h
```

2. **Identify memory hogs:**
```bash
ps aux | sort -nrk 4,4 | head -n 5
```

3. **Clear cache:**
```bash
sudo sync; echo 3 | sudo tee /proc/sys/vm/drop_caches
```

### Disk Space Full

**Solutions:**

1. **Check disk usage:**
```bash
df -h
du -sh ~/.cache/*
```

2. **Clean package cache:**
```bash
sudo pacman -Sc
yay -Sc
```

3. **Clean journal logs:**
```bash
sudo journalctl --vacuum-time=7d
```

4. **Clean cache:**
```bash
rm -rf ~/.cache/*
```

### System Won't Boot

**Solutions:**

1. **Boot from live USB**

2. **Chroot into system:**
```bash
mount /dev/sdXY /mnt
arch-chroot /mnt
```

3. **Check logs:**
```bash
journalctl -xb
```

4. **Restore backup:**
```bash
# Extract backup and restore configs
```

## 🔧 Configuration Issues

### Config Changes Not Applied

**Solutions:**

1. **Reload Niri:**
   - Press `Mod+Shift+Escape`

2. **Validate config:**
```bash
niri validate
```

3. **Check for syntax errors:**
```bash
cat ~/.config/niri/config.kdl
```

### Lost Configuration

**Solutions:**

1. **Restore from backup:**
```bash
~/Snaps-Niri/scripts/restore.sh ~/Backups/<backup-file>.tar.gz
```

2. **Clone fresh copy:**
```bash
git clone https://github.com/Crowdrocker/Snaps-Niri.git
cd Snaps-Niri
./install.sh
```

## 🆘 Emergency Recovery

### System Completely Broken

1. **Boot to TTY:**
   - Press `Ctrl+Alt+F2`

2. **Login as your user**

3. **Restore backup:**
```bash
~/Snaps-Niri/scripts/restore.sh ~/Backups/<latest-backup>.tar.gz
```

4. **Or reset to defaults:**
```bash
rm -rf ~/.config/niri
rm -rf ~/.config/noctalia
cd ~/Snaps-Niri
./install.sh
```

### Can't Login

1. **Boot to TTY:**
   - Press `Ctrl+Alt+F2`

2. **Check display manager:**
```bash
sudo systemctl status sddm
```

3. **Restart display manager:**
```bash
sudo systemctl restart sddm
```

4. **Or start Niri manually:**
```bash
niri
```

## 📚 Getting Help

### Before Asking for Help

1. **Check logs:**
```bash
journalctl -xe
journalctl --user -xe
```

2. **Run diagnostics:**
```bash
niri validate
systemctl --user status pipewire
systemctl --user status gamemoded
```

3. **Check system info:**
```bash
fastfetch
uname -a
```

### Where to Get Help

- **Discord**: [WehttamSnaps Community](https://discord.gg/nTaknDvdUA)
- **GitHub Issues**: [Snaps-Niri Issues](https://github.com/Crowdrocker/Snaps-Niri/issues)
- **Niri Matrix**: #niri:matrix.org
- **Arch Forums**: [bbs.archlinux.org](https://bbs.archlinux.org)

### Information to Provide

When asking for help, include:

1. **System info:**
```bash
fastfetch > system-info.txt
```

2. **Relevant logs:**
```bash
journalctl -xe > logs.txt
```

3. **Config files:**
```bash
cat ~/.config/niri/config.kdl
```

4. **What you tried:**
   - List all troubleshooting steps attempted

---

**Made with 💜 by WehttamSnaps** | We'll get through this together! 🛠️
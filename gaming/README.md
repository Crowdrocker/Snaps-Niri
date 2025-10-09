# Gaming Optimizations for WehttamSnaps

> Optimized for Intel i5-4430 + AMD RX 580

This directory contains all gaming-related configurations and optimizations for your Niri setup.

## 🎮 Hardware Optimization

### CPU: Intel i5-4430
- 4 cores / 4 threads
- Base: 3.0 GHz, Boost: 3.2 GHz
- Haswell architecture (2013)

### GPU: AMD RX 580
- 8GB VRAM (or 4GB)
- Polaris architecture
- Excellent 1080p gaming performance
- Well-supported by Mesa drivers

## 📁 Directory Structure

```
gaming/
├── gamemode.ini          # Gamemode configuration
├── corectrl/             # GPU control profiles
├── steam-launch-options/ # Per-game launch options
├── scripts/              # Gaming utility scripts
└── README.md            # This file
```

## 🚀 Performance Optimizations

### 1. Gamemode

Gamemode automatically optimizes system performance when games are running.

**Features:**
- CPU governor set to performance
- Process priority adjustments
- I/O priority optimization
- GPU performance mode

**Usage:**
```bash
# Gamemode activates automatically with Steam games
# Or manually:
gamemoderun ./your-game

# Check status:
gamemoded -s
```

### 2. AMD GPU Optimizations

**Environment Variables (already set in Niri config):**
```bash
AMD_VULKAN_ICD=RADV          # Use RADV Vulkan driver
RADV_PERFTEST=gpl            # Enable GPL features
DXVK_ASYNC=1                 # Async shader compilation
```

### 3. CoreCtrl

Advanced GPU control for AMD cards.

**Profiles:**
- **Normal**: Balanced performance (default)
- **Performance**: Maximum performance for gaming
- **Quiet**: Lower power/noise for light tasks

**Usage:**
```bash
# Start CoreCtrl
corectrl

# Set profile via command line
corectrl --profile performance
```

### 4. LACT (Linux AMDGPU Controller)

Alternative GPU control tool.

```bash
# Start LACT daemon
sudo systemctl enable --now lactd

# Open GUI
lact gui
```

## 🎯 Steam Launch Options

### General Optimizations

```bash
# Basic Proton optimization
PROTON_USE_WINED3D=0 DXVK_ASYNC=1 %command%

# With gamemode
gamemoderun %command%

# With mangohud (performance overlay)
mangohud %command%

# Combined
gamemoderun mangohud DXVK_ASYNC=1 %command%
```

### Game-Specific Launch Options

#### Cyberpunk 2077
```bash
gamemoderun mangohud DXVK_ASYNC=1 PROTON_ENABLE_NVAPI=1 %command%
```

#### The Division 2
```bash
gamemoderun DXVK_ASYNC=1 DXVK_STATE_CACHE_PATH=/home/wehttamsnaps/.cache/dxvk %command%
```

#### Fallout 4
```bash
gamemoderun PROTON_USE_WINED3D=0 DXVK_ASYNC=1 %command%
```

#### Watch Dogs Legion
```bash
gamemoderun mangohud DXVK_ASYNC=1 VKD3D_CONFIG=dxr %command%
```

#### The First Descendant
```bash
gamemoderun DXVK_ASYNC=1 PROTON_ENABLE_NVAPI=1 %command%
```

See `steam-launch-options/` directory for complete list.

## 🔧 System Tweaks

### 1. ZRAM Configuration

Compressed RAM for better memory management.

```bash
# Install zram-generator
sudo pacman -S zram-generator

# Configure
sudo nano /etc/systemd/zram-generator.conf
```

Add:
```ini
[zram0]
zram-size = ram / 2
compression-algorithm = zstd
```

Enable:
```bash
sudo systemctl daemon-reload
sudo systemctl start systemd-zram-setup@zram0.service
```

### 2. CPU Governor

Set CPU to performance mode for gaming.

```bash
# Check current governor
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# Set to performance (temporary)
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# Or use the gaming mode script (Mod+G)
```

### 3. I/O Scheduler

Optimize disk I/O for gaming.

```bash
# Check current scheduler
cat /sys/block/sda/queue/scheduler

# Set to mq-deadline for SSDs
echo mq-deadline | sudo tee /sys/block/sda/queue/scheduler
```

### 4. Swappiness

Reduce swap usage for better gaming performance.

```bash
# Check current value
cat /proc/sys/vm/swappiness

# Set to 10 (temporary)
sudo sysctl vm.swappiness=10

# Make permanent
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
```

## 🎨 Graphics Settings Recommendations

### For RX 580 @ 1080p

**High-End Games (Cyberpunk, Watch Dogs Legion):**
- Resolution: 1920x1080
- Preset: High (not Ultra)
- Anti-aliasing: TAA or FXAA
- V-Sync: Off (use FreeSync if available)
- Target: 60 FPS

**Mid-Range Games (Division 2, Fallout 4):**
- Resolution: 1920x1080
- Preset: Ultra
- Anti-aliasing: MSAA 2x or TAA
- Target: 60+ FPS

**Competitive Games (Warframe, First Descendant):**
- Resolution: 1920x1080
- Preset: Medium-High
- Anti-aliasing: FXAA
- V-Sync: Off
- Target: 100+ FPS

## 📊 Performance Monitoring

### MangoHud

In-game performance overlay.

**Configuration:**
```bash
# Create config
mkdir -p ~/.config/MangoHud
nano ~/.config/MangoHud/MangoHud.conf
```

Add:
```ini
fps
frametime
cpu_temp
gpu_temp
gpu_core_clock
gpu_mem_clock
vram
ram
fps_limit=0
position=top-left
```

### btop/htop

System monitoring in terminal.

```bash
# Modern alternative
btop

# Classic
htop
```

## 🎮 Game Modding

### Nexus Mods App

Official mod manager for Linux.

```bash
# Install from AUR
yay -S nexusmods-app-bin

# Launch
nexusmods-app
```

Currently supports:
- Cyberpunk 2077
- More games coming soon

### Steam Tinker Launch

Advanced mod manager for Steam games.

```bash
# Install
yay -S steamtinkerlaunch

# Configure for Vortex/MO2
stl vortex
```

## 🔥 Troubleshooting

### Game Won't Start

1. Check Proton version
2. Try different Proton versions (Experimental, GE)
3. Check ProtonDB for game-specific fixes
4. Verify game files in Steam

### Low FPS

1. Enable gamemode: `Mod+G`
2. Check GPU usage with MangoHud
3. Verify GPU is in performance mode
4. Check CPU temperature
5. Close background applications

### Stuttering

1. Enable DXVK_ASYNC
2. Increase shader cache size
3. Check disk I/O with `iotop`
4. Verify RAM usage

### Audio Issues

1. Check PipeWire status: `systemctl --user status pipewire`
2. Restart audio: `systemctl --user restart pipewire`
3. Check audio routing with qpwgraph

## 📚 Resources

- [ProtonDB](https://www.protondb.com/) - Game compatibility database
- [GamingOnLinux](https://www.gamingonlinux.com/) - Linux gaming news
- [r/linux_gaming](https://reddit.com/r/linux_gaming) - Community support
- [Arch Wiki - Gaming](https://wiki.archlinux.org/title/Gaming)

## 🎯 Quick Commands

```bash
# Activate gaming mode
Mod+G

# Launch Steam
Mod+Alt+S

# Check GPU stats
watch -n 1 cat /sys/class/drm/card0/device/hwmon/hwmon*/temp1_input

# Monitor system
btop

# Check game performance
mangohud glxgears
```

---

**Made with 💜 by WehttamSnaps** | Game on! 🎮
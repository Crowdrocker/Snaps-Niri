# Audio Routing Setup for WehttamSnaps

> Advanced audio routing with PipeWire and qpwgraph - Like Voicemeeter for Linux!

This guide will help you set up advanced audio routing similar to Voicemeeter on Windows, allowing you to separate and control audio from different sources (games, browser, Discord, Spotify).

## 🎵 Overview

**PipeWire** is a modern audio server that replaces PulseAudio and JACK, providing:
- Low latency audio
- Advanced routing capabilities
- Virtual audio devices
- Per-application audio control
- Professional audio features

**qpwgraph** is a graphical patchbay for PipeWire, similar to:
- Voicemeeter (Windows)
- JACK patchbay
- Audio MIDI Setup (macOS)

## 📁 Directory Structure

```
audio/
├── pipewire/              # PipeWire configurations
│   ├── pipewire.conf
│   └── pipewire-pulse.conf
├── qpwgraph/              # Routing presets
│   ├── gaming.qpwgraph
│   ├── streaming.qpwgraph
│   └── default.qpwgraph
├── scripts/               # Audio utility scripts
│   ├── setup-streaming-audio.sh
│   ├── reset-audio-routing.sh
│   └── create-virtual-sinks.sh
└── README.md             # This file
```

## 🚀 Quick Start

### 1. Install Required Packages

```bash
# Core audio (should already be installed)
sudo pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber

# GUI tools
sudo pacman -S pavucontrol qpwgraph

# Optional: Advanced tools
sudo pacman -S helvum easyeffects
```

### 2. Enable PipeWire Services

```bash
# Enable and start PipeWire
systemctl --user enable --now pipewire
systemctl --user enable --now pipewire-pulse
systemctl --user enable --now wireplumber

# Verify services are running
systemctl --user status pipewire
systemctl --user status wireplumber
```

### 3. Test Audio

```bash
# Test speaker output
speaker-test -c 2

# Play a test sound
paplay /usr/share/sounds/freedesktop/stereo/bell.oga

# Check audio devices
pactl list sinks
pactl list sources
```

## 🎛️ Basic Audio Control with pavucontrol

**pavucontrol** is your simple volume mixer (like Windows Volume Mixer).

### Launch pavucontrol
```bash
pavucontrol
```

### Tabs Explained

1. **Playback**: Control volume of playing applications
2. **Recording**: Control recording applications
3. **Output Devices**: Your speakers/headphones
4. **Input Devices**: Your microphones
5. **Configuration**: Audio device profiles

### Quick Tasks

**Change application output:**
1. Open pavucontrol
2. Go to "Playback" tab
3. Click dropdown next to application
4. Select output device

**Set default output:**
1. Go to "Output Devices" tab
2. Click green checkmark on desired device

## 🔌 Advanced Routing with qpwgraph

**qpwgraph** is your advanced routing tool (like Voicemeeter).

### Launch qpwgraph
```bash
qpwgraph
```

### Interface Overview

- **Left side**: Audio sources (outputs from apps)
- **Right side**: Audio destinations (inputs to devices)
- **Lines**: Audio connections
- **Colors**: Different types of audio streams

### Basic Routing

1. **Drag and drop** from source to destination
2. **Right-click** to disconnect
3. **Save preset** for quick loading

## 🎮 Gaming Audio Setup

### Goal: Separate Game, Discord, and Music

#### Step 1: Create Virtual Sinks

```bash
# Run the virtual sink creation script
~/.config/audio/scripts/create-virtual-sinks.sh
```

Or manually:
```bash
# Create virtual sinks
pactl load-module module-null-sink sink_name=game_sink sink_properties=device.description="Game_Audio"
pactl load-module module-null-sink sink_name=discord_sink sink_properties=device.description="Discord_Audio"
pactl load-module module-null-sink sink_name=music_sink sink_properties=device.description="Music_Audio"
pactl load-module module-null-sink sink_name=browser_sink sink_properties=device.description="Browser_Audio"
```

#### Step 2: Route Applications

**In pavucontrol:**
1. Open pavucontrol
2. Go to "Playback" tab
3. For each application:
   - Game → Game_Audio
   - Discord → Discord_Audio
   - Spotify → Music_Audio
   - Browser → Browser_Audio

#### Step 3: Mix to Output

**In qpwgraph:**
1. Connect each virtual sink to your speakers
2. Adjust volumes in pavucontrol
3. Save preset as "gaming.qpwgraph"

### Visual Diagram

```
┌─────────┐     ┌──────────────┐     ┌──────────┐
│  Game   │────▶│  Game_Audio  │────▶│          │
└─────────┘     └──────────────┘     │          │
                                      │ Speakers │
┌─────────┐     ┌──────────────┐     │    or    │
│ Discord │────▶│Discord_Audio │────▶│Headphones│
└─────────┘     └──────────────┘     │          │
                                      │          │
┌─────────┐     ┌──────────────┐     │          │
│ Spotify │────▶│ Music_Audio  │────▶│          │
└─────────┘     └──────────────┘     └──────────┘
```

## 🎙️ Streaming Audio Setup

### Goal: Separate Audio Channels for OBS

#### Step 1: Create Streaming Sinks

```bash
# Run streaming audio setup
~/.config/audio/scripts/setup-streaming-audio.sh
```

This creates:
- **Desktop_Audio**: All desktop sounds
- **Game_Audio**: Game only
- **Mic_Audio**: Your microphone
- **Discord_Audio**: Discord (for monitoring, not streamed)

#### Step 2: Configure OBS

1. Open OBS Studio
2. Add audio sources:
   - **Desktop Audio**: Desktop_Audio.monitor
   - **Game Audio**: Game_Audio.monitor
   - **Mic/Aux**: Your microphone
3. Mute Discord_Audio in OBS (for monitoring only)

#### Step 3: Route in qpwgraph

```
┌──────────┐     ┌──────────────┐     ┌─────────┐
│   Game   │────▶│  Game_Audio  │────▶│   OBS   │
└──────────┘     └──────────────┘     │         │
                                       │ Stream  │
┌──────────┐     ┌──────────────┐     │ Output  │
│ Browser  │────▶│Desktop_Audio │────▶│         │
└──────────┘     └──────────────┘     └─────────┘
                                             │
┌──────────┐     ┌──────────────┐           │
│   Mic    │────▶│  Mic_Audio   │───────────┘
└──────────┘     └──────────────┘
                                       ┌─────────┐
┌──────────┐     ┌──────────────┐     │         │
│ Discord  │────▶│Discord_Audio │────▶│Speakers │
└──────────┘     └──────────────┘     │  Only   │
                                       └─────────┘
```

### Benefits

- **Game audio** goes to stream
- **Discord audio** you hear but stream doesn't
- **Mic audio** goes to stream and Discord
- **Browser audio** goes to stream
- Full control over each channel

## 🎚️ Volume Control Strategies

### Method 1: pavucontrol (Simple)

Use pavucontrol for quick volume adjustments:
- Each virtual sink has its own volume
- Each application has its own volume
- Master output volume

### Method 2: qpwgraph (Advanced)

Use qpwgraph for routing and mixing:
- Visual representation
- Save/load presets
- Complex routing scenarios

### Method 3: Command Line

```bash
# List all sinks
pactl list sinks short

# Set volume (0-65536, 65536 = 100%)
pactl set-sink-volume game_sink 50000

# Mute/unmute
pactl set-sink-mute game_sink toggle

# Move application to sink
pactl move-sink-input <input-id> game_sink
```

## 🎯 Common Scenarios

### Scenario 1: Gaming with Friends

**Setup:**
- Game → Game_Audio → Speakers (loud)
- Discord → Discord_Audio → Speakers (medium)
- Music → Music_Audio → Speakers (quiet)

**Keybind:** `Mod+G` activates gaming mode

### Scenario 2: Streaming Gameplay

**Setup:**
- Game → Game_Audio → OBS + Speakers
- Discord → Discord_Audio → Speakers only
- Mic → Mic_Audio → OBS + Discord
- Browser → Desktop_Audio → OBS + Speakers

**Keybind:** `Mod+Shift+S` activates streaming mode

### Scenario 3: Recording Tutorial

**Setup:**
- Desktop → Desktop_Audio → OBS
- Mic → Mic_Audio → OBS
- Monitor → Monitor_Audio → Speakers only

### Scenario 4: Music Production

**Setup:**
- DAW → DAW_Audio → Speakers
- Reference → Music_Audio → Speakers
- Low latency mode enabled

## 🔧 Troubleshooting

### No Sound

```bash
# Check if PipeWire is running
systemctl --user status pipewire

# Restart PipeWire
systemctl --user restart pipewire
systemctl --user restart wireplumber

# Check default sink
pactl info | grep "Default Sink"
```

### Application Not Showing in pavucontrol

```bash
# Check if application is using PipeWire
pactl list sink-inputs

# Force application to use PipeWire
PULSE_SERVER=unix:/run/user/1000/pulse/native ./application
```

### Virtual Sinks Disappear After Reboot

Create a startup script:
```bash
# Add to ~/.config/niri/config.kdl
exec-once "~/.config/audio/scripts/create-virtual-sinks.sh"
```

### Audio Crackling/Popping

```bash
# Edit PipeWire config
nano ~/.config/pipewire/pipewire.conf

# Increase buffer size
default.clock.quantum = 2048
default.clock.min-quantum = 1024
```

### High Latency

```bash
# Decrease buffer size (may cause crackling)
default.clock.quantum = 512
default.clock.min-quantum = 256
```

## 📊 Monitoring Audio

### Real-time Monitoring

```bash
# Watch audio levels
pw-top

# Monitor specific sink
pactl subscribe
```

### Check Latency

```bash
# Show current latency
pw-metadata -n settings

# Test latency
pw-cat -p test.wav
```

## 💾 Saving Presets

### qpwgraph Presets

1. Set up your routing
2. File → Save As
3. Name it (e.g., "gaming.qpwgraph")
4. Load with File → Open

### Automatic Loading

Add to Niri config:
```kdl
exec-once "qpwgraph -a ~/.config/audio/qpwgraph/gaming.qpwgraph"
```

## 🎨 Advanced Features

### EasyEffects (Audio Processing)

```bash
# Install
sudo pacman -S easyeffects

# Launch
easyeffects
```

Features:
- Equalizer
- Compressor
- Limiter
- Reverb
- Noise reduction

### Loopback Devices

```bash
# Create loopback
pactl load-module module-loopback latency_msec=1
```

### Network Audio

```bash
# Stream to another device
pactl load-module module-tunnel-sink server=192.168.1.100
```

## 📚 Cheat Sheet

### Quick Commands

```bash
# List devices
pactl list sinks short
pactl list sources short

# Set default
pactl set-default-sink <sink-name>
pactl set-default-source <source-name>

# Volume control
pactl set-sink-volume <sink> +5%
pactl set-sink-volume <sink> -5%
pactl set-sink-mute <sink> toggle

# Move application
pactl move-sink-input <id> <sink>

# Create virtual sink
pactl load-module module-null-sink sink_name=my_sink

# Remove virtual sink
pactl unload-module <module-id>
```

### Useful Aliases

Add to `~/.zshrc` or `~/.bashrc`:
```bash
alias audio-restart='systemctl --user restart pipewire wireplumber'
alias audio-devices='pactl list sinks short'
alias audio-apps='pactl list sink-inputs'
alias audio-graph='qpwgraph'
alias audio-mixer='pavucontrol'
```

## 🆘 Emergency Reset

If audio is completely broken:

```bash
# Kill all audio processes
systemctl --user stop pipewire wireplumber
killall pipewire pipewire-pulse wireplumber

# Remove configs
rm -rf ~/.config/pipewire

# Restart
systemctl --user start pipewire wireplumber

# Reboot if needed
reboot
```

## 📖 Additional Resources

- [PipeWire Wiki](https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/home)
- [Arch Wiki - PipeWire](https://wiki.archlinux.org/title/PipeWire)
- [qpwgraph GitHub](https://github.com/rncbc/qpwgraph)
- [PipeWire FAQ](https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/FAQ)

---

**Made with 💜 by WehttamSnaps** | Master your audio! 🎵
# WehttamSnaps Niri Keybindings Cheat Sheet

<div align="center">
  <img src="https://img.shields.io/badge/Niri-Keybindings-8A2BE2?style=for-the-badge" alt="Niri Keybindings">
</div>

This document provides a comprehensive reference for all keyboard shortcuts in the WehttamSnaps Niri setup.

## Table of Contents

- [General Controls](#general-controls)
- [Window Management](#window-management)
- [Workspace Navigation](#workspace-navigation)
- [Layout Controls](#layout-controls)
- [WehttamSnaps Special Features](#wehttamsnaps-special-features)
- [Media Controls](#media-controls)
- [System Controls](#system-controls)
- [Screenshots & Recording](#screenshots--recording)

## General Controls

| Key Combination | Action | Description |
|----------------|--------|-------------|
| `Mod+Return` | Open terminal | Opens Kitty terminal |
| `Mod+d` | Application launcher | Opens Fuzzel launcher |
| `Mod+Shift+r` | Reload config | Reloads Niri configuration |
| `Mod+Shift+q` | Quit Niri | Exits the Niri compositor |

## Window Management

| Key Combination | Action | Description |
|----------------|--------|-------------|
| `Mod+q` | Close window | Closes the focused window |
| `Mod+f` | Toggle fullscreen | Toggles fullscreen for the focused window |
| `Mod+Shift+space` | Toggle floating | Toggles floating mode for the focused window |
| `Mod+Left` | Focus left | Focuses the window to the left |
| `Mod+Right` | Focus right | Focuses the window to the right |
| `Mod+Up` | Focus up | Focuses the window above |
| `Mod+Down` | Focus down | Focuses the window below |
| `Mod+Shift+Left` | Move left | Moves the focused window left |
| `Mod+Shift+Right` | Move right | Moves the focused window right |
| `Mod+Shift+Up` | Move up | Moves the focused window up |
| `Mod+Shift+Down` | Move down | Moves the focused window down |
| `Mod+r` | Resize mode | Enters resize mode for the focused window |
| `Mod+m` | Move mode | Enters move mode for the focused window |

## Workspace Navigation

| Key Combination | Action | Description |
|----------------|--------|-------------|
| `Mod+1` | Workspace 1 | Switches to workspace 1 |
| `Mod+2` | Workspace 2 | Switches to workspace 2 |
| `Mod+3` | Workspace 3 | Switches to workspace 3 |
| `Mod+4` | Workspace 4 | Switches to workspace 4 |
| `Mod+5` | Workspace 5 | Switches to workspace 5 |
| `Mod+6` | Workspace 6 | Switches to workspace 6 |
| `Mod+7` | Workspace 7 | Switches to workspace 7 |
| `Mod+8` | Workspace 8 | Switches to workspace 8 |
| `Mod+9` | Workspace 9 | Switches to workspace 9 |
| `Mod+Shift+1` | Move to workspace 1 | Moves focused window to workspace 1 |
| `Mod+Shift+2` | Move to workspace 2 | Moves focused window to workspace 2 |
| `Mod+Shift+3` | Move to workspace 3 | Moves focused window to workspace 3 |
| `Mod+Shift+4` | Move to workspace 4 | Moves focused window to workspace 4 |
| `Mod+Shift+5` | Move to workspace 5 | Moves focused window to workspace 5 |
| `Mod+Shift+6` | Move to workspace 6 | Moves focused window to workspace 6 |
| `Mod+Shift+7` | Move to workspace 7 | Moves focused window to workspace 7 |
| `Mod+Shift+8` | Move to workspace 8 | Moves focused window to workspace 8 |
| `Mod+Shift+9` | Move to workspace 9 | Moves focused window to workspace 9 |

## Layout Controls

| Key Combination | Action | Description |
|----------------|--------|-------------|
| `Mod+s` | Stacking layout | Switches to stacking layout |
| `Mod+t` | Tabbed layout | Switches to tabbed layout |
| `Mod+e` | Toggle split | Toggles between horizontal and vertical split |
| `Mod+v` | Split vertically | Forces a vertical split for the next window |
| `Mod+h` | Split horizontally | Forces a horizontal split for the next window |

## WehttamSnaps Special Features

| Key Combination | Action | Description |
|----------------|--------|-------------|
| `Mod+g` | Gaming mode | Activates gaming mode with optimized settings |
| `Mod+w` | Work mode | Activates work mode for productivity |
| `Mod+j` | J.A.R.V.I.S. assistant | Opens the J.A.R.V.I.S. assistant interface |
| `Mod+Shift+g` | Gaming launcher | Opens the gaming application launcher |
| `Mod+Shift+w` | Work launcher | Opens the work application launcher |
| `Mod+a` | Audio control | Opens the audio control widget |
| `Mod+k` | Keybinds display | Shows this keybinding cheat sheet |

## Media Controls

| Key Combination | Action | Description |
|----------------|--------|-------------|
| `XF86AudioRaiseVolume` | Volume up | Increases system volume |
| `XF86AudioLowerVolume` | Volume down | Decreases system volume |
| `XF86AudioMute` | Mute | Toggles audio mute |
| `XF86AudioPlay` | Play/Pause | Toggles media playback |
| `XF86AudioNext` | Next track | Skips to the next track |
| `XF86AudioPrev` | Previous track | Returns to the previous track |
| `XF86AudioStop` | Stop | Stops media playback |
| `XF86MonBrightnessUp` | Brightness up | Increases screen brightness |
| `XF86MonBrightnessDown` | Brightness down | Decreases screen brightness |

## System Controls

| Key Combination | Action | Description |
|----------------|--------|-------------|
| `Mod+Shift+e` | Power menu | Opens the J.A.R.V.I.S. power menu |
| `Mod+Shift+s` | System monitor | Opens the system monitor widget |
| `Mod+Shift+x` | Lock screen | Locks the screen |
| `Mod+Shift+BackSpace` | Exit menu | Opens the session exit menu |

## Screenshots & Recording

| Key Combination | Action | Description |
|----------------|--------|-------------|
| `Print` | Full screenshot | Captures the entire screen |
| `Shift+Print` | Area screenshot | Captures a selected area |
| `Ctrl+Print` | Window screenshot | Captures the active window |
| `Mod+Print` | Screenshot menu | Opens the screenshot options menu |
| `Mod+Shift+r` | Screen recording | Starts/stops screen recording |

## Customizing Keybindings

To customize these keybindings, edit the `~/.config/niri/modules/keybinds.kdl` file and run the build script:

```bash
nano ~/.config/niri/modules/keybinds.kdl
~/.config/niri/build_config.sh
```

## Viewing Keybindings in J.A.R.V.I.S.

You can also view these keybindings in the J.A.R.V.I.S. interface by pressing `Mod+k` or using the Keybinds Display widget.

---

<div align="center">
  <p>WehttamSnaps Niri Setup | <a href="https://github.com/Crowdrocker/Snaps-Niri">GitHub Repository</a></p>
</div>
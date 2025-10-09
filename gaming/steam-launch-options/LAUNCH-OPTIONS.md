# Steam Launch Options for WehttamSnaps

Complete launch options for all games in your library, optimized for AMD RX 580.

## 🎮 General Template

```bash
# Basic optimization
gamemoderun DXVK_ASYNC=1 %command%

# With performance overlay
gamemoderun mangohud DXVK_ASYNC=1 %command%

# Maximum performance
gamemoderun mangohud DXVK_ASYNC=1 RADV_PERFTEST=gpl PROTON_ENABLE_NVAPI=1 %command%
```

## 📋 Game-Specific Launch Options

### Call of Duty HQ
```bash
gamemoderun DXVK_ASYNC=1 PROTON_ENABLE_NVAPI=1 PROTON_NO_ESYNC=1 %command%
```
**Notes:** 
- May require specific Proton version (try Proton-GE)
- Anti-cheat may cause issues

### Cyberpunk 2077
```bash
gamemoderun mangohud DXVK_ASYNC=1 PROTON_ENABLE_NVAPI=1 RADV_PERFTEST=gpl %command%
```
**Recommended Settings:**
- Resolution: 1920x1080
- Preset: High
- Ray Tracing: Off (RX 580 limitation)
- FSR: Quality mode

### Fallout 4
```bash
gamemoderun DXVK_ASYNC=1 PROTON_USE_WINED3D=0 %command%
```
**Notes:**
- Disable V-Sync in-game
- Cap FPS to 60 (physics issues above 60)
- Install Unofficial Patch via Nexus Mods

### FarCry 5
```bash
gamemoderun mangohud DXVK_ASYNC=1 %command%
```
**Recommended Settings:**
- Preset: High
- Anti-aliasing: TAA
- Motion Blur: Off

### Ghost Recon Breakpoint
```bash
gamemoderun DXVK_ASYNC=1 PROTON_ENABLE_NVAPI=1 %command%
```
**Notes:**
- Requires Ubisoft Connect
- May need Proton-GE

### Marvel's Avengers
```bash
gamemoderun DXVK_ASYNC=1 DXVK_STATE_CACHE_PATH=/home/wehttamsnaps/.cache/dxvk %command%
```
**Notes:**
- First launch may take time (shader compilation)
- Requires Square Enix account

### Need for Speed Payback
```bash
gamemoderun DXVK_ASYNC=1 PROTON_NO_ESYNC=1 %command%
```
**Notes:**
- May require Origin/EA App
- Disable in-game overlay

### Rise of the Tomb Raider
```bash
gamemoderun mangohud DXVK_ASYNC=1 PROTON_USE_WINED3D=0 %command%
```
**Recommended Settings:**
- Preset: Very High
- Anti-aliasing: FXAA
- V-Sync: Off

### Shadow of the Tomb Raider
```bash
gamemoderun mangohud DXVK_ASYNC=1 RADV_PERFTEST=gpl %command%
```
**Recommended Settings:**
- Preset: High
- Ray Tracing: Off
- Anti-aliasing: TAA

### The First Descendant
```bash
gamemoderun mangohud DXVK_ASYNC=1 PROTON_ENABLE_NVAPI=1 %command%
```
**Notes:**
- Free-to-play
- Requires Nexon account
- May need Proton-GE for anti-cheat

### Tom Clancy's The Division
```bash
gamemoderun DXVK_ASYNC=1 DXVK_STATE_CACHE_PATH=/home/wehttamsnaps/.cache/dxvk %command%
```
**Recommended Settings:**
- Preset: High
- Object Detail: Medium (CPU bottleneck)

### Tom Clancy's The Division 2
```bash
gamemoderun mangohud DXVK_ASYNC=1 PROTON_ENABLE_NVAPI=1 %command%
```
**Recommended Settings:**
- Preset: High
- DX12: Yes (via DXVK)
- V-Sync: Off

### Warframe
```bash
gamemoderun mangohud DXVK_ASYNC=1 %command%
```
**Recommended Settings:**
- Preset: High
- Motion Blur: Off
- Target: 100+ FPS

### Watch_Dogs
```bash
gamemoderun DXVK_ASYNC=1 PROTON_USE_WINED3D=0 %command%
```
**Notes:**
- Older game, should run maxed out
- Disable Uplay overlay

### Watch_Dogs 2
```bash
gamemoderun mangohud DXVK_ASYNC=1 RADV_PERFTEST=gpl %command%
```
**Recommended Settings:**
- Preset: High
- Temporal Filtering: On
- MSAA: Off (use TAA)

### Watch_Dogs Legion
```bash
gamemoderun mangohud DXVK_ASYNC=1 VKD3D_CONFIG=dxr PROTON_ENABLE_NVAPI=1 %command%
```
**Recommended Settings:**
- Preset: High
- Ray Tracing: Off
- DLSS: N/A (AMD card)
- Quality: High

## 🔧 Environment Variables Explained

### DXVK_ASYNC=1
- Enables async shader compilation
- Reduces stuttering on first run
- Essential for smooth gameplay

### gamemoderun
- Activates Gamemode optimizations
- Sets CPU governor to performance
- Adjusts process priorities

### mangohud
- Shows performance overlay
- Displays FPS, temps, usage
- Configurable in ~/.config/MangoHud/

### PROTON_ENABLE_NVAPI=1
- Enables NVIDIA API translation
- Useful for some games expecting NVIDIA features
- Works with AMD cards via translation

### RADV_PERFTEST=gpl
- Enables GPL (Graphics Pipeline Library)
- Improves shader compilation
- AMD-specific optimization

### PROTON_USE_WINED3D=0
- Forces DXVK instead of WineD3D
- Better performance in most cases
- Default for modern Proton

### PROTON_NO_ESYNC=1
- Disables ESYNC
- Use if game has sync issues
- Try removing if game works fine

### VKD3D_CONFIG=dxr
- Enables DirectX Raytracing translation
- For games with DX12 RT
- Limited benefit on RX 580

## 📊 Performance Expectations (1080p)

| Game | Settings | Expected FPS |
|------|----------|--------------|
| Cyberpunk 2077 | High | 45-60 |
| Division 2 | High | 60-80 |
| Fallout 4 | Ultra | 60 (capped) |
| FarCry 5 | High | 60-75 |
| Warframe | High | 100+ |
| Watch Dogs Legion | High | 50-60 |
| Tomb Raider | Very High | 70-90 |

## 🎯 Quick Tips

1. **First Launch**: Expect stuttering during shader compilation
2. **Proton Version**: Try Proton-GE if official Proton has issues
3. **Shader Cache**: Located in `~/.cache/dxvk` and `~/.steam/steam/steamapps/shadercache/`
4. **ProtonDB**: Check [protondb.com](https://protondb.com) for game-specific fixes
5. **Logs**: Check `~/.steam/steam/logs/` for errors

## 🔍 Troubleshooting

### Game crashes on launch
```bash
# Try without DXVK_ASYNC
gamemoderun %command%

# Try different Proton version
# Right-click game → Properties → Compatibility → Select Proton version
```

### Poor performance
```bash
# Add performance monitoring
mangohud %command%

# Check if gamemode is active
gamemoded -s
```

### Black screen
```bash
# Try windowed mode first
gamemoderun %command% -windowed

# Or borderless
gamemoderun %command% -borderless
```

## 📚 Additional Resources

- [ProtonDB](https://www.protondb.com/) - Community reports
- [Proton-GE](https://github.com/GloriousEggroll/proton-ge-custom) - Enhanced Proton
- [Steam Tinker Launch](https://github.com/sonic2kk/steamtinkerlaunch) - Advanced tweaking

---

**Made with 💜 by WehttamSnaps** | Happy Gaming! 🎮
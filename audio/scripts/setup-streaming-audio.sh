#!/bin/bash
# Setup Audio Routing for Streaming
# WehttamSnaps Streaming Audio Configuration

echo "Setting up streaming audio configuration..."

# Create virtual sinks for streaming
pactl load-module module-null-sink \
    sink_name=stream_game \
    sink_properties=device.description="Stream_Game"

pactl load-module module-null-sink \
    sink_name=stream_desktop \
    sink_properties=device.description="Stream_Desktop"

pactl load-module module-null-sink \
    sink_name=stream_music \
    sink_properties=device.description="Stream_Music"

# Discord (monitoring only, not streamed)
pactl load-module module-null-sink \
    sink_name=discord_monitor \
    sink_properties=device.description="Discord_Monitor"

# Create loopback for monitoring
# This allows you to hear what's being streamed
pactl load-module module-loopback \
    source=stream_game.monitor \
    latency_msec=1

pactl load-module module-loopback \
    source=stream_desktop.monitor \
    latency_msec=1

pactl load-module module-loopback \
    source=discord_monitor.monitor \
    latency_msec=1

echo "Streaming audio setup complete!"
echo ""
echo "Configuration:"
echo "  - Stream_Game: For game audio (goes to OBS)"
echo "  - Stream_Desktop: For desktop audio (goes to OBS)"
echo "  - Stream_Music: For music (goes to OBS)"
echo "  - Discord_Monitor: For Discord (you hear, stream doesn't)"
echo ""
echo "In OBS, add these audio sources:"
echo "  1. Stream_Game.monitor"
echo "  2. Stream_Desktop.monitor"
echo "  3. Your microphone"
echo ""
echo "Route applications in pavucontrol:"
echo "  - Game → Stream_Game"
echo "  - Browser → Stream_Desktop"
echo "  - Spotify → Stream_Music"
echo "  - Discord → Discord_Monitor"
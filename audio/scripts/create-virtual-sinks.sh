#!/bin/bash
# Create Virtual Audio Sinks for Advanced Routing
# WehttamSnaps Audio Setup

echo "Creating virtual audio sinks..."

# Game Audio
pactl load-module module-null-sink \
    sink_name=game_sink \
    sink_properties=device.description="Game_Audio"

# Discord Audio
pactl load-module module-null-sink \
    sink_name=discord_sink \
    sink_properties=device.description="Discord_Audio"

# Music Audio (Spotify, etc.)
pactl load-module module-null-sink \
    sink_name=music_sink \
    sink_properties=device.description="Music_Audio"

# Browser Audio
pactl load-module module-null-sink \
    sink_name=browser_sink \
    sink_properties=device.description="Browser_Audio"

# Desktop Audio (everything else)
pactl load-module module-null-sink \
    sink_name=desktop_sink \
    sink_properties=device.description="Desktop_Audio"

echo "Virtual sinks created successfully!"
echo ""
echo "Available sinks:"
pactl list sinks short | grep -E "(game|discord|music|browser|desktop)_sink"
echo ""
echo "Use pavucontrol to route applications to these sinks."
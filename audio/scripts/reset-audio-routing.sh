#!/bin/bash
# Reset Audio Routing to Default
# WehttamSnaps Audio Reset Script

echo "Resetting audio routing to default..."

# Get list of loaded modules
MODULES=$(pactl list modules short | grep -E "(null-sink|loopback)" | awk '{print $1}')

# Unload all virtual sinks and loopbacks
for MODULE in $MODULES; do
    echo "Unloading module $MODULE..."
    pactl unload-module "$MODULE"
done

# Restart PipeWire services
echo "Restarting PipeWire services..."
systemctl --user restart pipewire
systemctl --user restart wireplumber

sleep 2

echo "Audio routing reset complete!"
echo ""
echo "All virtual sinks and loopbacks have been removed."
echo "Audio is now using default configuration."
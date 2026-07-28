#!/bin/bash
#
# setup-brightness.sh
#
# Wires up i3 brightness keybindings on this machine, if brightnessctl
# is available. Safe to re-run.

set -e

CONFIG_DIR="$HOME/.config/i3/config.d"
TARGET="$CONFIG_DIR/10-brightness.conf"

if ! command -v brightnessctl &> /dev/null; then
    echo "brightnessctl is not installed." >&2
    echo "Install it first: sudo pacman -S brightnessctl" >&2
    exit 1
fi

if [ ! -d "$CONFIG_DIR" ]; then
    echo "$CONFIG_DIR does not exist." >&2
    echo "Deploy the i3 dotfiles first (dotfiles/deploy.sh --target i3)." >&2
    exit 1
fi

cat > "$TARGET" <<'CONF'
bindsym XF86MonBrightnessUp exec --no-startup-id brightnessctl set 5%+
bindsym XF86MonBrightnessDown exec --no-startup-id brightnessctl set 5%-
CONF

echo "Wrote $TARGET"
echo "Reload i3 to apply: i3-msg reload"
#!/bin/bash

# Script to adjust the brightness of a display in increments of .1.

# Get the direction of the adjustment (+brightness/-brightness) and
# the amount to adjust the brightness between the range of 0 to 100.
if [[ "$1" == "+" ]]; then
  DIRECTION="+"
elif [[ "$1" == "-" ]]; then
  DIRECTION="-"
else
  echo "Invalid argument. Usage: brightness.sh [+/-]"
  exit 1
fi

STEP=10

# Get the name of the monitor display. If multiple displays are connected, 
# this will get the first display with " connected" in the output.
MONITOR=$(xrandr | grep " connected" | cut -d" " -f1)

# Get the current brightness level of the display.
CURRENT_BRIGHTNESS=$(xrandr --verbose --current | grep ^"$MONITOR" -A5 | tail -n1 | cut -f2 -d' ')

# Convert the current brightness to an integer value between 0 and 100.
CURRENT_BRIGHTNESS_INTEGER=$(printf "%.0f" "$(echo "$CURRENT_BRIGHTNESS*100" | bc)")

# Calculate the new brightness integer.
if [[ "$DIRECTION" == "+" ]]; then
  NEW_BRIGHTNESS_INTEGER=$((CURRENT_BRIGHTNESS_INTEGER + STEP))
elif [[ "$DIRECTION" == "-" ]]; then
  NEW_BRIGHTNESS_INTEGER=$((CURRENT_BRIGHTNESS_INTEGER - STEP))
fi

# Check that the new brightness integer is within the allowed range.
if (( NEW_BRIGHTNESS_INTEGER < 0 )); then
  NEW_BRIGHTNESS_INTEGER=0
elif (( NEW_BRIGHTNESS_INTEGER > 100 )); then
  NEW_BRIGHTNESS_INTEGER=100
fi

# Convert the new brightness integer back to a decimal value.
NEW_BRIGHTNESS=$(echo "scale=2; $NEW_BRIGHTNESS_INTEGER/100" | bc)

# Set the new brightness of the display.
xrandr --output "$MONITOR" --brightness "$NEW_BRIGHTNESS"

# Print the new brightness of the display.
echo "New brightness: $NEW_BRIGHTNESS"

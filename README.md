# Framework Utilities

Scripts for my Framework laptop.

## bright.sh

Adjusts the screen brightness.

## 10-monitor.conf

Custom screen resolutions.

```bash
# Generated Modelines for hi-dpi 3:2 aspect ratios at 60 Hz
cvt 2256 1504 60
# 
cvt 2160 1440 60
# 
cvt 1920 1280 60
# 

# Manually add and test Modelines
xrandr --newmode "2256x1504" 287.00  2256 2424 2664 3072  1504 1507 1517 1559 -hsync +vsync
xrandr --addmode eDP-1 "2256x1504"
xrandr --output eDP-1 --mode "2256x1504"

xrandr --newmode "2160x1440" 263.50  2160 2320 2552 2944  1440 1443 1453 1493 -hsync +vsync
xrandr --addmode eDP-1 "2160x1440"
xrandr --output eDP-1 --mode "2160x1440"

xrandr --newmode "1920x1280" 206.25  1920 2056 2256 2592  1280 1283 1293 1327 -hsync +vsync
xrandr --addmode eDP-1 "1920x1280"
xrandr --output eDP-1 --mode "1920x1280"
```

## ToDo

- Fingerprint reader

# If an external display is connected, disable laptop screen and
# configure external displays.
xrandr | grep "DP2-1 connected" && (
  xrandr --output eDP1 --off
  xrandr --output DP2-1 --primary --mode 2560x1440
  xrandr --output DP2-2 --right-of DP2-1
)

. /etc/X11/Xsession

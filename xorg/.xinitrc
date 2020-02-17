# If an external display is connected, disable laptop screen and
# make external display primary.
xrandr | grep "eDP-1 connected" && (
  xrandr --output eDP-1 --off --output DP-2-1 --primary
)

. /etc/X11/Xsession

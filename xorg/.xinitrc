# If an external display is connected, disable laptop screen and
# configure external displays.
xrandr | grep "DP2-1 connected" && (
  xrandr --output eDP1 --off
  xrandr --output DP2-2 --primary --mode 2560x1440
  xrandr --output DP2-1 --right-of DP2-2 --mode 1920x1080
)

# Enable natural scrolling for the touchpad.
xinput --set-prop "Synaptics TM3053-004" "libinput Natural Scrolling Enabled" 1

. /etc/X11/Xsession

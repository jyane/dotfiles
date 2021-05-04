gsettings set org.gnome.desktop.interface scaling-factor 2
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gdk/WindowScalingFactor': <2>}"
xrandr --output DP-0 --scale 1.33x1.33 --primary --rate 60
xrandr --output DP-2 --scale 1.75x1.75 --pos 5107x0 --rate 144 --mode 1920x1080

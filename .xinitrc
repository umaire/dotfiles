# load fonts installed in local directory also
xset +fp /usr/share/fonts/local
xset fp rehash

# set a cursor
xsetroot -cursor_name left_ptr

# tray
#trayer --edge bottom --align right --SetDockType true --SetPartialStrut true --expand true --widthtype pixel --width 120 --transparent true --tint 0x1A1A1A --alpha 0 --height 24

# set background
# eval `cat ~/.fehbg`
killall wallpaper; ~/bin/wallpaper &

# clipboard manager
clipit --no-icon &

# composite manager
compton --config ~/.compton.conf -b

# for the eyes
xflux -z 11355 &

# screensaver
xscreensaver -no-splash &

# run our wm
exec xmonad

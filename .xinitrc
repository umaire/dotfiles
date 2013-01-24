xset +fp /usr/share/fonts/local
xset fp rehash

# set a cursor
xsetroot -cursor_name left_ptr

# set background
eval `cat ~/.fehbg`

# clipboard manager
clipit &

# composite manager
compton --config ~/.compton.conf -Cb

# run our wm
exec xmonad

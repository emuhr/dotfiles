#!/bin/sh

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# run feh to set the desktop background
~/.fehbg &

# set keyrepeat
xset r rate 200 30

# qt scale factor for qutebrowser
export QT_SCALE_FACTOR=1.0

#
# run redshift with Ludwigsburg coordinates
#
redshift -l 48.89731:9.19161 &

#
# pulseaudio
#
pulseaudio &

#
# qjackctl
#
qjackctl &

xrdb /home/emanuel/.Xresources

# 
# emacs daemon
# 
emacs --daemon

#exec i3
#exec openbox-session

exec xmonad

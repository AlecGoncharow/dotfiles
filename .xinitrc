#!/bin/bash

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# custom key mapping
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export TERMINAL=termite

xbindkeys &
xautolock -time 15 -locker "i3lock -i '/home/alec/Downloads/notabug2.png'" &
xrandr --output "eDP-1" --brightness $(cat ./.last_brightness) &
amixer -c 0 sset Master mute &
# /usr/local/bin/kb-light + 100 &
#xinput set-prop 11 "libinput Tapping Enabled" "1" & 
compton &
/home/alec/.fehbg &
exec i3


#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/nix/store/swf5v5dl8iabrj67brcv9ywhmr66gzzb-xinit-1.4.1/etc/X11/xinit/.Xresources
sysmodmap=/nix/store/swf5v5dl8iabrj67brcv9ywhmr66gzzb-xinit-1.4.1/etc/X11/xinit/.Xmodmap

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

# start some nice programs

if [ -d /nix/store/swf5v5dl8iabrj67brcv9ywhmr66gzzb-xinit-1.4.1/etc/X11/xinit/xinitrc.d ] ; then
 for f in /nix/store/swf5v5dl8iabrj67brcv9ywhmr66gzzb-xinit-1.4.1/etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#setxkbmap us &
#xrandr --output DISPLAy --mode 1920x1080 &
picom -f &
nitrogen --restore &
while true; do
    $HOME/suckless/dwm/result/bin/dwm &> /dev/null
done
#$HOME/suckless/lukeblocks/result/bin/dwmblocks &> /dev/null

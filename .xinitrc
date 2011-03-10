#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

DEFAULT_SESSION=awesome

#system xinit
source /etc/X11/xinit/xinitrc.d/*
#use system resources
test -r /etc/X11/Xresources && xrdb -nocpp -merge /etc/X11/Xresources
test -r ~/.Xresources && xrdb -merge ~/.Xresources
test -r ~/.Xmodmap && xmodmap ~/.Xmodmap
test -x /usr/bin/syndaemon && /usr/bin/syndaemon -t -k -i 2 -d
test -x /usr/bin/unclutter && /usr/bin/unclutter -root &

if ([ -x /usr/bin/gnome-keyring-daemon ]); then
	eval "`/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg`"
	export GPG_AGENT_INFO
	export SSH_AUTH_SOCK
fi


case $1 in
awesome)
    # disabled for bug in xserver 1.9.2
    # xcompmgr &
    exec /usr/bin/ck-launch-session awesome
    ;;
openbox)
    # disabled for bug in xserver 1.9.2
    # xcompmgr &
    test -r ~/.fehbg && `cat ~/.fehbg`
    exec  /usr/bin/ck-launch-session openbox-session
    ;;
compiz)
    exec  /usr/bin/ck-launch-session compiz ccp
    ;;
*)
    exec  /usr/bin/ck-launch-session $DEFAULT_SESSION
    ;;
esac

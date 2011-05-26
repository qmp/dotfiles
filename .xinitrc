#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

DEFAULT_SESSION=awesome

test -x /usr/bin/syndaemon && /usr/bin/syndaemon -t -k -i 2 -d

if ([ -x /usr/bin/gnome-keyring-daemon ]); then
	eval "`/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg`"
	export GPG_AGENT_INFO
	export SSH_AUTH_SOCK
fi

source /etc/X11/xinit/xinitrc-common
case $1 in
awesome)
    exec awesome
    ;;
openbox)
    # disabled for bug in xserver 1.9.2
    # xcompmgr &
    exec openbox-session
    ;;
compiz)
    exec compiz ccp
    ;;
*)
    exec $DEFAULT_SESSION
    ;;
esac

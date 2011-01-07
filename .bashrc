# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
test -r ~/.colors && source ~/.colors
test -r ~/.bash_theme && source ~/.bash_theme

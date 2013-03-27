awful = require("awful")
awful_autofocus = require("awful.autofocus")
awful_rules = require("awful.rules")
awful_beautiful = require("beautiful")
naughty = require("naughty")
vicious = require("vicious")
revelation = require("revelation")

home = os.getenv("HOME")
beautiful.init(home .. "/.config/awesome/themes/dust/theme.lua")

terminal = "urxvt256c"
navigator = "firefox"
mailgui = "thunderbird"
chat = "gajim"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.magnifier
}

tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ "♒", "⌥", "♐", "♓", "♏", "☊", "⌘", "✿", "♉", "சகிதா"  }, s, layouts[1])
end

top_bar = require("top-bar")
keybindings = require("keybindings")
rules_signals = require("rules-signals")
startup = require("startup")
naugthy_osd = require("naughty-osd")
kaboom = require("kaboom")

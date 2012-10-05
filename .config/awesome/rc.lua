require("awful")
require("awful.autofocus")
require("awful.rules")
require("beautiful")
require("naughty")
require("vicious")
require("revelation")

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
    awful.layout.suit.max,
    awful.layout.suit.fair,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.magnifier,
    awful.layout.suit.floating
}

tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ "♒", "⌥", "♐", "♓", "♏", "☊", "⌘", "✿", "♉" }, s, layouts[1])
end
awful.tag.new({"ஸகி" }, nil, awful.layout.suit.fair)
sakiscreen = 1 -- nil is screen 1 by default
sakitag = #tags
awful.tag.viewonly(tags[1][1])

require("top-bar")
require("keybindings")
require("rules-signals")
require("startup")
require("naughty-osd")
require("kaboom")

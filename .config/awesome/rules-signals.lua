-- Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    { rule = { class = "Firefox" },
      properties = { tag = tags[1][2] } },
    { rule = { class = "Liferea" },
      properties = { tag = tags[1][2] } },
    { rule = { class = "Thunderbird" },
      properties = { tag = tags[1][3] } },
    { rule = { class = "Rhythmbox" },
      properties = { tag = tags[1][6] } },
    { rule = { class = "Empathy" },
      properties = { tag = tags[1][7] } },
    { rule = { class = "Empathy-chat" },
      properties = { tag = tags[1][7] } },
    { rule = { class = "Pidgin" },
      properties = { tag = tags[1][7] } },
    { rule = { class = "Hotot" },
      properties = { tag = tags[1][7] } },
    { rule = { class = "Tomahawk" },
      properties = { tag = tags[1][7] } },
    { rule = { class = "Transmission-gtk" },
      properties = { tag = tags[1][8] } },
    { rule = { instance = "urxvt256c" },
      properties = { opacity = 0.9 } },
    { rule = { instance = "xterm" },
      properties = { opacity = 0.9 } },
}

-- Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

batwidget = widget({ type = "textbox" })
vicious.register(batwidget, vicious.widgets.bat, "$1$2%", 61, "BAT0")

mytextclock = awful.widget.textclock({ align = "right" }, " %a %b %d, %H:%M ", 1)

mytaskw = widget({type = "textbox", name = "mytaskw", popup = nil })
bashets.register('/home/qmp/.config/awesome/scripts/task_summary.sh', {widget = mytaskw, format = '<b><span color="red">$1</span>/<span color="cyan">$2</span>/<span color="white">$3</span></b>"', async = true })
taskw_popup = nil
function taskw_get_popup_text ()
	awful.util.spawn('/home/qmp/.config/awesome/scripts/task_cache.sh')
end
function taskw_show_popup ()
	taskw_popup = naughty.notify({
		text = awful.util.pread('cat /tmp/thunder_task_cache'),
		title = "tasks" 
	}) 
end
function taskw_close_popup()
	if taskw_popup ~= nil then
		naughty.destroy(taskw_popup)
		taskw_popup = nil
	end
end
mytaskw:add_signal("mouse::enter", taskw_show_popup )
mytaskw:add_signal("mouse::leave", taskw_close_popup )
taskw_popup_text_timer = timer({timeout=10})
taskw_popup_text_timer:add_signal('timeout', taskw_get_popup_text)
taskw_popup_text_timer:start()

mysystray = widget({ type = "systray" })

mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if not c:isvisible() then
                                                  awful.tag.viewonly(c:tags()[1])
                                              end
                                              client.focus = c
                                              c:raise()
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
    --        mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        mytextclock,
		mytaskw,
        s == 1 and mysystray or nil,
        --netwidget,
        batwidget,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end

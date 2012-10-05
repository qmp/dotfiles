-- for * in dir ??
for i = 1,3 do
	awful.util.spawn("/usr/bin/feh " .. home .. "/.config/awesome/images/" .. i .. ".jpg")
end

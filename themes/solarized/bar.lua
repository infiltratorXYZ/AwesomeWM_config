local gears = require("gears")
local wibox = require("wibox")
local awful = require("awful")

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

mybinaryclock = require("widgets.binary_clock")()

local mybar = class()

function mybar:init(s)

    -- Promptbox widget
    s.mypromptbox = awful.widget.prompt()

    -- Create tasklist widget
    s.mytasklist = require("widgets.tasklist")(s) 

    -- Create taglist widget
    s.mytaglist = require("widgets.taglist")(s)

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    
    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
	expand = "none",
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --mylauncher, -- It's a awesomewm icon with menu
            s.mytaglist,
            s.mypromptbox,
        },
        --s.mytasklist, -- Middle widget
        awful.widget.watch('corona', 900),
        { -- Right widgets
            --mybinaryclock,
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
    },
    }
end

return mybar

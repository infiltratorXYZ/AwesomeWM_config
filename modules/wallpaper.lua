local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

local mywallpaper = class()

local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end

        -- Setting wallpaper
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

function mywallpaper:init(s)
  set_wallpaper(s)

  -- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
  screen.connect_signal("property::geometry", set_wallpaper)
end

return mywallpaper
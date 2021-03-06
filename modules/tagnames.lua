local awful = require("awful")
local gtable = require("gears.table")
local beautiful = require("beautiful")
local lain = require("lain")
-- Tag names
tagnames = beautiful.tagnames or { "‎‎", "" , "", "", "", "", "", "", "פֿ" }

-- Screen padding for each tag
local defaultPadding = {left = 50, right = 50, top = 20, bottom = 50}
tagpadding = {}
for _,name in pairs(tagnames) do
   tagpadding[name] = defaultPadding
end


-- init table
local mytagname = class()

function mytagname:init(s)
  -- Each screen has its own tag table.
  --awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

  local l = awful.layout.suit -- Alias to save time :)
  -- local layouts = { l.max, l.floating, l.max, l.max , l.tile,
  --     l.max, l.max, l.max, l.floating, l.tile}
  local layouts = { 
    lain.layout.centerwork, l.tile, l.max, l.max.fullscreen, l.max.fullscreen,
    lain.layout.centerwork, lain.layout.centerwork, lain.layout.centerwork, lain.layout.centerwork
  }


  -- Create tags
  awful.tag.add(tagnames[1], {
    layout = layouts[1],
    screen = s,
    gap_single_client  = true,
    gap = 9,
    selected = true,
  })

tagpadding[tagnames[1]] = {left = 50, right = 50, top = 20, bottom = 50}

  awful.tag.add(tagnames[2], {
    layout = layouts[2],
    screen = s,
    gap = 18,
    gap_single_client = true,
    master_width_factor = 0.75,
  })

tagpadding[tagnames[2]] = {left = 12, right = 12, top = 0, bottom = 0}

  awful.tag.add(tagnames[3], {
    layout = layouts[3],
    screen = s,
    gap_single_client  = false,
  })

  awful.tag.add(tagnames[4], {
    layout = layouts[4],
    gap_single_client  = false,
    screen = s,
  })

  awful.tag.add(tagnames[5], {
    layout = layouts[5],
    gap_single_client  = false,
    screen = s,
  })

  awful.tag.add(tagnames[6], {
    layout = layouts[6],
    gap_single_client  = false,
    screen = s,
  })

  awful.tag.add(tagnames[7], {
    layout = layouts[7],
    gap_single_client  = false,
    screen = s,
  })

  awful.tag.add(tagnames[8], {
    layout = layouts[8],
    gap_single_client  = false,
    screen = s,
  })

  awful.tag.add(tagnames[9], {
    layout = layouts[9],
    gap_single_client  = false,
    screen = s,
  })
end

return mytagname


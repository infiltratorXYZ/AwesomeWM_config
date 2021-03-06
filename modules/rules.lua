local awful = require("awful")
local beautiful = require("beautiful")
local keys = require("modules.keys")
local helpers = require("modules.helpers")
require("modules.tagnames")

rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = keys.clientkeys,
                     buttons = keys.clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },

     --Set Firefox to always map on the tag named "2" on screen 1.
     { rule = { class = "firefox" },
       properties = { tag = tagnames[2], switchtotag = true} },

    -- Spotify map  on the tag named "3".
     { rule = { class = "[Ss]potify" },
       properties = { screen = 1, tag = tagnames[5]} },

    -- Rules for Gimp
     { rule = { class = "Gimp" },
       properties = { screen = 1, tag = tagnames[4], switchtotag = true} },
    -- Rules for Inkscape
     { rule = { class = "Inkscape" },
       properties = { screen = 1, tag = tagnames[4], switchtotag = true} },
    -- Rules for Discord
     { rule = { class = "discord" },
       properties = { screen = 1, tag = tagnames[3]} },

    -- support for run St in floating - bad solution, pls change me:
     { rule = { class = "St" },
     callback = function(c)
         -- floating_flag is set in modules/keys.lua
         if floating_flag then
             for k,gravity in pairs(helpers.gravity({0, 0, 25, 25})) do
                 c[k] = gravity
             end
             c:move_to_screen(awful.screen.focused())
             awful.placement.centered(c)
         end
         floating_flag = false
     end},

}


return rules

n the wezterm API
local wezterm = require 'wezterm'

local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.keys = {
  -- search for things that look like git hashes
  {
    key = 'H',
    mods = 'SHIFT|CTRL',
    action = act.Search {
      Regex = '[a-f0-9]{6,}',
    },
  },
  -- search for the lowercase string "hash" matching the case exactly
  {
    key = 'H',
    mods = 'SHIFT|CTRL',
    action = act.Search { CaseSensitiveString = 'hash' },
  },
  -- search for the string "hash" matching regardless of case
  {
    key = 'H',
    mods = 'SHIFT|CTRL',
    action = act.Search { CaseInSensitiveString = 'hash' },
  },
}

-- For example, changing the color scheme: Dark Violet (base16) | Argonaut (Gogh) | Blue Matrix | cyperpunk
config.color_scheme = 'deep'

window_decorations = "NONE"

config.window_frame ={

font_size = 10.0
}

-- For font configs
config.font = wezterm.font("Hack Nerd Font Propo", {weight="Bold", stretch="Normal", style="Normal"}) -- /usr/share/fonts/TTF/HackNerdFont-Regular.ttf, FontConfig

config.window_background_opacity = 0.8

-- For custom background image
-- config.window_background_image = 'Downloads/wezterm_wallpaper.jpg'
config.window_background_image_hsb = {
brightness = 0.5, saturation = 0.8
}

-- and finally, return the configuration to wezterm
return config

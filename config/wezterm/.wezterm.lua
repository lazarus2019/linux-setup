-- Pull in the wezterm API
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

-- config.leader = {key = '', mods = 'CTRL', timeout_miliseconds = 1000}

config.keys = {
 -- config ActivatePaneDirection
 {
    key = 'LeftArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Down',
  },

  -- This will create a new split and run your default program inside it
   {
    key = 'H',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain'},
  },

  -- This will create a new split and run your default program inside it
  {
    key = 'V',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain'},
  },

  -- This will close current pane
  {
    key = 'w',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },

  -- This will rotate pane
   {
    key = 'b',
    mods = 'CTRL',
    action = act.RotatePanes 'CounterClockwise',
  },
  { key = 'n', mods = 'CTRL', action = act.RotatePanes 'Clockwise' },
	
 -- Clears the scrollback and viewport, and then sends CTRL-L to ask the
  -- shell to redraw its prompt
  {
    key = 'K',
    mods = 'CTRL|SHIFT',
    action = act.Multiple {
      act.SendKey { key = 'L', mods = 'CTRL' },
    },
  },
  -- search for things that look like git hashes
  {
    key = 'F',
    mods = 'CTRL|SHIFT',
    action = act.Search {
      Regex = '[a-f0-9]{6,}',
    },
  },
  -- search for the lowercase string "" matching the case exactly
  {
    key = 'F',
    mods = 'CTRL|SHIFT',
    action = act.Search { CaseSensitiveString = '' },
  },
  -- search for the string "hash" matching regardless of case
  {
    key = 'F',
    mods = 'CTRL|SHIFT',
    action = act.Search { CaseInSensitiveString = '' },
  },
}

-- For example, changing the color scheme: Dark Violet (base16) | Argonaut (Gogh) | Blue Matrix | cyperpunk
config.color_scheme = 'deep'

-- Appearance
-- config.window_decorations = "RESIZE"
config.tab_bar_at_bottom = true
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.underline_thickness = 1
config.hide_mouse_cursor_when_typing = true
config.use_fancy_tab_bar = false
config.enable_scroll_bar = true
config.font_size = 11
-- config.command_palette_font_size = 10

config.window_frame ={
  font_size = 9,
    -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',

}

-- For font configs
config.font = wezterm.font("Hack Nerd Font Propo", {weight="Bold", stretch="Normal", style="Normal"}) -- /usr/share/fonts/TTF/HackNerdFont-Regular.ttf, FontConfig

config.window_background_opacity = 0.8

-- For custom background image
-- config.window_background_image = 'Downloads/wezterm_wallpaper.jpg'
config.window_background_image_hsb = {
brightness = 0.5, saturation = 0.8
}

config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.5,
}

-- and finally, return the configuration to wezterm
return config

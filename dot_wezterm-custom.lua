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

config.keys = { -- config ActivatePaneDirection
{
    key = 'LeftArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Left'
}, {
    key = 'h',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Left'

}, {
    key = 'RightArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Right'
}, {
    key = 'l',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Right'

}, {
    key = 'UpArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Up'
}, {
    key = 'k',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Up'
}, {
    key = 'DownArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Down'
}, {
    key = 'j',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Down'

}, -- This will create a new split and run your default program inside it
{
    key = 'H',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitHorizontal {
        domain = 'CurrentPaneDomain'
    }
}, -- This will create a new split and run your default program inside it
{
    key = 'V',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitVertical {
        domain = 'CurrentPaneDomain'
    }
}, -- This will close current pane
{
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane {
        confirm = true
    }
}, -- This will rotate pane
{
    key = 'b',
    mods = 'CTRL|ALT',
    action = act.RotatePanes 'CounterClockwise'
}, {
    key = 'n',
    mods = 'CTRL|ALT',
    action = act.RotatePanes 'Clockwise'
}, -- Clears the scrollback and viewport, and then sends CTRL-L to ask the
-- shell to redraw its prompt
{
    key = 'K',
    mods = 'CTRL|SHIFT',
    action = act.Multiple {act.SendKey {
        key = 'L',
        mods = 'CTRL'
    }}
}, -- search for things that look like git hashes
{
    key = 'F',
    mods = 'CTRL|SHIFT',
    action = act.Search {
        Regex = '[a-f0-9]{6,}'
    }
}, -- search for the lowercase string "" matching the case exactly
{
    key = 'F',
    mods = 'CTRL|SHIFT',
    action = act.Search {
        CaseSensitiveString = ''
    }
}, -- search for the string "hash" matching regardless of case
{
    key = 'F',
    mods = 'CTRL|SHIFT',
    action = act.Search {
        CaseInSensitiveString = ''
    }
}, -- Active next|previous tab
{
    key = '[',
    mods = 'ALT',
    action = act.ActivateTabRelative(-1)
}, {
    key = ']',
    mods = 'ALT',
    action = act.ActivateTabRelative(1)
}, -- Move current tab relative
{
    key = '[',
    mods = 'CTRL|ALT',
    action = act.MoveTabRelative(-1)
}, {
    key = ']',
    mods = 'CTRL|ALT',
    action = act.MoveTabRelative(1)
}, -- Scroll config
{
    key = 'UpArrow',
    mods = 'SHIFT',
    action = act.ScrollByLine(-5)
}, {
    key = 'DownArrow',
    mods = 'SHIFT',
    action = act.ScrollByLine(5)
}, {
    key = 'PageUp',
    mods = 'SHIFT',
    action = act.ScrollByPage(-0.5)
}, {
    key = 'PageDown',
    mods = 'SHIFT',
    action = act.ScrollByPage(0.5)
}}
-- Override activeTab keybindings
for i = 1, 9 do
    -- CTRL+ALT + number to activate that tab
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'ALT',
        action = act.ActivateTab(i - 1)
    })
    -- F1 through F8 to activate that tab
    -- table.insert(config.keys, {
    --     key = 'F' .. tostring(i),
    --     action = act.ActivateTab(i - 1)
    -- })
end

-- For example, changing the color scheme: Dark Violet (base16) | Argonaut (Gogh) | Blue Matrix | cyperpunk | Materia (base16) | Obsidian
-- config.color_scheme = 'deep'
-- config.color_scheme = 'Obsidian'

-- colors, metadata = wezterm.color.load_scheme("wezterm-color-scheme/obsidian.toml")
-- config.colors = colors

-- config.colors = {
--       ansi = {
--     "#000000","#FF8225","#00bb00","#fecd22","#3a9bdb","#bb00bb","#00bbbb","#bbbbbb"
--   },
--   brights = {
--    "#555555","#ff0003","#93c863","#fef874","#a1d7ff","#ff55ff","#55ffff","#ffffff"
--   },
-- }

-- Appearance
-- config.window_decorations = "RESIZE"
config.tab_bar_at_bottom = true
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.underline_thickness = 1
config.hide_mouse_cursor_when_typing = true
config.use_fancy_tab_bar = false
config.enable_scroll_bar = false
config.font_size = 11
-- config.command_palette_font_size = 10

config.window_frame = {
    font_size = 9,
    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = '#333333',

    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = '#333333'

}

-- For font configs
-- config.font = wezterm.font("Hack Nerd Font", {
--     weight = "Bold",
--     stretch = "Normal",
--     style = "Normal"
-- }) -- /usr/share/fonts/TTF/HackNerdFont-Regular.ttf, FontConfig
-- config.font = wezterm.font_with_fallback {{
--     family = "Hack Nerd Font",
--     {
--         weight = "Bold",
--         stretch = "Normal",
--         style = "Normal"
--     }
-- }, 'Consolas', 'Courier New', 'monospace'}

config.window_background_opacity = 0.85
config.default_prog = {"/usr/bin/fish"}

-- For custom background image
-- config.window_background_image = 'Downloads/wezterm_wallpaper.jpg'
config.window_background_image_hsb = {
    brightness = 0.5,
    saturation = 0.8
}

config.inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.5
}
-- Disable beep sound (bell rings) for laptop
config.audible_bell = "Disabled"

-- Startup with workspace/session
local mux = wezterm.mux
-- wezterm.on('gui-startup', function(cmd)
--     -- allow `wezterm start -- something` to affect what we spawn
--     -- in our initial window
--     local args = {}
--     if cmd then
--         args = cmd.args
--     end

--     -- Set a workspace for coding on a current project
--     -- Top pane is for the editor, bottom pane is for the build tool
--     local project_dir = wezterm.home_dir .. '/workspace/Per'
--     wezterm.log_info(project_dir)

--     local tab, build_pane, window = mux.spawn_window {
--         workspace = 'coding',
--         cwd = project_dir,
--         args = args
--     }
--     local _, second_pane, _ = window:spawn_tab{
--         cwd = wezterm.home_dir .. '/workspace/gitlab.nexon.com/corporation/pressroom/kr-newsroom-frontend'
--     }
--     local _, third_pane, _ = window:spawn_tab{
--         cwd = project_dir
--     }

--     -- Execute when pane is created
--     -- second_pane.send_text "bun dev\n"

--     local editor_pane = build_pane:split{
--         direction = 'Top',
--         size = 0.6,
--         cwd = project_dir
--     }
--     -- may as well kick off a build in that pane
--     -- build_pane:send_text 'cargo build\n'

--     -- A workspace for interacting with a local machine that
--     -- runs some docker containers for home automation
--     local tab, pane, window = mux.spawn_window {
--         workspace = 'automation',
--         args = {'ssh', 'vault'}
--     }

--     -- We want to startup in the coding workspace
--     mux.set_active_workspace 'coding'
-- end)

wezterm.on('gui-startup', function(cmd)
    local args = {}
    if cmd then
        args = cmd.args
    end

    local newsroom_tab, first_pane, window = mux.spawn_window {
        cwd = wezterm.home_dir .. '/workspace/gitlab.nexon.com/corporation/pressroom/kr-newsroom-frontend'
    }

    newsroom_tab:set_title 'Newsroom'

    local gameweb_tab, second_pane, _ = window:spawn_tab{
        cwd = wezterm.home_dir .. '/workspace/gitlab.nexon.com/analysis-support/gameweb/gameweb'
    }

    gameweb_tab:set_title 'Gameweb'

    local tlm_tab, tlm_pane, _ = window:spawn_tab{
        cwd = wezterm.home_dir ..
            '/workspace/gitlab.nexon.com/analysis-support/gamescaletms/gamescale-tlm-2.0/tlm_fe_client'
    }

    tlm_tab:set_title 'TLM'

    tlm_pane:split{
        direction = 'Bottom',
        size = 0.5,
        cwd = wezterm.home_dir .. '/workspace/gitlab.nexon.com/analysis-support/gamescaletms/gamescale-tlm-2.0/tlm_be'
    }

    -- '\n' this will execute you shell command
    first_pane:send_text 'bun dev\n'
end)

-- wezterm.on('window-config-reloaded', function(window, pane)
--     window:toast_notification('wezterm', wezterm.home_dir .. '.config/hypr', nil, 4000)
-- end)

-- and finally, return the configuration to wezterm
return config

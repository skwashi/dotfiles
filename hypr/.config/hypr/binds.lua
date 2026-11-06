-- See https://wiki.hypr.land/configuring/core/binds/

local mod = "SUPER"

-- Programs
local terminal    = "alacritty" -- kitty, foot
local fileManager = "thunar" -- dolphin
local emacs       = "emacsclient -c"
local menu        = 'fuzzel -p "run "'
local dmenu       = "rofi -show run"
local ssh         = "rofi -show ssh"
local yank        = 'cliphist list | fuzzel --dmenu --with-nth 2 -w 80 -l 12 -p "clipboard " | cliphist decode | wl-copy'
local windows     = "rofi -show window"

local exec = hl.dsp.exec_cmd

-- Basic binds
hl.bind("CTRL + ALT + Backspace", hl.dsp.exit())
hl.bind(mod .. " + SHIFT + R", hl.dsp.reload_config())
hl.bind(mod .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + Q", exec("hyprlock"))

-- Scratchpad workspace
-- hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Workspace switching / move active window to workspace without following
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Scroll through existing workspaces
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Scroll through windows
hl.bind(mod .. " + TAB", hl.dsp.window.cycle_next({ tiled = true }))
hl.bind(mod .. " + SHIFT + TAB", hl.dsp.window.cycle_next({ tiled = true, next = false }))

-- Focus / move / resize windows (vim keys)
local vim = {
    H = { dir = "l", x = -20, y = 0 },
    J = { dir = "d", x = 0, y = 20 },
    K = { dir = "u", x = 0, y = -20 },
    L = { dir = "r", x = 20, y = 0 },
}
for key, v in pairs(vim) do
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ direction = v.dir }))
    hl.bind(mod .. " + CTRL + " .. key, hl.dsp.window.move({ direction = v.dir }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.resize({ x = v.x, y = v.y, relative = true }))
end

-- Swap window with master
hl.bind(mod .. " + SHIFT + Return", hl.dsp.layout("swapwithmaster"))

-- Move/resize windows with mouse
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Fullscreen (instead of layout cycling)
hl.bind(mod .. " + SHIFT + Space", hl.dsp.window.fullscreen())

-- Float window
hl.bind(mod .. " + M", hl.dsp.window.float({ action = "toggle" }))

-- Laptop multimedia keys for volume and LCD brightness
local el = { locked = true, repeating = true }
hl.bind("XF86AudioRaiseVolume", exec("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), el)
hl.bind("XF86AudioLowerVolume", exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), el)
hl.bind("XF86AudioMute", exec("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), el)
hl.bind("XF86AudioMicMute", exec("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), el)
hl.bind("XF86MonBrightnessUp", exec("brightnessctl -e4 -n2 set 5%+"), el)
hl.bind("XF86MonBrightnessDown", exec("brightnessctl -e4 -n2 set 5%-"), el)

-- Requires playerctl
hl.bind("XF86AudioNext", exec("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", exec("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", exec("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", exec("playerctl previous"), { locked = true })

-- Scratch terminals
hl.bind(mod .. " + I", exec('~/.config/hypr/scripts/toggle-scratch scratch-up "alacritty --title scratch-up"'))
hl.bind(mod .. " + O", exec('~/.config/hypr/scripts/toggle-scratch scratch-down "alacritty --title scratch-down"'))

-- Universal copy/paste/cut. Ctrl+Insert, Shift+Insert and Shift+Delete
-- mean copy/paste/cut in alacritty (see alacritty.toml), browsers, GTK/Qt
-- apps and Emacs, so the same keys work everywhere.
hl.bind(mod .. " + C", hl.dsp.send_shortcut({ mods = "CTRL", key = "Insert" }))
hl.bind(mod .. " + V", hl.dsp.send_shortcut({ mods = "SHIFT", key = "Insert" }))
hl.bind(mod .. " + X", hl.dsp.send_shortcut({ mods = "SHIFT", key = "Delete" }))

-- Launch programs
hl.bind(mod .. " + E", exec(emacs))
hl.bind(mod .. " + Return", exec(terminal))
hl.bind(mod .. " + D", exec(dmenu))
hl.bind(mod .. " + R", exec(menu))
hl.bind(mod .. " + F", exec(fileManager))

-- Screenshots
hl.bind("Print", exec("grim ~/Pictures/screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png"))
hl.bind("SHIFT + Print", exec('grim -g "$(slurp)" ~/Pictures/screenshots/region-$(date +%Y%m%d-%H%M%S).png'))

-- Dwindle layout
hl.bind(mod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mod .. " + S", hl.dsp.layout("togglesplit"))

-- Layout switching (should be a submenu); `hyprctl keyword` no longer exists
local function set_layout(name)
    return function() hl.config({ general = { layout = name } }) end
end
hl.bind(mod .. " + SHIFT + T", set_layout("master"))
hl.bind(mod .. " + SHIFT + Y", set_layout("dwindle"))
-- hl.bind(mod .. " + SHIFT + U", set_layout("scrolling"))
hl.bind(mod .. " + SHIFT + U", set_layout("monocle"))

-- Dmenu like launchers
hl.bind(mod .. " + Y", exec(yank))
hl.bind(mod .. " + W", exec(windows))
hl.bind(mod .. " + S", exec(ssh))

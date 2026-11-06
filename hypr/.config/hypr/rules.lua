-- See https://wiki.hypr.land/configuring/core/rules/

-- Fix some dragging issues with XWayland
-- hl.window_rule({
--     match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
--     no_focus = true,
-- })

-- Float mpv and cgoban
hl.window_rule({ match = { class = "mpv" }, float = true })
-- hl.window_rule({ match = { class = "org.cgoban.CGoban3" }, float = true })

-- Scratch terminals: no borders, no anims, floating
hl.window_rule({
    match       = { title = "scratch-.*" },
    border_size = 0,
    no_anim     = true,
    float       = true,
    -- pin      = true, -- visible on all workspaces
})

-- Upper scratch terminal
hl.window_rule({
    match = { title = "scratch-up" },
    size  = "monitor_w*0.6 monitor_h*0.28",
    move  = "monitor_w*0.2 30",
})

-- Lower scratch terminal
hl.window_rule({
    match = { title = "scratch-down" },
    size  = "monitor_w*0.6 monitor_h*0.28",
    move  = "monitor_w*0.2 monitor_h*0.72",
})

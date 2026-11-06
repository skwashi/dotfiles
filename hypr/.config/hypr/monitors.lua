-- See https://wiki.hypr.land/configuring/core/monitors/

-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto", mirror = "eDP-1" })
hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = "auto" })
hl.monitor({ output = "DP-1", mode = "preferred", position = "auto", scale = "auto", mirror = "eDP-1" })

-- hl.workspace_rule({ workspace = "1", monitor = "eDP-1" })
-- hl.workspace_rule({ workspace = "1", monitor = "DP-1" })

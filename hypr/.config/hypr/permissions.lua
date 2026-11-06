-- See https://wiki.hypr.land/configuring/core/advanced-configuration/permissions/
-- Permission changes require a Hyprland restart.

-- hl.config({ ecosystem = { enforce_permissions = true } })

hl.permission({ binary = "/usr/bin/grim", type = "screencopy", mode = "allow" })
-- hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })
-- hl.permission({ binary = "/usr/(bin|local/bin)/hyprpm", type = "plugin", mode = "allow" })

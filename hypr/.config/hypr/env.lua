-- See https://wiki.hypr.land/configuring/core/environment-variables/

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("QT_QPA_PLATFORM", "wayland")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("TERMINAL", "alacritty")

-- hl.env("GDK_SCALE", "2")
-- hl.env("GDK_DPI_SCALE", "1")
-- hl.env("QT_SCALE_FACTOR", "2")
-- hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

-- Disable nvidia
hl.env("__NV_PRIME_RENDER_OFFLOAD", "0")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "mesa")
hl.env("__EGL_VENDOR_LIBRARY_FILENAMES", "/usr/share/glvnd/egl_vendor.d/50_mesa.json")

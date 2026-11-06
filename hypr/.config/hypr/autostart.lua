hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("waybar")
    -- hl.exec_cmd("iwgtk --tray")

    -- Clipboard manager
    hl.exec_cmd("wl-clip-persist --clipboard regular")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Session
    -- hl.exec_cmd("systemctl --user start graphical-session.target")

    -- Polkit
    -- hl.exec_cmd("usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    -- Applets
    hl.exec_cmd("blueman-applet")

    -- Emacs
    hl.exec_cmd("emacs --daemon")
end)

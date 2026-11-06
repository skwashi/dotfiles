hl.config({
    general = {
        layout = "master",
    },

    -- See https://wiki.hypr.land/configuring/layouts/master-layout/
    master = {
        mfact      = 0.5,
        new_status = "master",
    },

    -- See https://wiki.hypr.land/configuring/layouts/dwindle-layout/
    dwindle = {
        -- pseudotile = true, -- Master switch for pseudotiling. Bound to mod + P in binds.lua
        preserve_split = true,
    },
})

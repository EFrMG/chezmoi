-- Big and dynamic floating windows
o.window({ tag = "floating-window" }, { size = { "(monitor_w*0.5)", "(monitor_h*0.8)" } })

-- Steam should be tiled
o.window({ class = "steam" }, { float = false })

-- Prevent Zed from gaining focus on autostart
o.window({ class = "^(dev.zed.Zed)$" }, { suppress_event = "activatefocus" })

-- Floating ghostty launches from modules/bindings/desktop-apps.lua, matched by their dedicated --class so ordinary ghostty windows keep tiling normally.
o.window("^com\\.mitchellh\\.ghostty\\.float$", { tag = "+floating-window", move = { 0, 0 } })

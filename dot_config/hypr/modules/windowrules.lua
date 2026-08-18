-- Big and dynamic floating windows
o.window({ tag = "floating-window" }, { size = { "(monitor_w*0.5)", "(monitor_h*0.8)" } })

-- Steam should be tiled
o.window({ class = "steam" }, { float = false })

-- Prevent Zed from gaining focus on autostart
o.window({ class = "^(dev.zed.Zed)$" }, { suppress_event = "activatefocus" })

-- Floating ghostty launches from ./bindings/desktop-apps.lua, matched by their dedicated class so ordinary ghostty windows keep tiling normally.
-- NOTE: do not join the floating-window tag for this: Hyprland re-applies a tag-matched size rule whenever a window's tags change, so granting that tag here would let the generic size rule above clobber this fixed size right after we set it; regardless of order
o.window("^com\\.mitchellh\\.ghostty\\.float$", { float = true, size = { "(monitor_w*0.47)", "(monitor_h*0.35)" } })

-- The width here might be wrong if the terminal font size changes; bashmount's separators fit pixel-perfect within this size
o.window("^org\\.omarchy\\.bashmount$", { float = true, size = { 873, 880 } })

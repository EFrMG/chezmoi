hl.config({
  -- https://wiki.hypr.land/Configuring/Basics/Variables/#general
  general = {
    -- No gaps between windows or borders.
    gaps_in = -1,
    gaps_out = 1,
    border_size = 2,

    col = {
      inactive_border = "rgba(595959ff)",
      active_border = { colors = { "rgba(33ccffAA)", "rgba(00ff99AA)" }, angle = 225 },
    }
  },

  -- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/#config
  dwindle = {
    force_split = 0
  },

  -- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
  decoration = {
    -- Use round window corners.
    rounding = 8,
    rounding_power = 3,

    -- Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
    dim_inactive = true,
    dim_strength = 0.07,

    shadow = {
      enabled = true,
      range = 12,
      render_power = 3,
      color = "0xee1a1a1a",
    },

    blur = {
      enabled = true,
      size = 2,
      passes = 1,
      special = true,
      brightness = 0.35,
      contrast = 0.85,
      vibrancy = 0.09,
      noise = 0.0135,
    }
  },

  group = {
    groupbar = {
      font_size = 15
    }
  },

  -- https://wiki.hypr.land/Configuring/Basics/Variables/#layout
  layout = {
    -- Avoid overly wide single-window layouts on wide screens.
    single_window_aspect_ratio = { 13, 9 },
  },

  -- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
  animations = {
    -- enabled = false,
  },

  cursor = {
    inactive_timeout = 5
  },

  -- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
  scrolling = {
    column_width = 0.8125,
    fullscreen_on_one_column = false,
  },
})

-- Animations
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 4.33, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 3.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3.64, bezier = "easeOutQuint", style = "popin 91%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.36, bezier = "linear", style = "popin 91%" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fadeSwitch", enabled = false })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2.74, bezier = "easeInOutCubic" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "easeOutQuint", style = "slidevert" })
hl.animation({
  leaf = "specialWorkspaceIn",
  enabled = true,
  speed = 4.52,
  bezier = "easeOutQuint",
  style =
  "slidevert 12%"
})
hl.animation({
  leaf = "specialWorkspaceOut",
  enabled = true,
  speed = 3.9,
  bezier = "easeOutQuint",
  style =
  "slidevert 8%"
})

-- Mouse pointer
-- Xcursor Sizes: 16 20 22 24 28 32 40 48 56 64 72 80 88 96
-- 1.1 Set envs for apps
hl.env("XCURSOR_THEME", "BreezeX-RosePine")
hl.env("XCURSOR_SIZE", "32")

-- 1.2 Hyprcursor
hl.env("HYPRCURSOR_THEME", "BreezeX-RosePine-Hyprcursor")
hl.env("HYPRCURSOR_SIZE", "32")

-- 2. Set pointer for the Hyprland compositor itself (it overrides!)
-- o.launch_on_start("hyprctl setcursor BreezeX-RosePine-Hyprcursor 32")

-- 3. Set for GTK apps
-- o.launch_on_start("gsettings set org.gnome.desktop.interface cursor-theme 'BreezeX-RosePine'")
-- o.launch_on_start("gsettings set org.gnome.desktop.interface cursor-size 32")

-- Fix for QT app scalling
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_FORCE_DPI", "96")

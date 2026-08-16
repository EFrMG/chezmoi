if hl.plugin.dynamic_cursors then
  hl.config { plugin = { dynamic_cursors = {
    enabled = true,

    -- sets the cursor behaviour, supports these values:
    -- tilt    - tilt the cursor based on x-velocity
    -- rotate  - rotate the cursor based on movement direction
    -- stretch - stretch the cursor shape based on direction and velocity
    -- none    - do not change the cursor's behaviour
    mode = "tilt",

    -- minimum angle difference in degrees after which the shape is changed
    -- smaller values are smoother, but more expensive for hw cursors
    threshold = 3,

    -- for mode = "tilt"
    tilt = {
      -- controls how powerful the tilt is, the lower, the more power
      -- this value controls at which speed (px/s) the full tilt is reached
      limit = 4600,

      -- relationship between speed and tilt, supports these values:
      -- linear             - a linear function is used
      -- quadratic          - a quadratic function is used (most realistic to actual air drag)
      -- negative_quadratic - negative version of the quadratic one, feels more aggressive
      -- see `activation` in `src/mode/utils.cpp` for how exactly the calculation is done
      activation = "negative_quadratic",

      -- time window (ms) over which the speed is calculated
      -- higher values will make slow motions smoother but more delayed
      window = 104,

      -- full tilt for each side (°)
      full = 60,
    },

    -- magnifies the cursor if its is being shaken
    shake = {
      enabled = false,
    },
  } } }
end

hl.config({
  ecosystem = {
    no_donation_nag = true
  },

  binds = {
    scroll_event_delay = 100
  },
})

hl.env("PATH", os.getenv("HOME") .. "/.local/bin:" .. os.getenv("PATH"))

hl.env("OMARCHY_SCREENSHOT_DIR", os.getenv("HOME") .. "/Pictures/captures")
hl.env("OMARCHY_SCREENRECORD_DIR", os.getenv("HOME") .. "/Videos/OBS")

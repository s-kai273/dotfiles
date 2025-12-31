local wezterm = require('wezterm')
local config = {
  color_scheme = "Tokyo Night Moon",
  debug_key_events = true,
  font = wezterm.font_with_fallback({
    "JetBrains Mono",
  }),
  warn_about_missing_glyphs = false,
}

config = require("lua.keybinds").apply(config, wezterm)
config = require("lua.toggle_opacity").apply(config, wezterm)

return config

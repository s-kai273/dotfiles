local wezterm = require('wezterm')
local config = wezterm.config_builder()
config.color_scheme = "Tokyo Night Moon"
config.debug_key_events = true
config.use_ime = true
config.warn_about_missing_glyphs = false
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
})

config = require("lua.modal_wezterm").apply(config, wezterm)
config = require("lua.keybinds").apply(config, wezterm)
config = require("lua.toggle_opacity").apply(config, wezterm)

return config

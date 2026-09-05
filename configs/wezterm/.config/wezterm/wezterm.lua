local wezterm = require('wezterm')
local config = wezterm.config_builder()
config.automatically_reload_config = true
config.color_scheme = "Tokyo Night Moon"
config.debug_key_events = true
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
})
config.font_size = 12.0
config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
config.use_ime = true
config.warn_about_missing_glyphs = false

config = require("lua.keybinds").apply(config, wezterm)
config = require("lua.toggle_opacity").apply(config, wezterm)

return config

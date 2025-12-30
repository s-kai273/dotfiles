local wezterm = require('wezterm')

wezterm.on("toggle-opacity", function(window)
  local overrides = window:get_config_overrides() or {}

  if overrides.window_background_opacity == nil then
    overrides.window_background_opacity = 0.85
  else
    overrides.window_background_opacity = nil
  end

  window:set_config_overrides(overrides)
end)

return {
  color_scheme = "Tokyo Night Moon",
  debug_key_events = true,
  font = wezterm.font_with_fallback({
   "JetBrains Mono",
  }),
  keys = {
    {
      key = "o",
      mods = "CTRL|SHIFT",
      action = wezterm.action.EmitEvent("toggle-opacity"),
    },
    {
      key = "t",
      mods = "CTRL|SHIFT",
      action = wezterm.action.SpawnTab("CurrentPaneDomain"),
    },
  },
  warn_about_missing_glyphs = false,
}


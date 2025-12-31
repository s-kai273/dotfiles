local M = {}

function M.apply(config, wezterm)
  local act = wezterm.action
  config.keys = config.keys or {}

  table.insert(config.keys, {
    key = "o",
    mods = "CTRL|SHIFT",
    action = act.EmitEvent("toggle_opacity"),
  })

  wezterm.on("toggle_opacity", function(window)
    local overrides = window:get_config_overrides() or {}

    if overrides.window_background_opacity == nil then
      overrides.window_background_opacity = 0.70
    else
      overrides.window_background_opacity = nil
    end

    window:set_config_overrides(overrides)
  end)

  return config
end

return M

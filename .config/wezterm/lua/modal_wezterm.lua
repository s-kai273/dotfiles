local M = {}

function M.apply(config, wezterm)
  local modal = wezterm.plugin.require("https://github.com/MLFlexer/modal.wezterm")
  modal.apply_to_config(config)
  modal.set_default_keys(config)
  return config
end

return M

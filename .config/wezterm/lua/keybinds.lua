local M = {}

local function split_conf(config, wezterm)
  local act = wezterm.action

  table.insert(config.keys, {
    key = "w",
    mods = "CTRL|ALT|SHIFT",
    action = act.ActivateKeyTable {
      name = "pane_prefix",
      one_shot = true,
      timeout_milliseconds = 1000,
    },
  })
  config.key_tables.pane_prefix = {
    {
      key = "s",
      action = act.SplitVertical { domain = "CurrentPaneDomain" },
    },
    {
      key = "v",
      action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
    },
    {
      key = "h",
      action = act.ActivatePaneDirection "Left",
    },
    {
      key = "j",
      action = act.ActivatePaneDirection "Down",
    },
    {
      key = "k",
      action = act.ActivatePaneDirection "Up",
    },
    {
      key = "l",
      action = act.ActivatePaneDirection "Right",
    },
    {
      key = "h",
      mods = "SHIFT",
      action = act.ActivateTabRelative(-1),
    },
    {
      key = "l",
      mods = "SHIFT",
      action = act.ActivateTabRelative(1),
    },
  }
  return config
end

local function new_tab_conf(config, wezterm)
  local act = wezterm.action

  table.insert(config.keys, {
    key = "t",
    mods = "CTRL|SHIFT",
    action = act.SpawnTab("CurrentPaneDomain"),
  })
  return config
end

function M.apply(config, wezterm)
  config.keys = config.keys or {}
  config.key_tables = config.key_tables or {}

  config = split_conf(config, wezterm)
  config = new_tab_conf(config, wezterm)
  return config
end

return M

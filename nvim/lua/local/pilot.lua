local copilot = require('copilot.suggestion')

local default_config = {
  -- copilot-first experience vs cmp-first experience
  enabled = false
}

local mod = {
  config = default_config
}

function mod.enabled()
  return mod.config.enabled
end

function mod.toggle()
  mod.config.enabled = not mod.config.enabled
  --@todo find a better way to toggle, this assumes it always starts as off
  copilot.toggle_auto_trigger()
  print("pilot is now " .. (mod.config.enabled and "enabled" or "disabled"))
end

--@todo add setup here with the actual copilot plugin and cmp plugins
function mod.setup(opts)
  local config = vim.tbl_deep_extend("force", default_config, opts or {})
  mod.config = config
end

return mod

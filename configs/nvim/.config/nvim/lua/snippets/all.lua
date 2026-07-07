local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node

return {
  s("utcnow", {
    f(function()
      return os.date("!%Y-%m-%dT%H:%M:%SZ")
    end),
  }),
}

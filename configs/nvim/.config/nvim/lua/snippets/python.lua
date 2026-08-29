local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s("ii", {
    t("int(input())"),
  }),
  s("mii", {
    t("map(int, input().split())"),
  }),
}

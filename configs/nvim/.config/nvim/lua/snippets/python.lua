local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("ii", {
    t("int(input())"),
  }),
  s("mii", {
    t("map(int, input().split())"),
  }),
  s("pytest", fmt([[
import pytest

@pytest.mark.parametrize(
    "{}",
    [
        ({}),
    ],
)
def {}({}):
    {}
]], {
    i(1, "abc, expected"),
    i(2),
    i(3, "xxx"),
    i(4, "abc, expected"),
    i(0, "pass"),
  })),
}

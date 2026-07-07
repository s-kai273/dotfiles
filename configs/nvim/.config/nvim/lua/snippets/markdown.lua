local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  s("postfm", {
    d(1, function()
      local timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
      local date_path = os.date("!%Y/%m/%d")

      return sn(nil, fmt([[
---
author: Shin Kinoshita
pubDatetime: {}
modDatetime: {}
title: {}
featured: false
draft: true
tags:
  - {}
canonicalURL: https://dissection.skai273.dev/posts/{}/{}
description: {}
---
]], {
        i(1, timestamp),
        rep(1),
        i(2, "title"),
        i(3, "others"),
        i(4, date_path),
        i(5, "slug"),
        i(6, "description"),
      }))
    end),
  }),
}

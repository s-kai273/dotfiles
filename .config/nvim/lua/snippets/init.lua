local ls = require("luasnip")

ls.add_snippets("all", require("snippets.all"))
ls.add_snippets("markdown", require("snippets.markdown"))

return {}

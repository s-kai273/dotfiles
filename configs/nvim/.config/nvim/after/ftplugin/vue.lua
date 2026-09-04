-- A `<script setup>` SFC exports its component anonymously, so there is no symbol
-- in the file for `vim.lsp.buf.references` to resolve and "who renders this
-- component?" cannot be answered over LSP. Volar's `findFileReference` request is
-- not registered in v3's hybrid mode, and vtsls' `findAllFileReferences` rejects
-- `.vue` buffers outright, so grep on the file name is the only route that covers
-- every case -- including globally registered and auto-imported components, which
-- leave no import for a language server to follow.
local function find_usages()
  if vim.fn.executable("rg") == 0 then
    vim.notify("ripgrep is required (brew install ripgrep)", vim.log.levels.ERROR)
    return
  end

  local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t:r")
  if name == "" then
    vim.notify("No file name for current buffer", vim.log.levels.WARN)
    return
  end

  -- Templates may reference the component in either case style.
  local kebab = name:gsub("(%l%d*)(%u)", "%1-%2"):lower()
  local tags = kebab == name and name or (name .. "|" .. kebab)

  require("telescope.builtin").grep_string({
    search = ([[</?(%s)[\s/>]|%s\.vue]]):format(tags, name),
    use_regex = true,
    prompt_title = "Usages of " .. name,
  })
end

vim.keymap.set("n", "<leader>fu", find_usages, {
  buffer = true,
  desc = "Find Vue component usages",
})

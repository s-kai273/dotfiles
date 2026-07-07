local ok, jdtls = pcall(require, "jdtls")
if not ok then
  return
end

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "build.gradle.kts" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if not root_dir then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
  capabilities = cmp.default_capabilities(capabilities)
end

local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local jdtls_cmd = vim.fn.exepath("jdtls")
if jdtls_cmd == "" then
  jdtls_cmd = mason_path .. "/bin/jdtls"
end
if vim.fn.executable(jdtls_cmd) == 0 then
  return
end

local project_name = vim.fn.fnamemodify(root_dir, ":t")
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls-workspace/" .. project_name

jdtls.start_or_attach({
  capabilities = capabilities,
  cmd = {
    jdtls_cmd,
    "-data",
    workspace_dir,
  },
  root_dir = root_dir,
})

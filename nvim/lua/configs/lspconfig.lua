-- Load NvChad defaults
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- List of servers to enable
local servers = { "gopls", "ts_ls", "emmet_language_server", "html", "cssls", "intelephense", "terraformls", "lemminx", "lua_ls", "ember" }

-- Enable servers using new vim.lsp.config API
for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end

-- Go-specific settings (gopls)
vim.lsp.config.gopls = {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      analyses = {
      unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}

-- TypeScript-specific settings with auto-imports
vim.lsp.config.ts_ls = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayFunctionParameterTypeHints = true,
      },
      suggest = {
        autoImports = true,
      },
    },
    javascript = {
      suggest = {
        autoImports = true,
      },
    },
  },
}
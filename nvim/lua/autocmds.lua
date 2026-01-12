require "nvchad.autocmds"

-- Load custom LuaSnip snippets
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.defer_fn(function()
      require("configs.luasnip")
    end, 100)
  end,
})

-- Auto-open nvim-tree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Open nvim-tree if no file was opened
    if vim.fn.argc() == 0 then
      require("nvim-tree.api").tree.open()
    end
  end,
})

-- Set filetype for protobuf files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.pb", "*.proto"},
  callback = function()
    vim.bo.filetype = "proto"
  end,
})

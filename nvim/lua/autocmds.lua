require "nvchad.autocmds"

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

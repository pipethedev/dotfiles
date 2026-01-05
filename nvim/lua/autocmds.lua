require "nvchad.autocmds"

-- Auto-open nvim-tree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Open nvim-tree if no file was opened
    if vim.fn.argc() == 0 then
      vim.cmd("NvimTreeOpen")
    end
  end,
})

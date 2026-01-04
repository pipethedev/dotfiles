require "nvchad.options"

-- add yours here!

-- local o = vim.o

vim.opt.cursorlineopt ='both' -- to enable cursorline!
--
vim.g.nvim_tree_auto_open = 1

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd("NvimTreeToggle")
    end
  end,
})

-- Real-time LSP analytics (update as you type)
vim.diagnostic.config({
  update_in_insert = true,  -- Show diagnostics while typing
  virtual_text = true,       -- Show error text inline
  signs = true,              -- Show error icons in gutter
  underline = true,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go", "*.ts", "*.tsx", "*.js", "*.jsx", "*.php" },
  callback = function()
    vim.lsp.buf.format({ timeout_ms = 2000 })
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.cmd("startinsert")
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  callback = function()
    vim.cmd("startinsert")
  end,
})


-- Update diagnostics faster
vim.opt.updatetime = 250

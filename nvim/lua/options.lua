require "nvchad.options"

-- add yours here!

-- local o = vim.o

vim.opt.cursorlineopt ='both' -- to enable cursorline!

-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

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
  pattern = "*",
  callback = function()
    -- Lock terminal windows to prevent files opening in them
    if vim.bo.buftype == "terminal" then
      vim.opt_local.winfixbuf = true
      vim.cmd("startinsert")
    end
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  callback = function()
    vim.cmd("startinsert")
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd("stopinsert")
    end
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.opt_local.winfixbuf = true
    end
  end,
})

vim.api.nvim_set_keymap('n', '<LeftRelease>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<LeftRelease>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<LeftRelease>', '<Nop>', { noremap = true, silent = true })


vim.opt.guicursor = {
  "n-v-c:block",
  "i-ci-ve:ver25",
  "r-cr:hor20",
  "o:hor50",
  "a:blinkwait700-blinkoff400-blinkon250",
  "sm:block-blinkwait175-blinkoff150-blinkon175",
}

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.cmd("startinsert")
  end,
})

-- Fix paste in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.paste = true
  end,
})

-- Update diagnostics faster
vim.opt.updatetime = 250

-- Auto-reload files when changed externally (only if buffer is unmodified)
vim.opt.autoread = true

-- Check for external file changes when switching buffers or gaining focus
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    -- Only checktime if we're not in command mode and buffer is not modified
    if vim.fn.mode() ~= "c" and not vim.bo.modified then
      vim.cmd("checktime")
    end
  end,
})

-- Notification when file changes
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
  end,
})
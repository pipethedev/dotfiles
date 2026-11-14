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
  callback = function(event)
    -- Open nvim-tree if no file was opened
    if vim.fn.argc() == 0 then
      require("nvim-tree.api").tree.open()
      return
    end
    -- `nvim <folder>`: show the tree beside an empty editor, like opening a folder in VS Code
    if vim.fn.isdirectory(event.file) == 1 then
      vim.cmd.cd(event.file)
      vim.schedule(function()
        vim.cmd.enew()
        vim.cmd.bwipeout(event.buf)
        require("nvim-tree.api").tree.open()
      end)
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

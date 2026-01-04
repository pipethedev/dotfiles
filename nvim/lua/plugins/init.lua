return {
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "nyoom-engineering/oxocarbon.nvim", lazy = false, priority = 1000 },
  { "mcchrish/zenbones.nvim", dependencies = "rktjmp/lush.nvim", lazy = false },
  { "rktjmp/lush.nvim" },
  { "artanikin/vim-synthwave84", lazy = false, priority = 1000 },
  { "sheerun/vim-wombat-scheme", lazy = false, priority = 1000 },
  { "samharju/synthweave.nvim", lazy = false, priority = 1000 },
  { "maxmx03/fluoromachine.nvim", lazy = false, priority = 1000 },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  "lewis6991/gitsigns.nvim",
  event = "BufRead",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
      },
      current_line_blame = false,
      current_line_blame_opts = {
        delay = 500,
      },
    })
  end,
},
{
  "windwp/nvim-ts-autotag",
  ft = {
    "html",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "tsx",
    "jsx",
  },
  config = function()
    require("nvim-ts-autotag").setup({
      opts = {
        enable_close = true,          -- Auto close tags
        enable_rename = true,          -- Auto rename pairs of tags
        enable_close_on_slash = false  -- Auto close on trailing </
      },
    })
  end,
},
{
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {},
  config = function(_, opts)
    require('lsp_signature').setup(opts)
  end
},
{
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.5
        end
      end,
      open_mapping = [[<C-\>]],
      direction = "horizontal",
      on_create = function()
        vim.opt_local.scrolloff = 0
      end,
    })
    
    local function get_term_wins()
      local wins = {}
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].buftype == 'terminal' then
          table.insert(wins, win)
        end
      end
      return wins
    end
    
    vim.keymap.set('n', '<leader>ts', function()
      local term_wins = get_term_wins()
      if #term_wins > 0 then
        vim.api.nvim_set_current_win(term_wins[1])
        vim.cmd('vsplit')
        vim.cmd('term')
        vim.cmd('startinsert')
      else
        vim.cmd('ToggleTerm direction=vertical')
      end
    end, { desc = "Split terminal side-by-side" })
    
    vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { desc = "Move left" })
    vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { desc = "Move right" })
    vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { desc = "Move up" })
    vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { desc = "Move down" })
  end,
},
{
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>sr", function() require("spectre").open() end, desc = "Search & Replace" },
  },
},
{
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
  },
},
{
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {},
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
  },
},
{
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
},
{
  "williamboman/mason.nvim",
  opts = function()
    return require "configs.mason"
  end,
},
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}

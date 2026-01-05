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
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false
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
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local conf = require("nvchad.configs.nvimtree")
      conf.filters = {
        dotfiles = false,
        git_ignored = false,
        custom = {},
      }
      conf.git = {
        enable = true,
        ignore = false,
      }
      return conf
    end,
  },
}
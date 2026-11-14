return {
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      vim.g.VM_default_mappings = 0
      vim.g.VM_maps = {
        ["Find Under"] = "<M-C-d>",
        ["Find Subword Under"] = "<M-C-d>",
      }
    end,
  },
}

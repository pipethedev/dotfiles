-- Telescope ignores the mouse: a plain click moves focus into the results list,
-- where the arrow keys and Enter no longer drive the picker. These keep focus in
-- the search box: click highlights a result, double click opens it.
local function selectClicked(promptBuffer)
  local picker = require("telescope.actions.state").get_current_picker(promptBuffer)
  local mouse = vim.fn.getmousepos()
  if mouse.winid ~= picker.results_win then
    return false
  end
  picker:set_selection(mouse.line - 1)
  return true
end

local function openClicked(promptBuffer)
  if selectClicked(promptBuffer) then
    require("telescope.actions").select_default(promptBuffer)
  end
end

local mouseMappings = {
  ["<LeftMouse>"] = selectClicked,
  ["<2-LeftMouse>"] = openClicked,
}

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults = opts.defaults or {}
      opts.defaults.mappings = vim.tbl_deep_extend("force", opts.defaults.mappings or {}, {
        i = mouseMappings,
        n = mouseMappings,
      })
      return opts
    end,
  },
}

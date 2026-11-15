-- VS Code style keys.
-- Ghostty turns Cmd+<key> into Ctrl+Alt+<key> (see ghostty-config), tmux forwards
-- those to Neovim only, so here Cmd+S is "<M-C-s>" and Cmd+Shift+P is "<M-C-S-p>".

local map = vim.keymap.set

local function cmd(key)
  return "<M-C-" .. key .. ">"
end

local function cmdShift(key)
  return "<M-C-S-" .. key .. ">"
end

local function telescope(picker)
  return "<cmd>Telescope " .. picker .. "<cr>"
end

local ignoredPaths = { "node_modules/", "^%.git/" }

local function quickOpen()
  require("telescope.builtin").find_files { hidden = true, file_ignore_patterns = ignoredPaths }
end

local function findInFiles()
  require("telescope.builtin").live_grep {
    additional_args = { "--hidden" },
    file_ignore_patterns = ignoredPaths,
  }
end

-- Draws the current file (an SVG, for example) as an image in a split beside it.
local function previewImage()
  local file = vim.api.nvim_buf_get_name(0)
  vim.cmd.vnew()
  local buffer = vim.api.nvim_get_current_buf()
  vim.bo[buffer].buftype = "nofile"
  vim.bo[buffer].bufhidden = "wipe"
  vim.bo[buffer].swapfile = false
  vim.bo[buffer].filetype = "image"
  vim.bo[buffer].modifiable = false
  require("snacks").image.placement.new(buffer, file, { conceal = true, auto_resize = true })
end

local function closeBuffer()
  require("nvchad.tabufline").close_buffer()
end

local function nextBuffer()
  require("nvchad.tabufline").next()
end

local function previousBuffer()
  require("nvchad.tabufline").prev()
end

local function focusWindow(number)
  return function()
    vim.cmd(number .. "wincmd w")
  end
end

-- Shift+arrows select, plain arrows drop the selection, arrows wrap across lines.
vim.opt.keymodel = "startsel,stopsel"
vim.opt.selection = "exclusive"
vim.opt.whichwrap:append "<,>,[,]"

-- Files
map({ "n", "i", "x" }, cmd "s", "<cmd>w<cr>", { desc = "Save" })
map({ "n", "i", "x" }, cmd "p", quickOpen, { desc = "Quick open" })
map({ "n", "i", "x" }, cmdShift "p", telescope "commands", { desc = "Command palette" })
map({ "n", "i", "x" }, cmd "w", closeBuffer, { desc = "Close tab" })
map({ "n", "i", "x" }, cmd "8", nextBuffer, { desc = "Next tab" })
map({ "n", "i", "x" }, cmd "7", previousBuffer, { desc = "Previous tab" })

-- Sidebar and panels
map({ "n", "i", "x" }, cmd "b", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle sidebar" })
map({ "n", "i", "x", "t" }, cmdShift "e", "<cmd>NvimTreeFocus<cr>", { desc = "Focus explorer" })
map({ "n", "i", "x" }, cmdShift "m", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Problems" })
map({ "n", "i", "x" }, cmd "\\", "<cmd>vsplit<cr>", { desc = "Split editor" })
map({ "n", "i", "x" }, cmdShift "v", previewImage, { desc = "Open preview to the side" })
map({ "n", "i", "x", "t" }, cmd "1", focusWindow(1), { desc = "Focus first editor" })
map({ "n", "i", "x", "t" }, cmd "2", focusWindow(2), { desc = "Focus second editor" })
map({ "n", "i", "x", "t" }, cmd "3", focusWindow(3), { desc = "Focus third editor" })

-- Search
map({ "n", "i", "x" }, cmd "f", telescope "current_buffer_fuzzy_find", { desc = "Find in file" })
map({ "n", "i", "x" }, cmdShift "f", findInFiles, { desc = "Find in files" })
map({ "n", "i", "x" }, cmdShift "h", function()
  require("spectre").toggle()
end, { desc = "Replace in files" })
map({ "n", "i", "x" }, cmdShift "o", telescope "lsp_document_symbols", { desc = "Go to symbol" })
map("n", cmd "g", "n", { desc = "Find next" })
map("n", cmdShift "g", "N", { desc = "Find previous" })

-- Undo, redo
map({ "n", "x" }, cmd "z", "<cmd>undo<cr>", { desc = "Undo" })
map("i", cmd "z", "<cmd>undo<cr>", { desc = "Undo" })
map({ "n", "i", "x" }, cmdShift "z", "<cmd>redo<cr>", { desc = "Redo" })

-- Clipboard. Paste is Ghostty's own Cmd+V.
map("x", cmd "c", '"+ygv', { desc = "Copy" })
map("n", cmd "c", '"+yy', { desc = "Copy line" })
map("i", cmd "c", '<cmd>normal! "+yy<cr>', { desc = "Copy line" })
map("x", cmd "x", '"+d', { desc = "Cut" })
map("n", cmd "x", '"+dd', { desc = "Cut line" })
map("i", cmd "x", '<cmd>normal! "+dd<cr>', { desc = "Cut line" })

-- Selection
map("n", cmd "a", "ggVG", { desc = "Select all" })
map({ "i", "x" }, cmd "a", "<Esc>ggVG", { desc = "Select all" })
map("n", cmd "l", "V", { desc = "Select line" })
map("i", cmd "l", "<Esc>V", { desc = "Select line" })
map("x", cmd "l", "j", { desc = "Extend selection by a line" })
map("x", "<BS>", '"_d', { desc = "Delete selection" })
map("x", "<Del>", '"_d', { desc = "Delete selection" })
map("x", "<Tab>", ">gv", { desc = "Indent selection" })
map("x", "<S-Tab>", "<gv", { desc = "Outdent selection" })

-- Lines
map("n", cmd "/", "gcc", { desc = "Toggle comment", remap = true })
map("i", cmd "/", "<cmd>normal gcc<cr>", { desc = "Toggle comment" })
map("x", cmd "/", "gcgv", { desc = "Toggle comment", remap = true })
map({ "n", "i" }, cmdShift "k", '<cmd>normal! "_dd<cr>', { desc = "Delete line" })
map("x", cmdShift "k", '"_d', { desc = "Delete lines" })
map("n", cmd "CR", "o", { desc = "Insert line below" })
map("i", cmd "CR", "<C-o>o", { desc = "Insert line below" })
map("n", cmdShift "CR", "O", { desc = "Insert line above" })
map("i", cmdShift "CR", "<C-o>O", { desc = "Insert line above" })
map("n", cmd "0", ">>", { desc = "Indent line" })
map("n", cmd "9", "<<", { desc = "Outdent line" })
map("i", cmd "0", "<C-t>", { desc = "Indent line" })
map("i", cmd "9", "<C-d>", { desc = "Outdent line" })
map("x", cmd "0", ">gv", { desc = "Indent selection" })
map("x", cmd "9", "<gv", { desc = "Outdent selection" })

-- Alt+Up/Down moves lines, Shift+Alt+Up/Down copies them.
map("n", "<M-Down>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<M-Up>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("i", "<M-Down>", "<cmd>m .+1<cr><cmd>normal! ==<cr>", { desc = "Move line down" })
map("i", "<M-Up>", "<cmd>m .-2<cr><cmd>normal! ==<cr>", { desc = "Move line up" })
map("x", "<M-Down>", ":m '>+1<cr>gv=gv", { desc = "Move lines down" })
map("x", "<M-Up>", ":m '<-2<cr>gv=gv", { desc = "Move lines up" })
map({ "n", "i" }, "<M-S-Down>", "<cmd>t .<cr>", { desc = "Copy line down" })
map({ "n", "i" }, "<M-S-Up>", "<cmd>t .-1<cr>", { desc = "Copy line up" })
map("x", "<M-S-Down>", ":t '><cr>gv", { desc = "Copy lines down" })
map("x", "<M-S-Up>", ":t '<-1<cr>gv", { desc = "Copy lines up" })

-- Alt+Left/Right moves by word, Alt+Backspace deletes a word.
map({ "n", "x" }, "<M-b>", "b", { desc = "Word left" })
map({ "n", "x" }, "<M-f>", "w", { desc = "Word right" })
map("i", "<M-b>", "<C-o>b", { desc = "Word left" })
map("i", "<M-f>", "<C-o>w", { desc = "Word right" })
map("i", "<M-BS>", "<C-w>", { desc = "Delete word" })
map("n", "<M-S-Left>", "vb", { desc = "Select word left" })
map("n", "<M-S-Right>", "ve", { desc = "Select word right" })
map("i", "<M-S-Left>", "<Esc>vb", { desc = "Select word left" })
map("i", "<M-S-Right>", "<Esc>lve", { desc = "Select word right" })
map("x", "<M-S-Left>", "b", { desc = "Extend selection word left" })
map("x", "<M-S-Right>", "e", { desc = "Extend selection word right" })

-- Code
map({ "n", "i" }, "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })
map({ "n", "i" }, "<F12>", vim.lsp.buf.definition, { desc = "Go to definition" })
map({ "n", "i" }, "<S-F12>", vim.lsp.buf.references, { desc = "Find references" })
map({ "n", "i", "x" }, cmd ".", vim.lsp.buf.code_action, { desc = "Quick fix" })

-- Terminal panel at the bottom, like VS Code: Ctrl+` or Cmd+J shows and hides it.
local function togglePanel()
  require("nvchad.term").toggle { pos = "sp", id = "vscodePanel", size = 0.3 }
end

map({ "n", "i", "x", "t" }, cmd "t", togglePanel, { desc = "Toggle terminal" })
map({ "n", "i", "x", "t" }, cmd "j", togglePanel, { desc = "Toggle terminal" })

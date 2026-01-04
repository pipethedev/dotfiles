require "nvchad.mappings"

local map = vim.keymap.set

-- ==========================================
-- BASIC VIM SETTINGS
-- ==========================================

-- Exit insert mode with jj
map("i", "jj", "<ESC>", { desc = "Exit insert mode" })

-- Command mode shortcut
map("n", ";", ":", { desc = "CMD enter command mode" })

-- ==========================================
-- FILE OPERATIONS
-- ==========================================
-- File explorer
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
map("n", "<C-b>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle sidebar" })
map("n", "<D-b>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle sidebar with Cmd+B" })

-- Save file
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
map("i", "<C-s>", "<ESC><cmd>w<cr>", { desc = "Save file" })
map("v", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>ww", "<cmd>w<cr>", { desc = "Save file" })

-- Also map Cmd+S for Mac users
map("n", "<D-s>", "<cmd>w<cr>", { desc = "Save file" })
map("i", "<D-s>", "<Esc><cmd>w<cr>a", { desc = "Save file" })
map("v", "<D-s>", "<Esc><cmd>w<cr>gv", { desc = "Save file" })

-- Close buffer
map("n", "<leader>wc", "<cmd>bd<cr>", { desc = "Close buffer" })
map("n", "<leader>x", "<cmd>bd<cr>", { desc = "Close buffer" })

-- Copy file path
map("n", "<leader>fy", "<cmd>let @+ = expand('%:p')<cr>", { desc = "Copy file path" })

-- ==========================================
-- NAVIGATION
-- ==========================================

-- Quick file search
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })

-- Command palette
map("n", "<C-S-p>", "<cmd>Telescope commands<cr>", { desc = "Command palette" })

-- Find in files
map("n", "<C-f>", "<cmd>Telescope live_grep<cr>", { desc = "Find in files" })

-- File explorer
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
map("n", "<C-b>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle sidebar" })

-- Reveal in explorer
map("n", "<leader>f", "<cmd>NvimTreeFindFile<cr>", { desc = "Reveal in explorer" })

-- ==========================================
-- WINDOW MANAGEMENT
-- ==========================================

-- Split editor
map("n", "<leader>w", "<cmd>vsplit<cr>", { desc = "Vertical split" })

-- Navigate splits
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom split" })

-- Resize splits
map("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease width" })
map("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase width" })

-- ==========================================
-- BUFFER NAVIGATION
-- ==========================================

-- Next/Previous buffer
map("n", "<A-]>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<A-[>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

-- Buffer picker
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })

-- ==========================================
-- CODE EDITING
-- ==========================================

-- Delete line
map("n", "<leader>d", "dd", { desc = "Delete line" })

-- Comment
map("n", "<leader>c", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>c", "gc", { desc = "Toggle comment", remap = true })

-- Format document
map("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format document" })

-- Clear search highlight
map("n", "<C-n>", "<cmd>noh<cr>", { desc = "Clear search highlight" })

-- ==========================================
-- LSP
-- ==========================================

-- Go to definition
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

-- Go back
map("n", "<C-t>", "<C-o>", { desc = "Go back" })

-- Find references
map("n", "gr", vim.lsp.buf.references, { desc = "Find references" })

-- Hover
map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })

-- Code actions
map("n", "<leader>.", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Rename
map("n", "<leader>re", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- ==========================================
-- DIAGNOSTICS
-- ==========================================

-- Next/Previous diagnostic
map("n", "<F8>", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<S-F8>", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

-- ==========================================
-- VISUAL MODE
-- ==========================================

-- Sort lines
map("v", "<leader>ss", ":sort<cr>", { desc = "Sort lines" })

-- Transform case
map("v", "<leader>u", "U", { desc = "To uppercase" })
map("v", "<leader>l", "u", { desc = "To lowercase" })

-- Move lines
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

-- ==========================================
-- TERMINAL
-- ==========================================

-- Toggle terminal
map("n", "<leader>tt", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Toggle terminal" })

map("t", "<ESC>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Toggle terminal" })

-- Horizontal terminal
map("n", "<leader>th", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "New horizontal term" })

-- Vertical terminal
map("n", "<leader>tv", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "New vertical term" })

-- ==========================================
-- GIT
-- ==========================================

-- Open Lazygit
map("n", "<leader>gg", "<cmd>terminal lazygit<cr>", { desc = "Open Lazygit" })

-- ==========================================
-- TELESCOPE
-- ==========================================

-- Find help
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help" })

-- Find old files
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Find old files" })

-- ==========================================
-- MISC
-- ==========================================

-- Select all
map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Centered scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })

-- Centered search
map("n", "n", "nzzzv", { desc = "Next result centered" })
map("n", "N", "Nzzzv", { desc = "Prev result centered" })


map("n", "<leader>tt", function()
  vim.cmd("botright split | resize 15 | terminal")
end, { desc = "Toggle terminal" })


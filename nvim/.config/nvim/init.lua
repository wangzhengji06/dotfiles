-- Set leader FIRST (some plugins read it on load)
vim.g.mapleader = " "

-- Core options (Lua-native)
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.swapfile = false
vim.opt.number = true -- global default for all windows
vim.opt.relativenumber = true
vim.opt.background = "dark"
vim.opt.termguicolors = true -- better colors in terminals
vim.opt.clipboard = "unnamedplus"

-- Keymaps
local map, opts = vim.keymap.set, { silent = true }
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<space><space>x", "<cmd>source %<CR>")
map("n", "<space>x", ":.lua<CR>")
map("v", "<space>x", ":lua<CR>")
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search" })

-- Quality of Life
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking the text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Oil
vim.keymap.set("n", "-", "<cmd>Oil<CR>")

-- Import dependency
require("config.lazy")

vim.g.mapleader = " "

-- Move highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Search term stays in center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Allow visual paste no-replace
vim.keymap.set("x", "p", "\"_dP")

-- Allow yank/paste to system clipboard
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+P")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Closing brackets
-- vim.keymap.set("i", "{", "{}<Left>")
-- vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O")

-- leader
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Save and quit
vim.keymap.set("n", "<leader>s", ":update<cr>")
vim.keymap.set("n", "<leader>q", "ZQ")

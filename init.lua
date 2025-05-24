require("config.lazy")

vim.opt.nu = true
vim.opt.relativenumber = true


vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>e", ":Explore<CR>")

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- this shit don't work..?
-- vim.keymap.set("n", "<space>x", ":.lua <CR>")
-- vim.keymap.set("v", "<space>x", ":lua <CR>")

-- Highlight text that is being yanked
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   desc = 'Highlight when yanking (copying) text',
--   group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })

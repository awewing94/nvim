require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":update<CR>")
vim.keymap.set("n", "<leader>ex", ":Explore<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<leader>df", function()
  vim.diagnostic.jump({ count = 1, float = true })
end)

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- this shit don't work..?
-- vim.keymap.set("n", "<space>x", ":.lua <CR>")
-- vim.keymap.set("v", "<space>x", ":lua <CR>")

-- Highlight text that is being yanked
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Terminal configuration - not sure if I'll ever actually use this
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
end)

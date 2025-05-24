return {
  'nvim-telescope/telescope.nvim',
  enabled = true,
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    require("telescope").setup {
      defaults = {
        preview = {
          treesitter = {
            -- Disable treesitter for json. Fixes bug that took me hours, holy.
            disable = { "json" }
          }
        }
      },
    }

    vim.keymap.set("n", "<C-p>", require('telescope.builtin').find_files)
  end,
}

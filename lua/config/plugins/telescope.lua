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
            -- Only enable treesitter for languages we know we have an lsp installed for
            --  ...I think. I don't understand this 100%
            enable = { "lua", "go" }
          }
        }
      },
    }

    require("telescope").load_extension('fzf')

    local builtin = require('telescope.builtin')
    vim.keymap.set("n", "<C-p>", builtin.find_files)
    vim.keymap.set("n", "<leader>fh", builtin.help_tags)
    -- Edit neovim
    vim.keymap.set("n", "<leader>en", function()
      builtin.find_files {
        cwd = vim.fn.stdpath("config")
      }
    end)
    vim.keymap.set("n", "<leader>ep", function()
      builtin.find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      }
    end)

    require("config.telescope.multigrep").setup()
  end,
}

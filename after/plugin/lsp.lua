local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- why doesn't this work...
--vim.keymap.set("n", "<leader>kl", vim.lsp.buf.code_action({ only={"quickfix"}, }))

-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

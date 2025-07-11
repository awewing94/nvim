return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local defaultSetup = {
				capabilities = require('blink.cmp').get_lsp_capabilities(),
			}

			require("lspconfig").lua_ls.setup(defaultSetup)
			require("lspconfig").gopls.setup(defaultSetup)

			vim.api.nvim_create_autocmd('LspAttach', {
				-- Auto-format ("lint") on save.
				-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
				group = vim.api.nvim_create_augroup('my.lsp', {}),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then return end

					-- COMMENTING OUT FOR NOW -- should just fix for ts files
					-- if not client:supports_method('textDocument/willSaveWaitUntil')
					-- 		and client:supports_method('textDocument/formatting') then
					-- 	vim.api.nvim_create_autocmd('BufWritePre', {
					-- 		-- group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
					-- 		buffer = args.buf,
					-- 		callback = function()
					-- 			vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
					-- 		end,
					-- 	})
					-- end
				end,
			})
		end,
	}
}

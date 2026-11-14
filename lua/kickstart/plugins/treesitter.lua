-- Highlight, edit, and navigate code
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
	-- NOTE: The `main` branch no longer supports `ensure_installed` or `highlight`
	-- options, so parsers are installed and highlighting is started here.
	config = function()
		require("nvim-treesitter").install({
			"bash",
			"c",
			"diff",
			"go",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"templ",
			"vim",
			"vimdoc",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				-- Falls back to regex syntax highlighting when no parser is installed
				if pcall(vim.treesitter.start, args.buf) and args.match ~= "ruby" then
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
	-- There are additional nvim-treesitter modules that you can use to interact
	-- with nvim-treesitter. You should go explore a few and see what interests you:
	--
	--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
	--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}

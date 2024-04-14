return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"json",
				"yaml",
				"bash",
				"dockerfile",
				"c",
				"vimdoc",
				"vim",
				"go",
				"lua",
				"sql",
				"javascript",
				"typescript",
				"markdown",
				"markdown_inline",
				"gomod",
				"gosum",
				"proto",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}

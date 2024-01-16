return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- "mocha", -- latte, frappe, macchiato, mocha
			integrations = {
        cmp = true,
				nvimtree = false,
				neotree = true,
			},
			transparent_background = true,
		})
		vim.cmd.colorscheme("catppuccin")
		vim.cmd([[highlight WinSeparator guibg=None guifg=#242437]])
		vim.cmd([[highlight CursorLineNr guibg=None guifg=#A7E8AD gui=bold,italic]])
		-- vim.cmd([[highlight PmenuSel guibg=#A7E8AD guifg=None]])

		-- vim.cmd([[highlight Pmenu ctermbg=green guibg=green]])
		-- vim.cmd([[highlight PmenuSel ctermbg=green guibg=green]])
		-- vim.cmd([[highlight CursorLineNr guibg=None guifg=#FDD14A gui=bold,italic]])
		-- Set custom highlights
		-- vim.cmd([[ hi BufferLineBufferSelected guifg=#ff6b1d gui=bold,italic ]])
	end,
}

return {
	-- "catppuccin/nvim",
	-- name = "catppuccin",
	-- priority = 1000,
	-- config = function()
	--   require("catppuccin").setup({
	--     flavour = "macchiato", -- "mocha", -- latte, frappe, macchiato, mocha
	--     integrations = {
	--       nvimtree = false,
	--       neotree = true,
	--     },
	--   })
	--   vim.cmd.colorscheme("catppuccin")
	--   vim.cmd([[highlight WinSeparator guibg=None guifg=#242437]])
	--   vim.cmd([[highlight CursorLineNr guibg=None guifg=#A7E8AD gui=bold,italic]])
	--   vim.cmd([[highlight Visual ctermbg=lightblue guibg=#A7E8AD guifg=#242437 gui=bold cterm=bold]])
	-- vim.cmd([[highlight Pmenu ctermbg=green guibg=green]])
	-- vim.cmd([[highlight PmenuSel ctermbg=green guibg=green]])
	-- vim.cmd([[highlight CursorLineNr guibg=None guifg=#FDD14A gui=bold,italic]])
	-- Set custom highlights
	-- vim.cmd([[ hi BufferLineBufferSelected guifg=#ff6b1d gui=bold,italic ]])
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd([[colorscheme tokyonight]])
		vim.cmd([[highlight CursorLineNr guibg=None guifg=#A7E8AD gui=bold,italic]])
		vim.cmd([[highlight Visual ctermbg=lightblue guibg=#A7E8AD guifg=#242437 gui=bold cterm=bold]])
		vim.cmd([[highlight GitSignsAdd guifg=#A7E8AD]])
		vim.cmd([[highlight GitSignsChange guifg=#FDD14A]])
		vim.cmd([[highlight GitSignsDelete guifg=#ff6b1d]])
		vim.cmd([[highlight WinSeparator guibg=None guifg=#273045]])
	end,
}

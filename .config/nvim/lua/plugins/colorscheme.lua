return {
	{
		"gmr458/vscode_modern_theme.nvim",
		lazy = false,
		-- event = "VeryLazy",
		priority = 1000,
		config = function()
			require("vscode_modern").setup({
				cursorline = true,
				transparent_background = false,
				nvim_tree_darker = true,
			})
			vim.cmd.colorscheme("vscode_modern")

			vim.cmd([[highlight NeoTreeNormalNC guifg = #181818 ]])

			-- NeoTree Directory and Git Status
			vim.cmd([[highlight NeoTreeDirectoryIcon guifg = #729db3 ]])
			vim.cmd([[highlight NeoTreeDirectoryName guifg = #729db3 ]])
			vim.cmd([[highlight NeoTreeTitleBar guifg=#1f1f1f guibg=#75beff ]])
			vim.cmd([[highlight NeoTreeGitModified guifg=#dcdcaa ]])

			-- NeoTree Float Title and Git Changes
			vim.cmd([[highlight NeoTreeFloatTitle guifg=#cccccc guibg=#1f1f1f ]])
			vim.cmd([[highlight NeoTreeGitConflict gui=bold,italic guifg=#ff8700 ]])
			vim.cmd([[highlight NeoTreeGitUntracked gui=italic guifg=#ff8700 ]])
			vim.cmd([[highlight NeoTreeFileStats guifg=#646464 ]])

			-- NeoTree Tabs and Separators
			vim.cmd([[highlight NeoTreeTabInactive guifg=#777777 guibg=#141414 ]])
			vim.cmd([[highlight NeoTreeTabSeparatorActive guifg=#0a0a0a ]])
			vim.cmd([[highlight NeoTreeTabSeparatorInactive guifg=#101010 guibg=#141414 ]])

			vim.cmd([[highlight BlinkCmpMenuSelection guibg=#b4ebbc guifg=#212031 gui=bold]])
			vim.cmd([[highlight BlinkCmpMenu guibg=#1f1f1f]])
			vim.cmd([[highlight BlinkCmpMenuBorder guibg=#1f1f1f]])
		end,
	},
	-- Lazy
	{
		"vague2k/vague.nvim",
		event = "VeryLazy",
		config = function()
			-- NOTE: you do not need to call setup if you don't want to.
			require("vague").setup({

				-- optional configuration here
				transparent = false, -- don't set background
				style = {
					-- "none" is the same thing as default. But "italic" and "bold" are also valid options
					boolean = "bold",
					number = "none",
					float = "none",
					error = "bold",
					comments = "none", -- italic
					conditionals = "none",
					functions = "none",
					headings = "bold",
					operators = "none",
					strings = "italic",
					variables = "none",

					-- keywords
					keywords = "none",
					keyword_return = "italic",
					keywords_loop = "none",
					keywords_label = "none",
					keywords_exception = "none",

					-- builtin
					builtin_constants = "bold",
					builtin_functions = "none",
					builtin_types = "bold",
					builtin_variables = "none",
				},
				-- plugin styles where applicable
				-- make an issue/pr if you'd like to see more styling options!
				plugins = {
					cmp = {
						match = "bold",
						match_fuzzy = "bold",
					},
					dashboard = {
						footer = "italic",
					},
					lsp = {
						diagnostic_error = "bold",
						diagnostic_hint = "none",
						diagnostic_info = "italic",
						diagnostic_warn = "bold",
					},
					neotest = {
						focused = "bold",
						adapter_name = "bold",
					},
					telescope = {
						match = "bold",
					},
				},
				-- Override colors
				colors = {
					bg = "#141415",
					fg = "#cdcdcd",
					floatBorder = "#878787",
					line = "#252530",
					comment = "#606079",
					builtin = "#b4d4cf",
					func = "#c48282",
					string = "#e8b589",
					number = "#e0a363",
					property = "#c3c3d5",
					constant = "#aeaed1",
					parameter = "#bb9dbd",
					visual = "#333738",
					error = "#df6882",
					warning = "#f3be7c",
					hint = "#7e98e8",
					operator = "#90a0b5",
					keyword = "#6e94b2",
					type = "#9bb4bc",
					search = "#405065",
					plus = "#8cb66d",
					delta = "#f3be7c",
				},
			})
		end,
	},
}

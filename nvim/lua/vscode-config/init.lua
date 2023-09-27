-- Lua:
-- For dark theme (neovim's default)
vim.o.background = "dark"
-- For light theme
-- vim.o.background = 'light'

require("vscode").setup({
	-- Enable italic comment
	italic_comments = true,
	-- Override colors (see ./lua/vscode/colors.lua)
	color_overrides = {
		vscGreen = "#505050",
		vscPopupFront = "#FFFFFF",
	},
})
require("vscode").load()

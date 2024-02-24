return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	-- event = "BufWinEnter",
	config = function()
		require("lualine").setup({
			options = {
				-- theme = auto,
				theme = "tokyonight",
				icons_enabled = true,
				disabled_filetypes = { "neo-tree" },
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				-- lualine_a = { "buffers" },
				lualine_b = { "branch", "diff", "diagnostics" },
				-- lualine_c = { "filename" },
				lualine_c = {
					function()
						local path = vim.fn.expand("%:p:h:t") -- parent directory name
						local file = vim.fn.expand("%:t") -- filename
						return path .. "/" .. file
					end,
				},
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}

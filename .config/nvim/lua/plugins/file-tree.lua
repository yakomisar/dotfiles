return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			float = {
				enabled = true,
				padding = 2,
				max_width = 90,
				max_height = 30,
				border = "rounded",
			},
			win_options = {
				wrap = true,
				winblend = 0,
			},
			keymaps = {
				["<C-c>"] = false,
				["q"] = "actions.close",
			},
		})
		-- Open parent directory in floating window
		vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

		-- -- Open parent directory in floating window
		-- vim.keymap.set("n", "<leader>e", require("oil").toggle_float)
	end,
}
-- return {
-- 	"nvim-neo-tree/neo-tree.nvim",
-- 	event = "VeryLazy",
-- 	branch = "v3.x",
-- 	cmd = "Neotree",
-- 	dependencies = {
-- 		"nvim-tree/nvim-web-devicons",
-- 		"MunifTanjim/nui.nvim",
-- 	},
-- 	config = function()
-- 		require("neo-tree").setup({
-- 			close_if_last_window = true,
-- 			buffers = {
-- 				follow_current_file = { enabled = true },
-- 			},
-- 			filesystem = {
-- 				follow_current_file = { enabled = true },
-- 				filtered_items = {
-- 					hide_dotfiles = false,
-- 					hide_gitignored = false,
-- 					hide_by_name = {
-- 						"node_modules",
-- 					},
-- 					never_show = {
-- 						".DS_Store",
-- 						"thumbs.db",
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- }

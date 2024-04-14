return {
	"nvim-neo-tree/neo-tree.nvim",
	event = "VeryLazy",
	branch = "v3.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			buffers = {
				follow_current_file = { enabled = true },
			},
			filesystem = {
				follow_current_file = { enabled = true },
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						"node_modules",
					},
					never_show = {
						".DS_Store",
						"thumbs.db",
					},
				},
			},
		})
	end,
}

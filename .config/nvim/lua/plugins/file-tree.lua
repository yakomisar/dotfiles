return {
	"nvim-neo-tree/neo-tree.nvim",
	event = "VeryLazy",
	branch = "v3.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "-", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
		{ "<leader>e", ":Neotree toggle left<CR>", silent = true, desc = "File Explorer" },
		{ "<C-n>", ":Neotree close<CR>", silent = true, desc = "Close File Explorer" },
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
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#181818" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { fg = "none", bg = "#181818" })
		vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#1f1f1f", bg = "#1f1f1f" })
	end,

	-- "nvim-tree/nvim-tree.lua",
	-- event = "VeryLazy",
	-- cmd = "NvimTreeFindFileToggle",
	-- keys = {
	-- 	{ "<leader>e", ":NvimTreeToggle<CR>", silent = true, desc = "File Explorer" },
	-- 	{ "<C-n>", ":NvimTreeClose<CR>", silent = true, desc = "Close File Explorer" },
	-- },
	-- config = function()
	-- 	require("nvim-tree").setup({
	-- 		hijack_cursor = true,
	-- 		disable_netrw = true,
	-- 		view = { width = "25%" },
	-- 		update_focused_file = {
	-- 			enable = true,
	-- 			update_root = false,
	-- 			ignore_list = {},
	-- 		},
	-- 		diagnostics = {
	-- 			enable = true, -- включает отображение диагностик в дереве
	-- 			show_on_dirs = true, -- при true будут отмечаться и директории, содержащие проблемные файлы
	-- 			debounce_delay = 50, -- задержка обновления диагностик (мс), можно настроить
	-- 			icons = {
	-- 				hint = "",
	-- 				info = "",
	-- 				warning = "",
	-- 				error = "●",
	-- 			},
	-- 		},
	-- 		renderer = {
	-- 			root_folder_label = function(path)
	-- 				return vim.fn.fnamemodify(path, ":t")
	-- 			end,
	-- 			indent_width = 3,
	-- 			special_files = {},
	-- 			highlight_git = false,
	-- 			-- highlight_diagnostics = true, // подчеркивает файл
	-- 			highlight_opened_files = "none",
	-- 			-- highlight_modified = "none",
	-- 			indent_markers = {
	-- 				enable = false,
	-- 				inline_arrows = true,
	-- 				icons = {
	-- 					corner = "└",
	-- 					edge = "│",
	-- 					item = "│",
	-- 					bottom = "─",
	-- 					none = " ",
	-- 				},
	-- 			},
	-- 			icons = {
	-- 				web_devicons = {
	-- 					file = {
	-- 						enable = true,
	-- 						color = true,
	-- 					},
	-- 					folder = {
	-- 						enable = false,
	-- 						color = true,
	-- 					},
	-- 				},
	-- 				diagnostics_placement = "after",
	-- 				git_placement = "after",
	-- 				modified_placement = "before",
	-- 				padding = " ",
	-- 				symlink_arrow = " 󰁔 ",
	-- 				show = {
	-- 					file = true,
	-- 					folder = true,
	-- 					folder_arrow = true,
	-- 					git = true,
	-- 					modified = true,
	-- 					diagnostics = true,
	-- 					bookmarks = true,
	-- 				},
	-- 				glyphs = {
	-- 					default = "",
	-- 					git = {
	-- 						unstaged = "✹",
	-- 						staged = "A",
	-- 						unmerged = "U",
	-- 						renamed = "R",
	-- 						untracked = "??",
	-- 						deleted = "D",
	-- 						ignored = "!",
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 		git = {
	-- 			enable = true,
	-- 			timeout = 1000,
	-- 		},
	-- 		modified = {
	-- 			enable = true,
	-- 		},
	-- 		filters = {
	-- 			git_ignored = false,
	-- 			dotfiles = false,
	-- 			git_clean = false,
	-- 			no_buffer = false,
	-- 			custom = { "^\\.git$", "node_modules" },
	-- 			exclude = {},
	-- 		},
	-- 	})
	-- end,
}

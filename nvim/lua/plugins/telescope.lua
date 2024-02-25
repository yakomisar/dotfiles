return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		branch = "0.1.x",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{
				"debugloop/telescope-undo.nvim",
				config = function()
					require("telescope").load_extension("undo")
					vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Telescope undo" })
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		config = function()
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					path_display = { "truncate " },
					-- layout_strategy = "vertical",
					layout_strategy = "horizontal",
					-- layout_config = { mirror = true, height = 0.95, width = 0.75 },
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.5,
						},
						width = 0.8,
						height = 0.8,
						preview_cutoff = 120,
					},
					sorting_strategy = "ascending",
					winblend = 0,
					prompt_prefix = "  ",
					selection_caret = " ",
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-c>"] = actions.close, -- close Telescope window
							-- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]uzzy find [f]iles" })
			vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "[F]uzzy [f]ind [g]it files" })
			vim.keymap.set("n", "<leader><leader>", function()
				builtin.buffers({ sort_mru = true, ignore_current_buffer = true })
			end, { desc = "List opened buffers" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep string" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "List help tags" })
			vim.keymap.set("n", "<leader>fx", builtin.treesitter, { desc = "List tresitter funcs, vars" })
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[S]earch [r]ecent [f]iles" })
			vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "List todo by folke" })
		end,
	},
}

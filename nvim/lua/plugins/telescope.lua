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
				-- config = function()
				-- 	require("telescope").load_extension("undo")
				-- 	vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "[T]elescope [U]ndo" })
				-- end,
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
					layout_strategy = "horizontal",
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
					["undo"] = {
						mappings = {
							i = {
								["<lt>C-y<lt>"] = require("telescope-undo.actions").yank_additions,
								["<lt>d<lt>"] = require("telescope-undo.actions").yank_deletions,
								["<lt>cr<lt>"] = require("telescope-undo.actions").restore,
							},
						},
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							layout_config = {
								width = 0.6,
								height = 0.4,
							},
							winblend = 0,
						}),
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
			telescope.load_extension("undo")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]ile" })
			vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "[F]ind [G]it files" })
			vim.keymap.set("n", "<leader><leader>", function()
				builtin.buffers({ sort_mru = true, ignore_current_buffer = true })
			end, { desc = "[ ] Find existing buffers" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[L]ive [G]rep" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[H]elp [T]ags" })
			vim.keymap.set("n", "<leader>fx", builtin.treesitter, { desc = "[L]ist [R]resitter funcs, vars" })
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[R]ecent [F]iles" })
			vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "[L]ist [T]odo" })
			vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "[T]elescope [U]ndo" })

			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					-- winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- Also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>f/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			-- Shortcut for searching your neovim configuration files
			vim.keymap.set("n", "<leader>fn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
}

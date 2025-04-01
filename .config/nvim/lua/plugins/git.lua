return {
	-- ============ NEOGIT & DIFFVIEW ============
	{
		"NeogitOrg/neogit",
		dependencies = {
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- -- Only one of these is needed.
			-- "nvim-telescope/telescope.nvim", -- optional
			-- "ibhagwan/fzf-lua",      -- optional
			-- "echasnovski/mini.pick", -- optional
		},
		keys = {
			-- Neogit
			{ "<leader>gg", "<cmd>Neogit<CR>", desc = "Open Neogit" },
			{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
			{ "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
			-- Optional additional mappings:
			{ "<leader>gf", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle Diffview File Panel" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Open Diffview File History" },
		},
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "▌" },
				change = { text = "▌" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = " " },
			},
			current_line_blame = false,
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local _map = vim.keymap.set

				_map("n", "]g", function()
					if vim.wo.diff then
						return "]g"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { buffer = bufnr, expr = true, desc = "󰊢 Next Hunk" })
				_map("n", "[g", function()
					if vim.wo.diff then
						return "[g"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { buffer = bufnr, expr = true, desc = "󰊢 Previous Hunk" })

				-- _map("n", "<leader>gr", gs.reset_hunk, { buffer = bufnr, desc = "[R]eset [H]unk" })
				-- _map("n", "<leader>gR", gs.reset_buffer, { buffer = bufnr, desc = "[R]eset [b]uffer" })
				_map("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr, desc = "[P]review [H]unk" })
				-- _map("n", "<leader>gd", gs.diffthis, { buffer = bufnr, desc = "[D]iff This" })
				_map("n", "<leader>gt", gs.toggle_current_line_blame, { buffer = bufnr, desc = "[T]oggle line blame" })
			end,
		},
	},
}

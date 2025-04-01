return {
	-- Autoformat on save
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			-- c = { "clang-format" },

			-- Conform can also run multiple formatters sequentially
			go = { "goimports", "gofumpt", "goimports-reviser" },
			-- You can use a sub-list to tell conform to run *until* a formatter
			-- is found.
			-- javascript = { { "prettierd", "prettier" } },
			json = { "prettierd" },
			proto = { "buf" },
		},
	},
}

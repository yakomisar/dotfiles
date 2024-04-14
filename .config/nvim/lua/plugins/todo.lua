return {
	"folke/todo-comments.nvim",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		signs = false,
		keywords = {
			FIX = {
				color = "error", -- can be a hex color, or a named color (see below)
				signs = false,
			},
			TODO = { color = "info", signs = false },
			WARN = { color = "warning", signs = false, alt = { "WARNING", "XXX" } },
			NOTE = { color = "hint", signs = false, alt = { "INFO" } },
			TEST = { color = "test", signs = false, alt = { "TESTING", "PASSED", "FAILED" } },
		},
		colors = {
			error = { "#DC2626" },
			warning = { "#FBBF24" },
			info = { "#2563EB" },
			hint = { "#10B981" },
			default = { "#7C3AED" },
			test = { "#FF00FF" },
		},
	},
}

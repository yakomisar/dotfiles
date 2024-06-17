return {
	"mfussenegger/nvim-dap",
	keys = "<leader>b",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		require("dapui").setup()
		require("dap-go").setup()
		require("nvim-dap-virtual-text").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Set Breakpoint " })
		vim.keymap.set("n", "<leader>?", function()
			require("dapui").eval(nil, { enter = true })
		end)
		vim.keymap.set("n", "<leader>>", dap.continue, { desc = "Dap Continue" })
	end,
}

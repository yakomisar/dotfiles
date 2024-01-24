return {
	"nvimtools/none-ls.nvim",
	keys = "<leader>g",
	config = function()
		local null_ls = require("null-ls")
		-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local format = null_ls.builtins.formatting

		null_ls.setup({
			sources = {
				format.stylua,
				-- format.gofumpt,
				-- format.goimports_reviser.with({
				-- 	extra_args = { "-rm-unused" },
				-- }),
				-- null_ls.builtins.diagnostics.eslint,

				format.prettierd.with({
					filetypes = {
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"css",
						"html",
						"json",
						"yaml",
						"markdown",
						"graphql",
						"proto",
						"yml",
					},
				}),
				-- null_ls.builtins.completion.spell,
			},
			-- on_attach = function(client, bufnr)
			-- 	if client.supports_method("textDocument/formatting") then
			-- 		vim.api.nvim_clear_autocmds({
			-- 			group = augroup,
			-- 			buffer = bufnr,
			-- 		})
			-- 		vim.api.nvim_create_autocmd("BufWritePre", {
			-- 			group = augroup,
			-- 			buffer = bufnr,
			-- 			callback = function()
			-- 				vim.lsp.buf.format({ bufnr = bufnr })
			-- 			end,
			-- 		})
			-- 	end
			-- end,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format code" })
	end,
}

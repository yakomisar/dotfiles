-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
	-- add any options here, or leave empty to use the default settings
})

local on_attach = function(_, bufnr)
	local bufmap = function(keys, func)
		vim.keymap.set("n", keys, func, { buffer = bufnr })
	end

	bufmap("<leader>r", vim.lsp.buf.rename)
	bufmap("<leader>a", vim.lsp.buf.code_action)

	bufmap("gd", vim.lsp.buf.definition)
	bufmap("K", vim.lsp.buf.hover)
	bufmap("gD", vim.lsp.buf.declaration)
	bufmap("gI", vim.lsp.buf.implementation)
	bufmap("<leader>D", vim.lsp.buf.type_definition)

	bufmap("gr", require("telescope.builtin").lsp_references)
	bufmap("<leader>s", require("telescope.builtin").lsp_document_symbols)
	bufmap("<leader>S", require("telescope.builtin").lsp_dynamic_workspace_symbols)

	--   vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	--   vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	--   vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	--   vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	--   vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	--   vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	--   vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		-- Replace these with whatever servers you want to install
		"tsserver",
		"gopls",
		"lua_ls",
	},
})

local util = require("lspconfig/util")
require("mason-lspconfig").setup_handlers({

	function(server_name)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,

	["lua_ls"] = function()
		require("neodev").setup()
		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			single_file_support = true,
			flags = {
				debounce_text_changes = 150,
			},
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
			},
		})
	end,

	["gopls"] = function()
		require("neodev").setup()
		require("lspconfig").gopls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		})
	end,

	-- another example
	-- ["omnisharp"] = function()
	--     require('lspconfig').omnisharp.setup {
	--         filetypes = { "cs", "vb" },
	--         root_dir = require('lspconfig').util.root_pattern("*.csproj", "*.sln"),
	--         on_attach = on_attach,
	--         capabilities = capabilities,
	--         enable_roslyn_analyzers = true,
	--         analyze_open_documents_only = true,
	--         enable_import_completion = true,
	--     }
	-- end,
})

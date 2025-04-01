return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gosum", "gowork", "gotmpl" },
	root_markers = {
		"go.mod",
		"go.sum",
	},
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			directoryFilters = { "-.git", "-node_modules" },
			analyses = {
				unusedparams = true,
				unusedvariable = true,
				unusedwrite = true,
				nilness = true,
				useany = true,
			},
			codelenses = {
				generate = true,
				run_govulncheck = true,
				tidy = true,
				upgrade_dependency = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			staticcheck = true,
			gofumpt = true,
			semanticTokens = true,
		},
	},
}

return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			background = {
				light = "latte",
				dark = "mocha",
			},
			color_overrides = {
				mocha = {
					rosewater = "#FB4834",
					flamingo = "#FB4834",
					red = "#FB4834",
					maroon = "#FB4834",
					pink = "#d3859b",
					mauve = "#d3859b",
					peach = "#e78a4e",
					yellow = "#FBBD2E",
					green = "#8dc07c",
					teal = "#B9BB25",
					sky = "#99c792",
					sapphire = "#99c792",
					blue = "#8dbba3",
					lavender = "#8dbba3",
					text = "#f1e4c2",
					subtext2 = "#c5b4a1",
					subtext1 = "#d5c4a1",
					subtext0 = "#bdae93",
					overlay2 = "#a89984",
					overlay1 = "#928374",
					overlay0 = "#595959",
					surface2 = "#4d4d4d",
					surface1 = "#404040",
					surface0 = "#292929",
					base = "#1d2224",
					mantle = "#1d2224",
					crust = "#1f2223",
				},
				frappe = {
					rosewater = "#eb7a73",
					flamingo = "#eb7a73",
					red = "#eb7a73",
					maroon = "#eb7a73",
					pink = "#e396a4",
					mauve = "#e396a4",
					peach = "#e89a5e",
					yellow = "#E7B84C",
					green = "#7cb66a",
					teal = "#99c792",
					sky = "#99c792",
					sapphire = "#99c792",
					blue = "#8dbba3",
					lavender = "#8dbba3",
					text = "#f1e4c2",
					subtext1 = "#e5d5b1",
					subtext0 = "#c5bda3",
					overlay2 = "#b8a994",
					overlay1 = "#a39284",
					overlay0 = "#656565",
					surface2 = "#5d5d5d",
					surface1 = "#505050",
					surface0 = "#393939",
					base = "#1d2224",
					mantle = "#1d2224",
					crust = "#1f2223",
				},
			},
			transparent_background = true,
			show_end_of_buffer = false,
			integration_default = false,
			integrations = {
				barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
				cmp = true,
				gitsigns = true,
				hop = true,
				illuminate = { enabled = true },
				native_lsp = { enabled = true, inlay_hints = { background = true } },
				neogit = true,
				neotree = true,
				semantic_tokens = true,
				treesitter = true,
				treesitter_context = true,
				vimwiki = true,
				which_key = true,
			},
			highlight_overrides = {
				all = function(colors)
					return {
						CmpItemMenu = { fg = colors.surface2 },
						CursorLineNr = { fg = colors.text },
						CursorLine = { bg = colors.overlay0 },
						FloatBorder = { bg = colors.base, fg = colors.subtext1 }, -- colors.surface0 }, difficult to see
						GitSignsChange = { fg = colors.peach },
						LineNr = { fg = colors.overlay0 },
						LspInfoBorder = { link = "FloatBorder" },
						NeoTreeDirectoryIcon = { fg = colors.subtext1 },
						NeoTreeDirectoryName = { fg = colors.subtext1 },
						NeoTreeFloatBorder = { bg = colors.mantle, fg = colors.mantle },
						NeoTreeGitConflict = { fg = colors.red },
						NeoTreeGitDeleted = { fg = colors.red },
						NeoTreeGitIgnored = { fg = colors.overlay0 },
						NeoTreeGitModified = { fg = colors.peach },
						NeoTreeGitStaged = { fg = colors.green },
						NeoTreeGitUnstaged = { fg = colors.red },
						NeoTreeGitUntracked = { fg = colors.green },
						NeoTreeIndent = { fg = colors.surface1 },
						-- NeoTreeNormal = { bg = colors.mantle },
						-- NeoTreeNormalNC = { bg = colors.mantle },
						NeoTreeNormal = { guibg = NONE, ctermbg = NONE },
						NeoTreeNormalNC = { guibg = NONE, ctermbg = NONE },
						NeoTreeRootName = { fg = colors.subtext1, style = { "bold" } },
						NeoTreeTabActive = { fg = colors.text, bg = colors.mantle },
						NeoTreeTabInactive = { fg = colors.surface2, bg = colors.crust },
						NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
						NeoTreeTabSeparatorInactive = { fg = colors.crust, bg = colors.crust },
						NeoTreeWinSeparator = { fg = colors.surface1 },
						NormalFloat = { bg = colors.base },
						Pmenu = { bg = colors.mantle, fg = "" },
						-- telescope prompt
						TelescopePromptTitle = { fg = colors.mantle, bg = "#39fd9c", style = { "bold" } },
						TelescopePromptCounter = { fg = colors.red, style = { "bold" } },
						TelescopePromptBorder = { bg = colors.base },
						-- telescope results
						TelescopeResultsTitle = { link = "TelescopePromptTitle" },
						TelescopeResultsBorder = { link = "TelescopePromptBorder" },
						-- telescope preview
						TelescopePreviewTitle = { link = "TelescopePromptTitle" },
						TelescopePreviewBorder = { link = "TelescopePromptBorder" },
						VertSplit = { bg = colors.base, fg = colors.surface0 },
						WhichKeyFloat = { bg = colors.mantle },
						YankHighlight = { bg = colors.surface2 },
						FidgetTask = { fg = colors.subtext2 },
						FidgetTitle = { fg = colors.peach },

						IblIndent = { fg = colors.surface0 },
						IblScope = { fg = colors.overlay0 },

						Boolean = { fg = colors.mauve },
						Number = { fg = colors.mauve },
						Float = { fg = colors.mauve },

						PreProc = { fg = colors.mauve },
						PreCondit = { fg = colors.mauve },
						Include = { fg = colors.mauve },
						Define = { fg = colors.mauve },
						Conditional = { fg = colors.red },
						Repeat = { fg = colors.red },
						Keyword = { fg = colors.red },
						Typedef = { fg = colors.red },
						Exception = { fg = colors.red },
						Statement = { fg = colors.red },

						Error = { fg = colors.red },
						StorageClass = { fg = colors.peach },
						Tag = { fg = colors.peach },
						Label = { fg = colors.peach },
						Structure = { fg = colors.peach },
						Operator = { fg = colors.sapphire },
						Title = { fg = colors.peach },
						Special = { fg = colors.yellow },
						SpecialChar = { fg = colors.yellow },
						Type = { fg = colors.yellow, style = { "bold" } },
						Function = { fg = colors.green, style = { "bold" } },
						Delimiter = { fg = colors.subtext2 },
						Ignore = { fg = colors.subtext2 },
						Macro = { fg = colors.teal },

						TSAnnotation = { fg = colors.mauve },
						TSAttribute = { fg = colors.mauve },
						TSBoolean = { fg = colors.mauve },
						TSCharacter = { fg = colors.teal },
						TSCharacterSpecial = { link = "SpecialChar" },
						TSComment = { link = "Comment" },
						TSConditional = { fg = colors.red },
						TSConstBuiltin = { fg = colors.mauve },
						TSConstMacro = { fg = colors.mauve },
						TSConstant = { fg = colors.text },
						TSConstructor = { fg = colors.green },
						TSDebug = { link = "Debug" },
						TSDefine = { link = "Define" },
						TSEnvironment = { link = "Macro" },
						TSEnvironmentName = { link = "Type" },
						TSError = { link = "Error" },
						TSException = { fg = colors.red },
						TSField = { fg = colors.blue },
						TSFloat = { fg = colors.mauve },
						TSFuncBuiltin = { fg = colors.green },
						TSFuncMacro = { fg = colors.green },
						TSFunction = { fg = colors.green },
						TSFunctionCall = { fg = colors.green },
						TSInclude = { fg = colors.red },
						TSKeyword = { fg = colors.red },
						TSKeywordFunction = { fg = colors.red },
						TSKeywordOperator = { fg = colors.sapphire },
						TSKeywordReturn = { fg = colors.red },
						TSLabel = { fg = colors.peach },
						TSLiteral = { link = "String" },
						TSMath = { fg = colors.blue },
						TSMethod = { fg = colors.green },
						TSMethodCall = { fg = colors.green },
						TSNamespace = { fg = colors.yellow },
						TSNone = { fg = colors.text },
						TSNumber = { fg = colors.mauve },
						-- TSOperator = { fg = colors.sapphire },
						TSOperator = { fg = colors.peach },
						TSParameter = { fg = colors.text },
						TSParameterReference = { fg = colors.text },
						TSPreProc = { link = "PreProc" },
						TSProperty = { fg = colors.blue },
						TSPunctBracket = { fg = colors.text },
						TSPunctDelimiter = { link = "Delimiter" },
						TSPunctSpecial = { fg = colors.blue },
						TSRepeat = { fg = colors.red },
						TSStorageClass = { fg = colors.peach },
						TSStorageClassLifetime = { fg = colors.peach },
						TSStrike = { fg = colors.subtext2 },
						TSString = { fg = colors.teal },
						TSStringEscape = { fg = colors.green },
						TSStringRegex = { fg = colors.green },
						TSStringSpecial = { link = "SpecialChar" },
						TSSymbol = { fg = colors.text },
						TSTag = { fg = colors.peach },
						TSTagAttribute = { fg = colors.green },
						TSTagDelimiter = { fg = colors.green },
						TSText = { fg = colors.green },
						TSTextReference = { link = "Constant" },
						TSTitle = { link = "Title" },
						TSTodo = { link = "Todo" },
						TSType = { fg = colors.yellow, style = { "bold" } },
						TSTypeBuiltin = { fg = colors.yellow, style = { "bold" } },
						TSTypeDefinition = { fg = colors.yellow, style = { "bold" } },
						TSTypeQualifier = { fg = colors.peach, style = { "bold" } },
						TSURI = { fg = colors.blue },
						TSVariable = { fg = colors.text },
						TSVariableBuiltin = { fg = colors.mauve },

						["@annotation"] = { link = "TSAnnotation" },
						["@attribute"] = { link = "TSAttribute" },
						["@boolean"] = { link = "TSBoolean" },
						["@character"] = { link = "TSCharacter" },
						["@character.special"] = { link = "TSCharacterSpecial" },
						["@comment"] = { link = "TSComment" },
						["@conceal"] = { link = "Grey" },
						["@conditional"] = { link = "TSConditional" },
						["@constant"] = { link = "TSConstant" },
						["@constant.builtin"] = { link = "TSConstBuiltin" },
						["@constant.macro"] = { link = "TSConstMacro" },
						["@constructor"] = { link = "TSConstructor" },
						["@debug"] = { link = "TSDebug" },
						["@define"] = { link = "TSDefine" },
						["@error"] = { link = "TSError" },
						["@exception"] = { link = "TSException" },
						["@field"] = { link = "TSField" },
						["@float"] = { link = "TSFloat" },
						["@function"] = { link = "TSFunction" },
						["@function.builtin"] = { link = "TSFuncBuiltin" },
						["@function.call"] = { link = "TSFunctionCall" },
						["@function.macro"] = { link = "TSFuncMacro" },
						["@include"] = { link = "TSInclude" },
						["@keyword"] = { link = "TSKeyword" },
						["@keyword.function"] = { link = "TSKeywordFunction" },
						["@keyword.operator"] = { link = "TSKeywordOperator" },
						["@keyword.return"] = { link = "TSKeywordReturn" },
						["@label"] = { link = "TSLabel" },
						["@math"] = { link = "TSMath" },
						["@method"] = { link = "TSMethod" },
						["@method.call"] = { link = "TSMethodCall" },
						["@namespace"] = { link = "TSNamespace" },
						["@none"] = { link = "TSNone" },
						["@number"] = { link = "TSNumber" },
						["@operator"] = { link = "TSOperator" },
						["@parameter"] = { link = "TSParameter" },
						["@parameter.reference"] = { link = "TSParameterReference" },
						["@preproc"] = { link = "TSPreProc" },
						["@property"] = { link = "TSProperty" },
						["@punctuation.bracket"] = { link = "TSPunctBracket" },
						["@punctuation.delimiter"] = { link = "TSPunctDelimiter" },
						["@punctuation.special"] = { link = "TSPunctSpecial" },
						["@repeat"] = { link = "TSRepeat" },
						["@storageclass"] = { link = "TSStorageClass" },
						["@storageclass.lifetime"] = { link = "TSStorageClassLifetime" },
						["@strike"] = { link = "TSStrike" },
						["@string"] = { link = "TSString" },
						["@string.escape"] = { link = "TSStringEscape" },
						["@string.regex"] = { link = "TSStringRegex" },
						["@string.special"] = { link = "TSStringSpecial" },
						["@symbol"] = { link = "TSSymbol" },
						["@tag"] = { link = "TSTag" },
						["@tag.attribute"] = { link = "TSTagAttribute" },
						["@tag.delimiter"] = { link = "TSTagDelimiter" },
						["@text"] = { link = "TSText" },
						["@text.danger"] = { link = "TSDanger" },
						["@text.diff.add"] = { link = "diffAdded" },
						["@text.diff.delete"] = { link = "diffRemoved" },
						["@text.emphasis"] = { link = "TSEmphasis" },
						["@text.environment"] = { link = "TSEnvironment" },
						["@text.environment.name"] = { link = "TSEnvironmentName" },
						["@text.literal"] = { link = "TSLiteral" },
						["@text.math"] = { link = "TSMath" },
						["@text.note"] = { link = "TSNote" },
						["@text.reference"] = { link = "TSTextReference" },
						["@text.strike"] = { link = "TSStrike" },
						["@text.strong"] = { link = "TSStrong" },
						["@text.title"] = { link = "TSTitle" },
						["@text.todo"] = { link = "TSTodo" },
						["@text.todo.checked"] = { link = "Green" },
						["@text.todo.unchecked"] = { link = "Ignore" },
						["@text.underline"] = { link = "TSUnderline" },
						["@text.uri"] = { link = "TSURI" },
						["@text.warning"] = { link = "TSWarning" },
						["@todo"] = { link = "TSTodo" },
						["@type"] = { link = "TSType" },
						["@type.builtin"] = { link = "TSTypeBuiltin" },
						["@type.definition"] = { link = "TSTypeDefinition" },
						["@type.qualifier"] = { link = "TSTypeQualifier" },
						["@uri"] = { link = "TSURI" },
						["@variable"] = { link = "TSVariable" },
						["@variable.builtin"] = { link = "TSVariableBuiltin" },

						["@lsp.type.class"] = { link = "TSType" },
						["@lsp.type.comment"] = { link = "TSComment" },
						["@lsp.type.decorator"] = { link = "TSFunction" },
						["@lsp.type.enum"] = { link = "TSType" },
						["@lsp.type.enumMember"] = { link = "TSProperty" },
						["@lsp.type.events"] = { link = "TSLabel" },
						["@lsp.type.function"] = { link = "TSFunction" },
						["@lsp.type.interface"] = { link = "TSType" },
						["@lsp.type.keyword"] = { link = "TSKeyword" },
						["@lsp.type.macro"] = { link = "TSConstMacro" },
						["@lsp.type.method"] = { link = "TSMethod" },
						["@lsp.type.modifier"] = { link = "TSTypeQualifier" },
						["@lsp.type.namespace"] = { link = "TSNamespace" },
						["@lsp.type.number"] = { link = "TSNumber" },
						["@lsp.type.operator"] = { link = "TSOperator" },
						["@lsp.type.parameter"] = { link = "TSParameter" },
						["@lsp.type.property"] = { link = "TSProperty" },
						["@lsp.type.regexp"] = { link = "TSStringRegex" },
						["@lsp.type.string"] = { link = "TSString" },
						["@lsp.type.struct"] = { link = "TSType" },
						["@lsp.type.type"] = { link = "TSType" },
						["@lsp.type.typeParameter"] = { link = "TSTypeDefinition" },
						["@lsp.type.variable"] = { link = "TSVariable" },
					}
				end,
				latte = function(colors)
					return {
						IblIndent = { fg = colors.mantle },
						IblScope = { fg = colors.surface1 },

						LineNr = { fg = colors.surface1 },
					}
				end,
			},
		})

		vim.api.nvim_command("colorscheme catppuccin-mocha")
	end,
}

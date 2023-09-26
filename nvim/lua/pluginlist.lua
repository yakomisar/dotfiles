return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "frappe", -- "mocha", -- latte, frappe, macchiato, mocha
				integrations = {
					nvimtree = false,
					neotree = true,
				},
			}) -- load the colorscheme here
			vim.cmd.colorscheme("catppuccin")
			vim.cmd([[highlight WinSeparator guibg=None guifg=#303446]])
			-- Set custom highlights
			vim.cmd([[ hi BufferLineBufferSelected guifg=#ff6b1d gui=bold,italic ]])
		end,
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		-- config = "require('treesitter')",
		build = ":TSUpdate",
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		event = "BufReadPost",
		config = function()
			require("treesitter-config")
		end,
		dependencies = {
			{
				"windwp/nvim-ts-autotag",
				event = "InsertEnter",
				ft = { "html", "xml", "javascript", "typescript" },
			},
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	-- Autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("autopairs-config")
		end,
	},
	-- Surrounds
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	-- Colorizer
	{
		"NvChad/nvim-colorizer.lua",
		cmd = { "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer", "ColorizerReloadAllBuffers", "ColorizerToggle" },
		ft = { "css", "sass", "html", "javascript", "javascriptreact", "typescriptreact" },
		opts = {
			user_default_options = { names = false, RRGGBBAA = true, AARRGGBB = true, virtualtext = "▎" },
			filetypes = {
				css = { css_fn = true },
				sass = { sass = { enable = true } },
				html = { css_fn = true, tailwind = "lsp" },
				javascript = { css_fn = true, tailwind = "lsp" },
				javascriptreact = { css_fn = true, tailwind = "lsp" },
				typescriptreact = { css_fn = true, tailwind = "lsp" },
			},
		},
		config = function(_, opts)
			require("colorizer").setup(opts)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		ft = {
			"go",
			"gomod",
			"gosum",
			"gowork",
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
			"lua",
		},
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("lsp-config")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- snippets
			"L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- for autocompletion
			"rafamadriz/friendly-snippets", -- useful snippets
			-- autocompletion
			"hrsh7th/cmp-nvim-lsp", -- completion plugin
			"onsails/lspkind-nvim", -- sexy icons
			-- path
			"hrsh7th/cmp-path",
			-- buffer
			"hrsh7th/cmp-buffer",
		},
		config = function()
			require("cmp-config")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		ft = {
			"go",
			"gomod",
			"gosum",
			"gowork",
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
			"lua",
		},
		opts = function()
			return require("null-ls-config")
		end,
	},
	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		-- event = "BufWinEnter",
		event = "VeryLazy",
		version = "*",
		config = function()
			require("bufferline-config")
		end,
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	-- commenting plugin ('gc'/'gcc' to comment)
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			---Add a space b/w comment and the line
			padding = true,
			---Whether the cursor should stay at its position
			sticky = true,
			---Lines to be ignored while (un)comment
			ignore = nil,
			---LHS of toggle mappings in NORMAL mode
			toggler = {
				---Line-comment toggle keymap
				line = "gcc",
				---Block-comment toggle keymap
				block = "gbc",
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = "gc",
				---Block-comment keymap
				block = "gb",
			},
			---LHS of extra mappings
			extra = {
				---Add comment on the line above
				above = "gcO",
				---Add comment on the line below
				below = "gco",
				---Add comment at the end of line
				eol = "gcA",
			},
			---Enable keybindings
			---NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				basic = true,
				---Extra mapping; `gco`, `gcO`, `gcA`
				extra = true,
			},
			---Function to call before (un)comment
			pre_hook = nil,
			---Function to call after (un)comment
			post_hook = nil,
		},
	},
	-- Telescope plugin
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		opts = function(_, opts)
			opts.defaults = {
				layout_strategy = "horizontal",
				prompt_prefix = "  ",
				selection_caret = " ",
				mappings = {
					i = {
						["<C-c>"] = require("telescope.actions").close, -- close Telescope window
						["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
						["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
					},
					n = {
						["<leader>fx"] = function()
							require("telescope.actions").send_selected_to_qflist()
							require("telescope.actions").open_qflist()
						end,
					},
				},
			}
			opts.pickers = {
				colorscheme = { enable_preview = true },
			}
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		cmd = "Telescope",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	-- Lualine plugin for good looking line at the bottom
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		-- event = "BufWinEnter",
		config = function()
			require("lualine-config")
		end,
	},
	-- lightweight file manager
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		keys = false,
		config = function()
			require("neotree-config")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
	--debugging
	{
		"mfussenegger/nvim-dap",
		keys = "<leader>b",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"leoluz/nvim-dap-go",
		},
		config = function()
			require("dap-config")
		end,
	},
}

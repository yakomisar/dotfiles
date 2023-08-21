return {
  -- the colorscheme should be available when starting Neovim
  -- { "bluz71/vim-nightfly-guicolors",
  --   lazy = false,-- make sure we load this during startup if it is your main colorscheme 
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme nightfly]])
  --   end,
  -- },
  -- {
  --   "Mofiqul/vscode.nvim",
  --     lazy = false,-- make sure we load this during startup if it is your main colorscheme 
  --     priority = 1000, -- make sure to load this before all the other start plugins
  --     config = function()
  --       -- load the colorscheme here
  --       vim.cmd([[colorscheme vscode]])
  --     end,
  -- },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    -- config = "require('treesitter')",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
			require("treesitter-config")
		end,
    dependencies = {
      "windwp/nvim-ts-autotag",
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
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
			require("lsp-config")
		end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = {"InsertEnter"},
    dependencies = {
      -- snippets
      "L3MON4D3/LuaSnip", -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- for autocompletion
      "rafamadriz/friendly-snippets", -- useful snippets
      -- autocompletion
      "hrsh7th/cmp-nvim-lsp", -- completion plugin
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
  -- {
  --   'VonHeikemen/lsp-zero.nvim',
  --   branch = 'v2.x',
  --   config = function()
  --     require("lsp-config")
  --   end,
  --   dependencies = {
  --     -- LSP Support
  --     {'neovim/nvim-lspconfig'},             -- Required
  --     {'williamboman/mason.nvim'},           -- Optional
  --     {'williamboman/mason-lspconfig.nvim'}, -- Optional
  --
  --     -- Autocompletion
  --     {'hrsh7th/nvim-cmp'},     -- Required
  --     {'hrsh7th/cmp-nvim-lsp'}, -- Required
  --     {'L3MON4D3/LuaSnip'},     -- Required
  --   }
  -- },
  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    -- event = "BufWinEnter",
    event = 'VeryLazy',
    version = "*",
    config = function()
      require("bufferline-config")
		end,
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --
  --   opts = function(_, opts)
  --       opts.autopairs = { enable = true }
  --       opts.autotag = { enable = true, disable = { "xml" } }
  --       opts.context_commenting = { enable = true, enable_autocmd = false }
  --       opts.highlight = {
  --         enable = true,
  --         disabled = {
  --           "css", "latex", "markdown",
  --         },
  --         additional_vim_regex_highlighting = true,
  --       }
  --       opts.indent = { enable = true, disable = { "yml", "yaml" } }
  --       opts.rainbow = {
  --         enable = true,
  --         extended_mode = true,
  --         max_file_lines = 1500,
  --         colors = {
  --           "Gold", "Orchid", "DodgerBlue", "Cornsilk", "Salmon", "LawnGreen",
  --         },
  --       }
  --       opts.disable = { "latex" }
  --       opts.ensure_installed = {
  --         "bash", "go", "lua", "c", "c_sharp", "cpp", "dockerfile", "html", "javascript",
  --         "json", "lua", "markdown", "markdown_inline", "python", "query",
  --         "regex", "ruby", "rust", "sql", "toml", "tsx", "typescript", "vim",
  --         "vimdoc", "yaml",
  --       }
  --   end,
  --
  --   dependencies = {
  --     "mrjones2014/nvim-ts-rainbow",
  --   },
  -- },
  -- commenting plugin ('gc'/'gcc' to comment)
  {
    'numToStr/Comment.nvim',
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
          line = 'gcc',
          ---Block-comment toggle keymap
          block = 'gbc',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
          ---Line-comment keymap
          line = 'gc',
          ---Block-comment keymap
          block = 'gb',
      },
      ---LHS of extra mappings
      extra = {
          ---Add comment on the line above
          above = 'gcO',
          ---Add comment on the line below
          below = 'gco',
          ---Add comment at the end of line
          eol = 'gcA',
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
            ["<C-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist, -- send selected to quickfixlist
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
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      config = function()
        require("telescope").load_extension("fzf")
      end,
  },
  -- Lualine plugin for good looking line at the bottom
  {
    "nvim-lualine/lualine.nvim",
    event = 'VeryLazy',
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
}

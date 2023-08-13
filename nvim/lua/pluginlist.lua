return {
  -- the colorscheme should be available when starting Neovim
  {
    "bluz71/vim-nightfly-guicolors",
    lazy = false,-- make sure we load this during startup if it is your main colorscheme 
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nightfly]])
    end,
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufWinEnter",
    config = "require('treesitter')",
    build = ":TSUpdate",
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
          prompt_prefix = " ",
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
      -- import lualine plugin safely
      local status, lualine = pcall(require, "lualine")
      if not status then
        return
      end

      -- get lualine nightfly theme
      local lualine_nightfly = require("lualine.themes.nightfly")

      -- new colors for theme
      local new_colors = {
        blue = "#65D1FF",
        green = "#3EFFDC",
        violet = "#FF61EF",
        yellow = "#FFDA7B",
        black = "#000000",
      }

      -- change nightlfy theme colors
      lualine_nightfly.normal.a.bg = new_colors.blue
      lualine_nightfly.insert.a.bg = new_colors.green
      lualine_nightfly.visual.a.bg = new_colors.violet
      lualine_nightfly.command = {
        a = {
          gui = "bold",
          bg = new_colors.yellow,
          fg = new_colors.black,
        },
      }

      -- configure lualine with modified theme
      lualine.setup({
        options = {
          theme = lualine_nightfly,
          icons_enabled = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            winbar = {},
            statusline = { "alpha", "dashboard" },
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      })
    end,
  },
  -- LSP-zero installation
  -- {
  --   'VonHeikemen/lsp-zero.nvim',
  --   branch = 'v2.x',
  --   event = {"InsertEnter"},
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

  -- lightweight file manager
  {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      cmd = "Neotree",
      deactivate = function()
        vim.cmd([[Neotree close]])
      end,
      keys = false,
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
  },
}

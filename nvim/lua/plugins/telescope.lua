return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      {
        "debugloop/telescope-undo.nvim",
        config = function()
          require("telescope").load_extension("undo")
          vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Telescope undo" })
        end,
      },
    },
    config = function()
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          path_display = { "truncate " },
          -- layout_strategy = "vertical",
          layout_strategy = "horizontal",
          -- layout_config = { mirror = true, height = 0.95, width = 0.75 },
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.5,
            },
            width = 0.8,
            height = 0.8,
            preview_cutoff = 120,
          },
          sorting_strategy = "ascending",
          winblend = 0,
          prompt_prefix = "  ",
          selection_caret = " ",
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-c>"] = actions.close, -- close Telescope window
              -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
      })

      telescope.load_extension("fzf")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files" })
      vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Fuzzy find git files" })
      vim.keymap.set("n", "<leader>fb", function()
        builtin.buffers({ sort_mru = true, ignore_current_buffer = true })
      end, { desc = "List opened buffers" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep string" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "List help tags" })
      vim.keymap.set("n", "<leader>fx", builtin.treesitter, { desc = "List tresitter funcs, vars" })
      vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "List todo by folke" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}

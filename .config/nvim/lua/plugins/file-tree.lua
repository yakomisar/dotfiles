return {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "-",         ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
        { "<leader>e", ":Neotree toggle left<CR>",  silent = true, desc = "File Explorer" },
        { "<C-n>",     ":Neotree close<CR>",        silent = true, desc = "Close File Explorer" },
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            buffers = {
                follow_current_file = { enabled = true },
            },
            filesystem = {
                follow_current_file = { enabled = true },
                bind_to_cwd = false,
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        "node_modules",
                    },
                    never_show = {
                        ".DS_Store",
                        "thumbs.db",
                    },
                },
            },
        })
        vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#181818" })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { fg = "none", bg = "#181818" })
        vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#1f1f1f", bg = "#1f1f1f" })
    end,
}

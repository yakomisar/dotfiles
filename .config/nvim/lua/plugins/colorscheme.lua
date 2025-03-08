return {
    {
        "gmr458/vscode_modern_theme.nvim",
        lazy = false,
        -- event = "VeryLazy",
        priority = 1000,
        config = function()
            require("vscode_modern").setup({
                cursorline = true,
                transparent_background = false,
                nvim_tree_darker = true,
            })
            vim.cmd.colorscheme("vscode_modern")

            vim.cmd([[highlight NeoTreeNormalNC guifg = #181818 ]])

            -- NeoTree Directory and Git Status
            vim.cmd([[highlight NeoTreeDirectoryIcon guifg = #729db3 ]])
            vim.cmd([[highlight NeoTreeDirectoryName guifg = #729db3 ]])
            vim.cmd([[highlight NeoTreeTitleBar guifg=#1f1f1f guibg=#75beff ]])
            vim.cmd([[highlight NeoTreeGitModified guifg=#dcdcaa ]])

            -- NeoTree Float Title and Git Changes
            vim.cmd([[highlight NeoTreeFloatTitle guifg=#cccccc guibg=#1f1f1f ]])
            vim.cmd([[highlight NeoTreeGitConflict gui=bold,italic guifg=#ff8700 ]])
            vim.cmd([[highlight NeoTreeGitUntracked gui=italic guifg=#ff8700 ]])
            vim.cmd([[highlight NeoTreeFileStats guifg=#646464 ]])

            -- NeoTree Tabs and Separators
            vim.cmd([[highlight NeoTreeTabInactive guifg=#777777 guibg=#141414 ]])
            vim.cmd([[highlight NeoTreeTabSeparatorActive guifg=#0a0a0a ]])
            vim.cmd([[highlight NeoTreeTabSeparatorInactive guifg=#101010 guibg=#141414 ]])
        end,
    },
}

return {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    version = "*",
    config = function()
        require("toggleterm").setup({
            -- direction = "float", -- Можно также использовать "horizontal" или "vertical"
            start_in_insert = true,
            close_on_exit = true,
            shell = vim.o.shell,
            dir = "cwd", -- Использует текущую директорию при открытии терминала
        })
    end,
}

return {
    "mfussenegger/nvim-dap",
    keys = "<leader>b",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "leoluz/nvim-dap-go",
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")

        dapui.setup({
            layouts = {
                {
                    elements = {
                        -- Elements can be strings or table with id and size keys.
                        { id = "console", size = 0.25 }, -- поменял местами консоль и scopes
                        "breakpoints",
                        "stacks",
                        "watches",
                    },
                    size = 40, -- Width of this panel (in columns) when position = "left"/"right"
                    position = "left",
                },
                {
                    elements = {
                        "repl",
                        "scopes",
                    },
                    size = 0.25, -- Height of this panel as a fraction of total lines when position = "bottom"/"top"
                    position = "bottom",
                },
            },
            -- You can add other dap-ui settings here if needed
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸', -- Pause button
                    play = '▶', -- Play button
                    step_into = '⏎', -- Step into
                    step_over = '⏭', -- Step over
                    step_out = '⏮', -- Step out
                    step_back = 'b', -- Step back
                    run_last = '▶▶', -- Repeat/Run last
                    terminate = '⏹', -- Stop button
                    disconnect = '⏏', -- Close/X
                },
            },
        })


        -- require("dapui").setup()
        require("dap-go").setup()
        require("nvim-dap-virtual-text").setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Set Breakpoint " })
        vim.keymap.set("n", "<leader>?", function()
            require("dapui").eval(nil, { enter = true })
        end)
        vim.keymap.set("n", "<leader>>", dap.continue, { desc = "Dap Continue" })
    end,
}

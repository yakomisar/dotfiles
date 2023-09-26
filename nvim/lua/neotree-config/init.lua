require("neo-tree").setup({
    close_if_last_window = true,
    event_handlers = {

        {
            event = "file_opened",
            handler = function()
                -- auto close
                -- vimc.cmd("Neotree close")
                -- OR
                require("neo-tree.command").execute({ action = "close" })
            end,
        },
    },
    window = {
        width = 30,
    },
    buffers = {
        follow_current_file = { enabled = true },
    },
    filesystem = {
        follow_current_file = { enabled = true },
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
    -- filesystem = {
    -- 	bind_to_cwd = false,
    -- 	use_libuv_file_watcher = true,
    -- },
    -- window = {
    -- 	position = "left",
    -- 	width = 30,
    -- },
})

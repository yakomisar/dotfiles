-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local custom_theme = require("lualine.themes.catppuccin")
-- -- local custom_theme = require("vscode")
--
-- new colors for theme
local new_colors = {
    blue = "#65D1FF",
    green = "#3EFFDC",
    violet = "#FF61EF",
    yellow = "#FFDA7B",
    black = "#000000",
}
-- -- new colors for background
-- local bgColor = "#295259" -- example color
--
-- custom_theme.normal.b.bg = bgColor
-- custom_theme.normal.c.bg = "#2d5b69"
-- -- custom_theme.normal.y.bg = bgColor
-- -- custom_theme.normal.z.bg = bgColor
--
-- change colors
custom_theme.normal.a.bg = new_colors.blue
custom_theme.insert.a.bg = new_colors.green
custom_theme.visual.a.bg = new_colors.violet
custom_theme.command = {
    a = {
        gui = "bold",
        bg = new_colors.yellow,
        fg = new_colors.black,
    },
}

-- -- configure lualine with modified theme
-- lualine.setup({
--   options = {
--     theme = everforest,
--     icons_enabled = true,
--     -- component_separators = { left = "", right = "" },
--     component_separators = { left = "", right = "" },
--     section_separators = { left = "", right = "" },
--     disabled_filetypes = {
--       winbar = {},
--       statusline = { "alpha", "dashboard" },
--     },
--     ignore_focus = {},
--     always_divide_middle = true,
--     globalstatus = false,
--     refresh = {
--       statusline = 1000,
--       tabline = 1000,
--       winbar = 1000,
--     },
--   },
--   sections = {
--     lualine_a = { "mode" },
--     lualine_b = { "branch", "diff", "diagnostics" },
--     lualine_c = { "filename" },
--     lualine_x = { "encoding", "fileformat", "filetype" },
--     lualine_y = { "progress" },
--     lualine_z = { "location" },
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = { "filename" },
--     lualine_x = { "location" },
--     lualine_y = {},
--     lualine_z = {},
--   },
--   tabline = {},
--   winbar = {},
--   inactive_winbar = {},
--   extensions = {},
-- })
require("lualine").setup({
    options = {
        theme = custom_theme,
        -- theme = auto,
        icons_enabled = true,
        disabled_filetypes = { "neo-tree" },
        -- component_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = { "mode" },
        -- lualine_a = { "buffers" },
        lualine_b = { "branch", "diff", "diagnostics" },
        -- lualine_c = { "filename" },
        lualine_c = {
            function()
                local path = vim.fn.expand("%:p:h:t") -- parent directory name
                local file = vim.fn.expand("%:t") -- filename
                return path .. "/" .. file
            end,
        },
        lualine_x = { "encoding", "filetype" },
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
})

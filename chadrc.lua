local M = {}
M.ui = {
  theme = "monekai",
  tabufline = {
    overriden_modules = function(modules)
      table.remove(modules, 4)
    end,
  },
  hl_override = {
    Comment = {
      italic = true,
      fg = "#706b6b",
    },
    CursorLineNr = {
      italic = true,
      bold = true,
      fg = "#e5c07b",
    },
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M

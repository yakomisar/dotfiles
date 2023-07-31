local M = {}
M.ui = {
  theme = "monekai",
  tabufline = {
    overriden_modules = function(modules)
      table.remove(modules, 4)
    end,
  },
  changed_themes = {
    monekai = {
      base_16 = {
        -- base00 = "#161216", --Default Background
        -- base01 - Lighter Background (Used for status bars, line number and folding marks)
        base02 = "#e5bf7c", --Selection Background
        -- base03 - Comments, Invisibles, Line Highlighting
        -- base04 - Dark Foreground (Used for status bars)
        -- base05 - Default Foreground, Caret, Delimiters, Operators
        -- base06 - Light Foreground (Not often used)
        -- base07 - Light Background (Not often used)
        -- base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
        base09 = "#c6c0f8", --Integers, Boolean, Constants, XML Attributes, Markup Link Url
        -- base0A - Classes, Markup Bold, Search Text Background
        base0B = "#fddc6b", --Strings, Inherited Class, Markup Code, Diff Inserted
        -- base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
        base0D = "#fe5b8b", --Functions, Methods, Attribute IDs, Headings
        -- base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
        -- base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
      },
      base_30 = {
        -- red = "red",
        -- white = "#e96366",
      },
    },
  },
  hl_override = {
    Comment = {
      italic = true,
      fg = "#706b6b",
    },
    CursorLineNr = {
      italic = true,
      bold = true,
      fg = "#fedc67",
    },
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M

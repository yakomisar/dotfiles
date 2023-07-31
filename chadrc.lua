local M = {}

local colors = {
  color1 = "#fe5b89", -- type, struct, func, if, else, ==, !=...
}

M.ui = {
  theme = "vscode_dark",
  tabufline = {
    overriden_modules = function(modules)
      table.remove(modules, 4)
    end,
  },
  changed_themes = {
    vscode_dark = {
      base_16 = {
        --     -- base00 = "#161216", --Default Background
        --     -- base01 - Lighter Background (Used for status bars, line number and folding marks)
        base02 = "#fedc67", --Selection Background
        --     -- base03 - Comments, Invisibles, Line Highlighting
        --     -- base04 - Dark Foreground (Used for status bars)
        --     -- base05 - Default Foreground, Caret, Delimiters, Operators
        --     -- base06 - Light Foreground (Not often used)
        --     -- base07 - Light Background (Not often used)
        -- base08 = "white", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
        -- base09 = "#c7c1f6", --Integers, Boolean, Constants, XML Attributes, Markup Link Url
        --     base0A = "#8ae8f1", -- Classes, Markup Bold, Search Text Background
        --     base0B = "#fddd69", --Strings, Inherited Class, Markup Code, Diff Inserted
        --     -- base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
        --     base0D = "#c0ef7f", --Functions, Methods, Attribute IDs, Headings
        -- base0E = colors.color1, -- Keywords, Storage, Selector, Markup Italic, Diff Changed
        --     base0F = "#d699b6", -- Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
      },
      --   base_30 = {
      --     -- red = "red",
      --     -- white = "#e96366",
      -- },
      polish_hl = {
        ["@function"] = { bold = true }, -- Function names
        ["@operator"] = {
          -- fg = colors.color1,
          bold = true,
        }, -- operators like = != := ==
        ["@keyword.return"] = {
          -- fg = "#40a6bf", -- good color
          fg = "#50e3c2", -- good contrast color
          bold = true,
        },
        --     ["@keyword.function"] = {
        --       fg = colors.color1,
        --       -- bold = true,
        --     },
        --     ["@keyword.if"] = {
        --       fg = colors.color1,
        --       -- bold = true,
        --     },
        ["@variable"] = {
          -- fg = "white",
          bold = true,
        }, -- Переменные (var/const)
        Error = { fg = "orange", bold = true },
        Type = { bold = true }, -- тип данных (string/int..)
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
    Number = {
      bold = true,
    },
    Float = {
      bold = true,
    },
    Boolean = {
      bold = true,
    },
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M

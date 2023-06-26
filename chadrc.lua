 local M = {}
     M.ui = {
        theme = 'everforest',
        tabufline = {
            overriden_modules = function()
                return {
                    buttons = function()
                    return ""
                    end,
                }
            end,
        },
    }
     M.plugins = "custom.plugins"
     M.mappings = require "custom.mappings"
 return M

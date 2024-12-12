local M = {}

function M.get_catppuccin_theme(flavour)
    local catppuccin_color = require("catppuccin.palettes").get_palette(flavour)

    local catppuccin_theme = {
        normal = {
            a = { fg = catppuccin_color.base,     bg = catppuccin_color.blue,     gui = "bold" },
            b = { fg = catppuccin_color.subtext0, bg = catppuccin_color.surface0               },
            c = { fg = catppuccin_color.overlay1, bg = catppuccin_color.base                   },
        },
        insert = {
            a = { fg = catppuccin_color.base,     bg = catppuccin_color.green,    gui = "bold" },
            b = { fg = catppuccin_color.subtext0, bg = catppuccin_color.surface0               },
        },
        visual = {
            a = { fg = catppuccin_color.base,     bg = catppuccin_color.mauve,    gui = "bold" },
            b = { fg = catppuccin_color.subtext0, bg = catppuccin_color.surface0               },
        },
        replace = {
            a = { fg = catppuccin_color.base,     bg = catppuccin_color.yellow,   gui = "bold" },
            b = { fg = catppuccin_color.subtext0, bg = catppuccin_color.surface0               },
        },
        inactive = {
            a = { fg = catppuccin_color.overlay1, bg = catppuccin_color.base                   },
            b = { fg = catppuccin_color.overlay1, bg = catppuccin_color.base                   },
        },
    }
    return catppuccin_theme
end

return M

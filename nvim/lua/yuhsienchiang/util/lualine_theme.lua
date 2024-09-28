local M = {}

function M.get_catppuccin_theme(flavour)
    local catppuccin_color = require("catppuccin.palettes").get_palette(flavour)

    local catppuccin_theme = {
        normal = {
            a = { bg = catppuccin_color.base, fg = catppuccin_color.blue },
            b = { bg = catppuccin_color.base, fg = catppuccin_color.blue },
            c = { bg = catppuccin_color.base, fg = catppuccin_color.overlay1 },
        },
        insert = {
            a = { bg = catppuccin_color.base, fg = catppuccin_color.green },
            b = { bg = catppuccin_color.base, fg = catppuccin_color.green },
        },
        visual = {
            a = { bg = catppuccin_color.base, fg = catppuccin_color.maroon },
            b = { bg = catppuccin_color.base, fg = catppuccin_color.maroon },
        },
        replace = {
            a = { bg = catppuccin_color.base, fg = catppuccin_color.yellow },
            b = { bg = catppuccin_color.base, fg = catppuccin_color.yellow },
        },
        inactive = {
            a = { fg = catppuccin_color.overlay1, bg = catppuccin_color.base },
            b = { fg = catppuccin_color.overlay1, bg = catppuccin_color.base },
        },
    }

    return catppuccin_theme
end

return M

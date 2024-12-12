local M = {}

function M.setup(flavour)
    local tokyonight = require("tokyonight")

    tokyonight.setup({
        style = flavour,
        styles = {
            comments = { italic = true },
            keywords = { italic = true },
            booleans = { italic = true },
        },
        on_color = function(colors)
            colors.diff.change = colors.blue
        end,
        on_highlights = function(hl, colors)
            hl.VertSplit = { fg = colors.overlay1, bg = colors.bg, bold = true }
            hl.WinSeparator = { link = "VertSplit" } -- nvimtree
            hl.CursorLineNr = { fg = colors.orange, bold = true }


            hl.LspSignatureActiveParameter = { bg = colors.bg_highlight, bold = true }

            hl.CmpItemAbbrMatch = { fg = colors.blue, bold = true }
            hl.CmpItemAbbrMatchFuzzy = { fg = colors.blue, bold = true }
            hl.CmpPmenu = { bg = colors.bg }
            hl.CmpSel = { fg = colors.bg, bg = colors.green, bold = true }
            hl.CmpBorder = { fg = colors.fg_dark }
            hl.CmpDoc = { link = "CmpPmenu" }
            hl.CmpDocBorder = { link = "CmpBorder" }

            hl.FlashPromptIcon = { fg = colors.yellow }

            hl.NoiceCmdlineIcon = { fg = colors.yellow, bg = colors.bg }

            hl.TelescopeSelection = { link = "CursorLine", bold = true }
            hl.TelescopeSelectionCaret = { link = "TelescopeSelection" }
            hl.TelescopePromptPrefix = { fg = colors.yellow }
            hl.TelescopePromptCounter = { link = "TelescopePromptPrefix" }
            hl.TelescopeMultiIcon = { link = "TelescopePromptPrefix" }
            hl.TelescopeMultiSelection = { link = "TelescopePromptPrefix" }

            hl.TelescopeNormal = { fg = colors.fg, bg = colors.bg }
            hl.TelescopeTitle = { fg = colors.bg, bg = colors.purple, bold = true }
            hl.TelescopeBorder = { fg = colors.fg_dark, bg = colors.bg }

            hl.TelescopePromptBorder = { link = "TelescopeBorder" }
            hl.TelescopeResultsBorder = { link = "TelescopeBorder" }
            hl.TelescopePreviewBorder = { link = "TelescopeBorder" }

            hl.TelescopePromptTitle = { fg = colors.bg, bg = colors.purple, bold = true }
            hl.TelescopeResultsTitle = { fg = colors.bg, bg = colors.green, bold = true }
            hl.TelescopePreviewTitle = { fg = colors.bg, bg = colors.blue, bold = true }

            hl.WhichKey = { fg = colors.fg, bg = colors.bg }
            hl.WhichKeyNormal = { fg = colors.fg, bg = colors.bg }
            hl.WhichKeyBorder = { fg = colors.fg_dark, bg = colors.bg }
        end,
    })

    vim.cmd([[ colorscheme tokyonight ]])
end

return M

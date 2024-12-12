local M = {}

function M.setup(flavour)
    local catppuccin = require("catppuccin")

    catppuccin.setup({
        compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
        flavour = flavour, -- latte, frappe, macchiato, mocha
        term_colors = true,
        dim_inactive = { enabled = false },
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
            comments = { "italic" }, -- Change the style of comments
            conditionals = { "italic" },
            booleans = { "italic" },
        },
        integrations = {
            cmp = true,
            dashboard = false,
            diffview = true,
            flash = true,
            gitsigns = { enabled = true, transparent = true },
            harpoon = true,
            illuminate = { enabled = false },
            indent_blankline = { enabled = false },
            lsp_trouble = true,
            mason = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
                inlay_hints = { background = true },
            },
            nvimtree = true,
            noice = true,
            snacks = true,
            telescope = { enabled = true },
            which_key = true,
        },
        custom_highlights = function(colors)
            -- stylua: ignore
            return {
                -- Native
                VertSplit = { fg = colors.overlay1, bg = colors.base, bold = true },
                WinSeparator = { link = "VertSplit" }, -- nvimtree
                CursorLineNr = { fg = colors.lavender, bold = true },

                -- Lsp
                LspSignatureActiveParameter = { bg = colors.surface1, bold = true, italic = true },

                -- Plugins
                -- Cmp
                CmpItemAbbrMatch = { fg = colors.blue, bold = true  },
                CmpItemAbbrMatchFuzzy = { fg = colors.blue, bold = true },
                CmpPmenu = { bg = colors.base },
                CmpSel = { fg = colors.base, bg = colors.green, bold = true },
                CmpBorder = { fg = colors.surface2 },
                CmpDoc = { link = "CmpPmenu" },
                CmpDocBorder = { link = "CmpBorder" },

                CmpItemMenuLSP = { fg = colors.mauve },
                CmpItemMenuBuffer = { fg = colors.blue },
                CmpItemMenuLuaSnip = { fg = colors.green },

                -- Dashboard
                DashboardHeader = { fg = colors.yellow },
                DashboardFooter = { fg = colors.surface1 },

                SnacksDashboardHeader = { fg = colors.yellow },
                SnacksDashboardDesc = { fg = colors.blue },
                SnacksDashboardIcon = { fg = colors.blue },
                SnacksDashboardKey = { fg = colors.blue },
                SnacksDashboardFooter = { fg = colors.surface1 },
                SnacksIndent = { fg = colors.surface0, bold = false },
                SnacksIndentScope = { fg = colors.subtext0, bold = true },

                -- Flash
                FlashPrompt	= { bg = colors.base },
                FlashPromptIcon = { fg = colors.yellow },

                -- GitGraph
                GitGraphHash =       { fg = colors.overlay1,  bg = colors.base },
                GitGraphTimestamp =  { fg = colors.yellow,  bg = colors.base },
                GitGraphAuthor =     { fg = colors.peach,    bg = colors.base },
                GitGraphBranchName = { fg = colors.green,   bg = colors.base },
                GitGraphBranchMsg =  { fg = colors.text,   bg = colors.base },
                GitGraphBranch1 = {   fg = colors.red, bg = colors.base },
                GitGraphBranch2 = {   fg = colors.yellow,    bg = colors.base },
                GitGraphBranch3 = {   fg = colors.blue,   bg = colors.base },
                GitGraphBranch4 = {   fg = colors.purple,    bg = colors.base },
                GitGraphBranch5 = {   fg = colors.cyan, bg = colors.base },

                -- GitSigns
                GitSignsChange = { fg = colors.blue, bg = colors.base },

                -- noice
                NoiceCmdline = { bg = colors.base },
                NoiceCmdlineIcon = { fg = colors.yellow, bg = colors.base },
                NoiceCmdlineIconSearch = { fg = colors.yellow, bg = colors.base },
                NoicePopupmenu = { fg =colors.text, bg = colors.base }, -- change to NormalFloat to make it look like other floats
                NoicePopupmenuBorder = { fg = colors.surface2, bg = colors.base }, -- border highlight
                NoicePopupmenuMatch = { fg = colors.text, bold = true }, -- used to highlight the part of the item that matches the input

                -- Telescope
                TelescopeSelection = {  bg = colors.surface1, bold = true },
                TelescopeSelectionCaret = { link = "TelescopeSelection" },
                TelescopePromptPrefix = { fg = colors.flamingo },
                TelescopePromptCounter = { link = "TelescopePromptPrefix" },
                TelescopeMultiIcon = { link = "TelescopePromptPrefix" },
                TelescopeMultiSelection = { link = "TelescopePromptPrefix" },

                TelescopeNormal = { bg = colors.base },
                TelescopeTitle = { fg = colors.base, bg = colors.flamingo, bold = true },
                TelescopeBorder = { fg = colors.surface2, bg = colors.base },

                TelescopePromptTitle = { fg = colors.base, bg = colors.flamingo, bold = true },
                TelescopeResultsTitle = { fg = colors.base, bg = colors.green, bold = true },
                TelescopePreviewTitle = { fg = colors.base, bg = colors.blue, bold = true },

                -- Trouble
                TroubleNormal = { fg = colors.text, bg = colors.base },
                TroubleNormalNC = { link = "TroubleNormal"},
                TroubleCount = { fg = colors.pink, bg = colors.none },

                -- WhichKey
                WhichKey = { fg = colors.text, bg = colors.base },
                WhichKeyNormal = { fg = colors.text, bg = colors.base },
                WhichKeyBorder = { fg = colors.surface2, bg = colors.base },

                OilPmenu = { fg = colors.text, bg = colors.base },
                OilBorder = { fg = colors.surface2, bg = colors.base },
                OilSel = { bg = colors.surface1 },
            }
        end,
    })
    vim.cmd([[ colorscheme catppuccin ]])
end

return M

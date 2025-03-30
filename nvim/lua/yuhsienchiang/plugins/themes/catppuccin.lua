local M = {}

function M.setup(flavour)
    local catppuccin = require("catppuccin")

    catppuccin.setup({
        compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
        flavour = flavour, -- latte, frappe, macchiato, mocha
        term_colors = true,
        dim_inactive = { enabled = false },
        styles = {
            comments = { "italic" }, -- Change the style of comments
            conditionals = { "italic" },
            booleans = { "italic" },
        },
        default_integrations = false,
        integrations = {
            blink_cmp = true,
            dap = true,
            dap_ui = true,
            dashboard = false,
            diffview = true,
            flash = true,
            fzf = true,
            gitsigns = true,
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
            neotest = true,
            nvimtree = true,
            noice = true,
            render_markdown = true,
            snacks = true,
            treesitter = true,
            which_key = true,
        },
        custom_highlights = function(colors)
            -- stylua: ignore
            return {
                -- Native
                VertSplit = { fg = colors.overlay1, bg = colors.base, bold = true },
                WinSeparator = { link = "VertSplit" }, -- nvimtree
                CursorLineNr = { fg = colors.lavender, bold = true },
                FloatBorder = { fg = colors.overlay0, bg = colors.base },

                DiagnosticVirtualLinesWarn = { link = "DiagnosticVirtualTextWarn" },
                DiagnosticVirtualLinesError = { link = "DiagnosticVirtualTextError" },
                DiagnosticVirtualLinesInfo = { link = "DiagnosticVirtualTextInfo" },
                DiagnosticVirtualLinesHint = { link = "DiagnosticVirtualTextHint" },
                DiagnosticVirtualLinesOK = { link = "DiagnosticVirtualTextOK" },

                -- Lsp
                LspSignatureActiveParameter = { bg = colors.surface1, bold = true, italic = true },

                -- Plugins
                -- Lazy
                LazyNormal = { fg = colors.text, bg = colors.base },

                DiagnosticIndicateError = { fg = colors.red, bg = colors.surface0 },
                DiagnosticIndicateWarn = { fg = colors.yellow, bg = colors.surface0 },
                DiagnosticIndicateInfo = { fg = colors.sky, bg = colors.surface0 },
                DiagnosticIndicateHint = { fg = colors.teal, bg = colors.surface0 },
                DiagnosticIndicateOK = { fg = colors.green, bg = colors.surface0 },

                -- NvimTree
                NvimTreeNormal = { fg = colors.text, bg = colors.base},

                -- Avante
                AvanteSidebarNormal = { bg = colors.base },
                AvanteTitle = { fg = colors.base, bg = colors.green, bold = true },
                AvanteSubtitle = { fg = colors.base, bg = colors.sky, bold = true },
                AvanteThirdTitle = { fg = colors.base, bg = colors.yellow, bold = true },
                AvantePopupHint = { fg = colors.overlay1, bg = colors.base },
                AvanteInlineHint = { fg = colors.mauve, bg = colors.base, italic = true },

                AvanteSidebarWinSeparator = { link = "VertSplit" },
                AvanteSidebarWinHorizontalSeparator = { fg = colors.base, bg = colors.base },

                -- BlinkCmp
                BlinkCmpMenu =           { bg = colors.base },
                BlinkCmpMenuSelection =  { fg = colors.base, bg = colors.green, bold = true },
                BlinkCmpMenuBorder =     { link = "FloatBorder" },
                BlinkCmpLabelMatch =     { fg = colors.blue, bold = true },
                BlinkCmpDoc =            { link = "BlinkCmpMenu" },
                BlinkCmpDocBorder =      { link = "FloatBorder" },
                BlinkCmpDocSeparator =   { link = "FloatBorder" },
                BlinkCmpSourceLSP =      { fg = colors.mauve },
                BlinkCmpSourceBuffer =   { fg = colors.blue },
                BlinkCmpSourceSnippets = { fg = colors.green },
                BlinkCmpSourcecmdline = { fg = colors.blue },
                BlinkCmpLabelDescription = { fg = colors.overlay1 },

                -- Snacks
                SnacksDashboardHeader = { fg = colors.yellow },
                SnacksDashboardDesc =   { fg = colors.blue },
                SnacksDashboardIcon =   { fg = colors.blue },
                SnacksDashboardKey =    { fg = colors.blue },
                SnacksDashboardFooter = { fg = colors.surface2 },
                SnacksIndent =          { fg = colors.surface0, bold = false },
                SnacksIndentScope =     { fg = colors.overlay1, bold = true },

                -- Flash
                FlashPrompt	=     { bg = colors.base },
                FlashPromptIcon = { fg = colors.yellow },

                -- GitSigns
                GitSignsChange = { fg = colors.blue, bg = colors.base },

                -- noice
                NoiceCmdline =           { bg = colors.base },
                NoiceCmdlineIcon =       { fg = colors.yellow, bg = colors.base },
                NoiceCmdlineIconSearch = { fg = colors.yellow, bg = colors.base },
                NoicePopupmenu =         { fg =colors.text, bg = colors.base }, -- change to NormalFloat to make it look like other floats
                NoicePopupmenuBorder =   { link = "FloatBorder" }, -- border highlight
                NoicePopupmenuMatch =    { fg = colors.text, bold = true }, -- used to highlight the part of the item that matches the input

                -- Fzf
                FzfLuaBorder =     { link = "FloatBorder" },
                FzfLuaTitle =      { fg = colors.base, bg = colors.flamingo, bold = true },
                FzfLuaLivePrompt = { fg = colors.text, bg = colors.base, bold = false },
                FzfLuaFzfHeader =  { fg = colors.overlay1, bg = colors.base },
                FzfLuaFzfPointer = { fg = colors.blue, bold = true },
                FzfLuaFilePart = { fg = colors.text, bold = true },
                FzfLuaDirPart = { fg = colors.overlay1 },
                FzfLuaFzfMarker = { fg = colors.yellow },

                -- Trouble
                TroubleNormal =   { fg = colors.text, bg = colors.base },
                TroubleNormalNC = { link = "TroubleNormal"},
                TroubleCount =    { fg = colors.pink, bg = colors.none },

                -- WhichKey
                WhichKey =       { fg = colors.text, bg = colors.base },
                WhichKeyNormal = { fg = colors.text, bg = colors.base },
                WhichKeyBorder = { link = "FloatBorder" },

                -- Mason
                MasonNormal = { bg = colors.base },

                -- Oil
                OilPmenu =  { fg = colors.text, bg = colors.base },
                OilBorder = { link = "FloatBorder" },
                OilSel =    { bg = colors.surface1 },
            }
        end,
    })
    vim.cmd([[ colorscheme catppuccin ]])
end

return M

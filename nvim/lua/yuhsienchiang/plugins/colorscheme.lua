return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            term_colors = true,
            dim_inactive = {
                enabled = true, -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.45, -- percentage of the shade to apply to the inactive window
            },
            integrations = {
                cmp = true,
                dashboard = true,
                flash = true,
                gitsigns = true,
                illuminate = { enabled = true, lsp = false },
                indent_blankline = { enabled = true, colored_indent_levels = false },
                lsp_saga = true,
                mason = true,
                mini = { enabled = true },
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
                noice = true,
                notify = true,
                nvimtree = true,
                treesitter = true,
                telescope = { enabled = true },
                which_key = true,
            },
            custom_highlights = function(colors)
                return {
                    -- native nvim
                    VertSplit = { fg = colors.peach, bold = true },
                    WinSeparator = { link = "VertSplit" },
                    CursorLineNr = { fg = colors.lavender, bold = true },

                    -- Dashboard
                    DashboardHeader = { fg = colors.yellow },
                    DashboardFooter = { fg = colors.surface1 },
                    DashboardIcon = { fg = colors.blue },
                    DashboardDesc = { fg = colors.text },
                    DashboardKey = { fg = colors.peach },

                    -- NvimTree
                    NvimTreeWinSeparator = { fg = colors.peach, bold = true },

                    -- noice
                    NoiceCmdline = { bg = colors.base },
                    NoiceCmdlineIcon = { fg = colors.yellow, bg = colors.base },
                    NoiceCmdlineIconSearch = { fg = colors.yellow, bg = colors.base },
                    NoicePopupmenu = { bg = colors.base }, -- change to NormalFloat to make it look like other floats
                    NoicePopupmenuBorder = { fg = colors.overlay2, bg = colors.base }, -- border highlight
                    NoicePopupmenuMatch = { fg = colors.text, bold = true }, -- used to highlight the part of the item that matches the input

                    -- Telescope
                    TelescopeSelection = { fg = colors.flamingo, bg = colors.base, bold = true },
                    TelescopeSelectionCaret = { fg = colors.flamingo, bg = colors.base, bold = true },
                    TelescopePromptPrefix = { fg = colors.flamingo, bg = colors.base },
                    TelescopeNormal = { bg = colors.base },
                    TelescopeTitle = { fg = colors.base, bg = colors.rosewater, bold = true },
                    TelescopeBorder = { fg = colors.overlay2, bg = colors.base },
                    TelescopePromptTitle = { fg = colors.base, bg = colors.flamingo, bold = true },
                    TelescopeResultsTitle = { fg = colors.base, bg = colors.green, bold = true },
                    TelescopePreviewTitle = { fg = colors.base, bg = colors.blue, bold = true },
                    TelescopeMultiIcon = { fg = colors.flamingo, bg = colors.base, bold = true },
                    TelescopeMultiSelection = { fg = colors.flamingo, bg = colors.base },

                    -- GitSigns
                    GitSignsChange = { fg = colors.blue, bg = colors.base, bold = true },

                    -- WhichKey
                    WhichKey = { fg = colors.maroon },
                    WhichKeyGroup = { fg = colors.yellow },
                    WhichKeyDesc = { fg = colors.text },

                    -- Diagnostic Virtual Text [Text]
                    DiagnosticVirtualTextError = { fg = colors.red, bg = "none", italic = true, bold = true },
                    DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = "none", italic = true, bold = true },
                    DiagnosticVirtualTextInfo = { fg = colors.sky, bg = "none", italic = true, bold = true },
                    DiagnosticVirtualTextHint = { fg = colors.teal, bg = "none", italic = true, bold = true },
                    -- Diagnostic Virtual Text [icon]
                    DiagnosticError = { fg = colors.red, bg = "none", italic = true, bold = true },
                    DiagnosticWarn = { fg = colors.yellow, bg = "none", italic = true, bold = true },
                    DiagnosticInfo = { fg = colors.sky, bg = "none", italic = true, bold = true },
                    DiagnosticHint = { fg = colors.teal, bg = "none", italic = true, bold = true },
                    -- Diagnostic Signs at sign column
                    DiagnosticSignError = { fg = colors.red, bg = "none" },
                    DiagnosticSignWarn = { fg = colors.yellow, bg = "none" },
                    DiagnosticSignInfo = { fg = colors.sky, bg = "none" },
                    DiagnosticSignHint = { fg = colors.teal, bg = "none" },
                }
            end,
        })
        vim.cmd([[ colorscheme catppuccin ]])
    end,
}

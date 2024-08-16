return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                term_colors = true,
                dim_inactive = { enabled = false },
                integrations = {
                    dashboard = false,
                    diffview = true,
                    harpoon = true,
                    illuminate = { enabled = true, lsp = false },
                    indent_blankline = { enabled = true, colored_indent_levels = false },
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
                    noice = true,
                    notify = true,
                    which_key = true,
                },
                custom_highlights = function(colors)
                    local darken = require("catppuccin.utils.colors").darken

                    -- stylua: ignore
                    return {
                        -- native nvim
                        VertSplit = { fg = colors.peach, bold = true },
                        WinSeparator = { link = "VertSplit" },
                        CursorLineNr = { fg = colors.lavender, bold = true },

                        -- Lsp
                        LspSignatureActiveParameter = { fg = colors.peach, bg = colors.surface1, bold = true },

                        -- Flash
                        FlashPrompt	= { bg = colors.base },
                        FlashPromptIcon = { fg = colors.yellow },

                        -- Dashboard
                        DashboardHeader = { fg = colors.yellow },
                        DashboardFooter = { fg = colors.surface1 },
                        DashboardIcon = { fg = colors.blue },
                        DashboardDesc = { fg = colors.text },
                        DashboardKey = { fg = colors.peach },

                        -- noice
                        NoiceCmdline = { bg = colors.base },
                        NoiceCmdlineIcon = { fg = colors.yellow, bg = colors.base },
                        NoiceCmdlineIconSearch = { fg = colors.yellow, bg = colors.base },
                        NoicePopupmenu = { bg = colors.base }, -- change to NormalFloat to make it look like other floats
                        NoicePopupmenuBorder = { fg = colors.overlay2, bg = colors.base }, -- border highlight
                        NoicePopupmenuMatch = { fg = colors.text, bold = true }, -- used to highlight the part of the item that matches the input

                        -- Telescope
                        TelescopeSelection = { fg = colors.flamingo, bg = colors.base, bold = true },
                        TelescopeSelectionCaret = { link = "TelescopeSelection" },
                        TelescopePromptPrefix = { link = "TelescopeSelection" },
                        TelescopeNormal = { bg = colors.base },
                        TelescopeTitle = { fg = colors.rosewater, bg = colors.base, bold = true },
                        TelescopeBorder = { fg = colors.overlay2, bg = colors.base },
                        TelescopePromptTitle = { fg = colors.flamingo, bg = colors.base, bold = true },
                        TelescopeResultsTitle = { fg = colors.green, bg = colors.base, bold = true },
                        TelescopePreviewTitle = { fg = colors.blue, bg = colors.base, bold = true },
                        TelescopeMultiIcon = { fg = colors.flamingo, bg = colors.base, bold = true },
                        TelescopeMultiSelection = { fg = colors.flamingo, bg = colors.base },

                        -- GitSigns
                        GitSignsChange = { fg = colors.blue, bg = colors.base, bold = true },

                        -- RenderMarkdown
                        RenderMarkdownH1 = { fg = colors.red, bg = darken(colors.red, 0.4, colors.base), bold = true },
                        RenderMarkdownH2 = { fg = colors.peach, bg = darken(colors.peach, 0.4, colors.base), bold = true },
                        RenderMarkdownH3 = { fg = colors.yellow, bg = darken(colors.yellow, 0.4, colors.base), bold = true },
                        RenderMarkdownH4 = { fg = colors.green, bg = darken(colors.green, 0.4, colors.base), bold = true },
                        RenderMarkdownH5 = { fg = colors.sapphire, bg = darken(colors.sapphire, 0.4, colors.base), bold = true },
                        RenderMarkdownH6 = { fg = colors.lavender, bg = darken(colors.lavender, 0.4, colors.base), bold = true },
                        RenderMarkdownH1Bg = { fg = colors.red, bg = darken(colors.red, 0.4, colors.base), bold = true },
                        RenderMarkdownH2Bg = { fg = colors.peach, bg = darken(colors.peach, 0.4, colors.base), bold = true },
                        RenderMarkdownH3Bg = { fg = colors.yellow, bg = darken(colors.yellow, 0.4, colors.base), bold = true },
                        RenderMarkdownH4Bg = { fg = colors.green, bg = darken(colors.green, 0.4, colors.base), bold = true },
                        RenderMarkdownH5Bg = { fg = colors.sapphire, bg = darken(colors.sapphire, 0.4, colors.base), bold = true },
                        RenderMarkdownH6Bg = { fg = colors.lavender, bg = darken(colors.lavender, 0.4, colors.base), bold = true },
                    }
                end,
            })
            vim.cmd([[ colorscheme catppuccin ]])
        end,
    },
}

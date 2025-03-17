return {
    "OXY2DEV/markview.nvim",
    enabled = false,
    ft = { "markdown", "quarto", "rmd", "typst", "Avante" },
    cmd = "Markview",
    opts = function()
        return {
            preview = {
                enable = true,
                enable_hybrid_mode = true,
                debounce = 150,
                icon_provider = "devicons",
                filetypes = { "markdown", "quarto", "rmd", "typst", "Avante" },
                ignore_buftypes = {},
                ignore_previews = {},

                -- modes to enable preview
                --  { no }: pending
                -- { "v", "vs" }: visual
                -- { "V", "Vs" }: visual line
                -- { "\22", "\22s" }: visual block
                modes = { "n", "no", "c", "i", "v", "vs", "V", "Vs", "\22", "\22s" },

                -- modes to enable hybrid preview.
                -- modes in here must be present in "modes" to take effect
                hybrid_modes = { "n", "no", "c", "i", "v", "vs", "V", "Vs", "\22", "\22s" },

                draw_range = { vim.o.lines, vim.o.lines },
                edit_range = { 0, 0 },
                splitview_winopts = { split = "right" },
            },
            markdown_inline = {
                enable = true,
                checkboxes = {
                    checked = {
                        text = "",
                        hl = "MarkviewCheckboxChecked",
                        scope_hl = "MarkviewCheckboxStriked",
                    },
                    unchecked = {
                        text = "",
                        hl = "MarkviewCheckboxUnchecked",
                    },
                    custom = {
                        {
                            match_string = "-",
                            text = "",
                            hl = "MarkviewCheckboxPending",
                        },
                        {
                            match_string = "~",
                            text = "",
                            hl = "MarkviewCheckboxProgress",
                        },
                        {
                            match_string = "o",
                            text = "",
                            hl = "MarkviewCheckboxCancelled",
                        },
                    },
                },
            },
            markdown = {
                list_items = {
                    indent_size = 0,
                    shift_width = 2,
                },
                headings = {
                    enable = true,
                    shift_width = 2,
                    textoff = 7,
                    heading_1 = {
                        style = "icon",
                        sign = "󰌕 ",
                        sign_hl = "MarkviewHeading1Sign",
                        icon = "█ 󰬺 ",
                        icon_hl = "MarkviewHeading1Sign",
                        hl = "MarkviewHeading1",
                    },
                    heading_2 = {
                        style = "icon",
                        sign = "󰌖 ",
                        sign_hl = "MarkviewHeading2Sign",
                        icon = "█ 󰬻 ",
                        icon_hl = "MarkviewHeading2Sign",
                        hl = "MarkviewHeading2",
                    },
                    heading_3 = {
                        style = "icon",
                        icon = "█ 󰬼 ",
                        icon_hl = "MarkviewHeading3Sign",
                        hl = "MarkviewHeading3",
                    },
                    heading_4 = {
                        style = "icon",
                        icon = "█ 󰬽 ",
                        icon_hl = "MarkviewHeading4Sign",
                        hl = "MarkviewHeading4",
                    },
                    heading_5 = {
                        style = "icon",
                        icon = "█ 󰬾 ",
                        icon_hl = "MarkviewHeading5Sign",
                        hl = "MarkviewHeading5",
                    },
                    heading_6 = {
                        style = "icon",
                        icon = "█ 󰬿 ",
                        icon_hl = "MarkviewHeading6Sign",
                        hl = "MarkviewHeading6",
                    },
                },
                horizontal_rules = {
                    enable = true,
                    parts = {
                        {
                            type = "repeating",
                            repeat_amount = function()
                                return vim.o.columns
                            end,
                            text = "━",
                            hl = "Comment",
                        },
                    },
                },
            },
        }
    end,
}

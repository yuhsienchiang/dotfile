return {
    "OXY2DEV/markview.nvim",
    ft = { "markdown" },
    cmd = "Markview",
    opts = function()
        return {
            preview = {
                enable = true,
                enable_hybrid_mode = true,
                debounce = 150,
                icon_provider = "devicons",
                filetypes = { "markdown", "quarto", "rmd", "typst" },

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
        }
    end,
}

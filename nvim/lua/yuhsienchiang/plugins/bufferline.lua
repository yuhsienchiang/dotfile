return {
    "akinsho/bufferline.nvim",
    event = "TabNew",
    -- after = "catppuccin",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local bufferline = require("bufferline")
        local catppuccin_colors = require("catppuccin.palettes").get_palette("frappe")

        bufferline.setup({
            options = {
                mode = "tabs",
                style_preset = bufferline.style_preset.default,
                themable = true,
                numbers = function(opts)
                    return string.format("%s", opts.raise(opts.ordinal))
                end,
                close_command = "bdelete %d", -- can be a string | function, | false see "Mouse actions"
                right_mouse_command = false,
                left_mouse_command = false,
                indicator = {
                    icon = "▎",
                    style = "icon",
                },
                buffer_close_icon = " 󰅖 ",
                modified_icon = " ● ",
                close_icon = "󰅖",
                left_trunc_marker = "",
                right_trunc_marker = "",
                name_formatter = function(buf) -- buf contains:
                    return buf.name
                end,
                truncate_names = true, -- whether or not tab names should be truncated
                tab_size = 20,
                diagnostics = false,
                diagnostics_update_in_insert = false,
                offsets = { { filetype = "NvimTree", separator = true } },
                color_icons = true, -- whether or not to add the filetype icon highlights
                show_buffer_icons = false, -- disable filetype icons for buffers
                show_buffer_close_icons = true,
                show_close_icon = false,
                show_tab_indicators = false,
                enforce_regular_tabs = false,
                always_show_bufferline = false,
                separator_style = { "", "" },
                hover = { enabled = false },
            },
            highlights = {
                -- the space where is no tabs
                fill = { bg = catppuccin_colors.base },

                -- buffers
                background = {
                    fg = catppuccin_colors.overlay1,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                    italic = false,
                },
                buffer_visible = {
                    fg = catppuccin_colors.overlay1,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                    italic = false,
                },
                buffer_selected = {
                    fg = catppuccin_colors.subtext1,
                    bg = catppuccin_colors.base,
                    bold = true,
                    italic = true,
                },

                -- duplicate
                duplicate = {
                    fg = catppuccin_colors.overlay1,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                    italic = false,
                },
                duplicate_visible = {
                    fg = catppuccin_colors.overlay1,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                    italic = false,
                },
                duplicate_selected = {
                    fg = catppuccin_colors.subtext1,
                    bg = catppuccin_colors.base,
                    bold = true,
                    italic = true,
                },

                -- modified symbol
                modified = {
                    fg = catppuccin_colors.overlay1,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                    italic = false,
                },
                modified_visible = {
                    fg = catppuccin_colors.overlay1,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                    italic = false,
                },
                modified_selected = {
                    fg = catppuccin_colors.maroon,
                    bg = catppuccin_colors.base,
                    bold = true,
                    italic = false,
                },

                -- indicator
                indicator_visible = {
                    fg = catppuccin_colors.maroon,
                    bg = catppuccin_colors.mantle,
                },
                indicator_selected = {
                    fg = catppuccin_colors.maroon,
                    bg = catppuccin_colors.base,
                },

                -- close buttons
                close_button = {
                    fg = catppuccin_colors.overlay1,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                    italic = false,
                },
                close_button_visible = {
                    fg = catppuccin_colors.overlay1,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                    italic = false,
                },
                close_button_selected = {
                    fg = catppuccin_colors.subtext1,
                    bg = catppuccin_colors.base,
                    bold = true,
                    italic = true,
                },

                -- number
                numbers = {
                    fg = catppuccin_colors.overlay1,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                    italic = false,
                },
                numbers_visible = {
                    fg = catppuccin_colors.overlay1,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                    italic = false,
                },
                numbers_selected = {
                    fg = catppuccin_colors.subtext1,
                    bg = catppuccin_colors.base,
                    bold = true,
                    italic = true,
                },
            },
        })
    end,
}

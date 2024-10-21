return {
    "akinsho/bufferline.nvim",
    event = "TabNew",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local bufferline = require("bufferline")
        local catppuccin_colors = require("catppuccin.palettes").get_palette("mocha")

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
                fill = { -- the space where is no tabs
                    bg = catppuccin_colors.base,
                },
                background = { -- not selected buffer
                    fg = catppuccin_colors.surface2,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                },
                buffer_visible = {
                    fg = catppuccin_colors.surface2,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                },
                buffer_selected = { -- selected buffer
                    fg = catppuccin_colors.subtext1,
                    bg = catppuccin_colors.base,
                    bold = false,
                    italic = false,
                    underline = false,
                },
                close_button = {
                    fg = catppuccin_colors.surface2,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                },
                close_button_visible = {
                    fg = catppuccin_colors.surface2,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                },
                close_button_selected = {
                    fg = catppuccin_colors.subtext1,
                    bg = catppuccin_colors.base,
                    bold = false,
                    italic = false,
                    underline = false,
                },
                modified = {
                    fg = catppuccin_colors.surface2,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                    underline = false,
                },
                modified_visible = {
                    fg = catppuccin_colors.surface2,
                    bg = catppuccin_colors.mantle,
                    bold = false,
                    underline = false,
                },
                modified_selected = {
                    fg = catppuccin_colors.subtext1,
                    bg = catppuccin_colors.base,
                    bold = false,
                    italic = true,
                    underline = false,
                },
                indicator_visible = {
                    fg = catppuccin_colors.surface2,
                    bg = catppuccin_colors.base,
                },
                indicator_selected = {
                    fg = catppuccin_colors.blue,
                    bg = catppuccin_colors.base,
                    bold = true,
                },
            },
        })
    end,
}

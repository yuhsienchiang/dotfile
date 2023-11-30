return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline_setup, bufferline = pcall(require, "bufferline")
		if not bufferline_setup then
			print("bufferline not found")
			return
		end

		local catppuccin_colors = require("catppuccin.palettes").get_palette("macchiato")

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
				buffer_close_icon = " 󰅚 ",
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
				offsets = {
					{
						filetype = "NvimTree",
						text = "NvimTree",
						text_align = "center",
						separator = true,
					},
				},
				color_icons = true, -- whether or not to add the filetype icon highlights
				show_buffer_icons = true, -- disable filetype icons for buffers
				show_buffer_close_icons = true,
				show_close_icon = false,
				show_tab_indicators = false,
				separator_style = {"▎", "▎"},
				enforce_regular_tabs = false,
				always_show_bufferline = false,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
			},
			highlights = {
				fill = { -- the space where is no tabs
					bg = catppuccin_colors.crust,
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
					fg = catppuccin_colors.subtext0,
					bg = catppuccin_colors.base,
					bold = false,
					italic = false,
					underline = false,
				},
				numbers = { -- numbers for not selected buffer
					fg = catppuccin_colors.surface2,
					bg = catppuccin_colors.mantle,
					bold = false,
				},
				numbers_visible = {
					fg = catppuccin_colors.surface2,
					bg = catppuccin_colors.mantle,
					bold = false,
				},
				numbers_selected = { -- numbers for selected buffer
					fg = catppuccin_colors.subtext0,
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
					fg = catppuccin_colors.subtext0,
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
					fg = catppuccin_colors.subtext0,
					bg = catppuccin_colors.base,
					bold = false,
					italic = false,
					underline = false,
				},
				separator_selected = {
					fg = catppuccin_colors.red,
					bg = catppuccin_colors.crust,
					bold = false,
					italic = false,
					underline = false,
				},
				separator = {
					fg = catppuccin_colors.surface2,
					bg = catppuccin_colors.crust,
				},
				indicator_visible = {
					fg = catppuccin_colors.surface2,
					bg = catppuccin_colors.red,
				},
				indicator_selected = {
					bg = catppuccin_colors.base,
					fg = catppuccin_colors.red,
					bold = true,
				},
				offset_separator = {
					fg = catppuccin_colors.peach,
					bg = catppuccin_colors.base,
				},
				trunc_marker = {
					fg = catppuccin_colors.surface2,
					bg = catppuccin_colors.mantle,
					bold = false,
					underline = false,
				},
			},
		})
	end,
}

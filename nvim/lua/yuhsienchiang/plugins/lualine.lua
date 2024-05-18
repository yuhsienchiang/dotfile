return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
	config = function()
		local catppuccin_color = require("catppuccin.palettes").get_palette("mocha")

		local catppuccin_theme = {
			normal = {
				a = { bg = catppuccin_color.blue, fg = catppuccin_color.base, gui = "bold" },
				b = { bg = catppuccin_color.base, fg = catppuccin_color.blue },
				c = { bg = "none", fg = catppuccin_color.text },
			},
			insert = {
				a = { bg = catppuccin_color.green, fg = catppuccin_color.base, gui = "bold" },
				b = { bg = catppuccin_color.base, fg = catppuccin_color.green },
			},
			visual = {
				a = { bg = catppuccin_color.maroon, fg = catppuccin_color.base, gui = "bold" },
				b = { bg = catppuccin_color.base, fg = catppuccin_color.maroon },
			},
			replace = {
				a = { bg = catppuccin_color.yellow, fg = catppuccin_color.base, gui = "bold" },
				b = { bg = catppuccin_color.base, fg = catppuccin_color.yellow },
			},
			inactive = {
				a = { fg = catppuccin_color.surface1, bg = catppuccin_color.mantle },
				b = { fg = catppuccin_color.surface1, bg = catppuccin_color.mantle, gui = "bold" },
				c = { fg = catppuccin_color.overlay0, bg = catppuccin_color.mantle },
			},
		}

		require("lualine").setup({
			options = {
				theme = catppuccin_theme,
				icons_enabled = true,
				always_divide_middle = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {
						"checkhealth",
						"dashboard",
						"help",
						"NvimTree",
						"lazy",
						"lspinfo",
						"mason",
						"startuptime",
					},
					winbar = {
						"checkhealth",
						"dashboard",
						"help",
						"lazy",
						"lspinfo",
						"mason",
						"NvimTree",
						"startuptime",
					},
				},
			},
			-- lualine for active/focus window
			sections = {
				lualine_a = {
					{
						function()
							return " "
						end,
						component_separators = { left = "", right = "" },
						section_separators = { left = "", right = "" },
						padding = 0,
					},
				},
				lualine_b = {
					{
						"filename",
						file_status = true,
						newfile_status = true,
						symbols = {
							modified = " ●",
							unnamed = "[No Name]",
							newfile = "[New]",
						},
						padding = { left = 1, right = 1 },
						separator = { left = "", right = " " },
					},
				},
				lualine_c = {
					{
						"branch",
						fmt = function(str)
							local strw = vim.api.nvim_strwidth(str)
							if strw > 20 then
								return ("%s..."):format(str:sub(1, 19))
							end
							return str
						end,
						color = { fg = catppuccin_color.overlay1, bg = catppuccin_color.base },
						separator = "|",
					},
				},
				lualine_x = {
					{
						function()
							return require("noice").api.status.mode.get()
						end,
						cond = function()
							return package.loaded["noice"] and require("noice").api.status.mode.has()
						end,
						color = { fg = catppuccin_color.overlay1, bg = catppuccin_color.base },
					},
				},
				lualine_y = {
					{
						require("yuhsienchiang.util.venv").activated_venv,
						color = { fg = catppuccin_color.overlay1, bg = catppuccin_color.base },
					},
                    {
                        require("yuhsienchiang.util.harpoon_action").harpoon_lualine,
						color = { fg = catppuccin_color.overlay1, bg = catppuccin_color.base },
                    },
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
                        color = { bg = catppuccin_color.base }
					},
				},
				lualine_z = {
					{
						"filetype",
						colored = false,
						color = { fg = catppuccin_color.maroon, bg = catppuccin_color.base },
						separator = "|",
					},
				},
			},
			-- lualine for inactive/unfoucus window
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
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
		local catppuccin_color = require("catppuccin.palettes").get_palette("macchiato")

		local catppuccin_theme = {
			normal = {
				a = { bg = catppuccin_color.blue, fg = catppuccin_color.base, gui = "bold" },
				b = { bg = catppuccin_color.surface1, fg = catppuccin_color.blue },
				c = { bg = "none", fg = catppuccin_color.text },
			},
			insert = {
				a = { bg = catppuccin_color.green, fg = catppuccin_color.base, gui = "bold" },
				b = { bg = catppuccin_color.surface1, fg = catppuccin_color.green },
			},
			visual = {
				a = { bg = catppuccin_color.maroon, fg = catppuccin_color.base, gui = "bold" },
				b = { bg = catppuccin_color.surface1, fg = catppuccin_color.maroon },
			},
			inactive = {
				a = { fg = catppuccin_color.surface1, bg = catppuccin_color.mantle },
				b = { fg = catppuccin_color.surface1, bg = catppuccin_color.mantle, gui = "bold" },
				c = { fg = catppuccin_color.overlay0, bg = catppuccin_color.mantle },
			},
		}

		local actived_venv = function()
			local venv_name = require("venv-selector").get_active_venv()
			if vim.bo.filetype ~= "python" then
				return ""
			end
			if venv_name ~= nil then
				return string.gsub(venv_name, "/Users/yuhsienchiang/.pyenv/versions/", "(pyenv) ")
			else
				return "venv"
			end
		end

		require("lualine").setup({
			options = {
				theme = catppuccin_theme,
				icons_enabled = true,
				always_divide_middle = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "|", right = "|" },
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
					{
						"diff",
						separator = "|",
					},
				},
				lualine_x = {
					{
						actived_venv,
						on_click = function()
							vim.cmd.VenvSelect()
						end,
						color = { fg = catppuccin_color.overlay1, bg = catppuccin_color.base },
					},
				},
				lualine_y = {
					{
						"filetype",
						colored = false,
						color = { fg = catppuccin_color.base, bg = catppuccin_color.maroon },
						separator = "|",
					},
					{
						"progress",
						color = { fg = catppuccin_color.base, bg = catppuccin_color.maroon },
						separator = "|",
					},
				},
				lualine_z = {
					{
                        function()
                            return " " .. os.date("%R")
                        end,
						color = { fg = catppuccin_color.base, bg = catppuccin_color.flamingo },
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

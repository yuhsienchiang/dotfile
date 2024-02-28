return {
	"folke/which-key.nvim",
    event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local which_key_status, which_key = pcall(require, "which-key")
		if not which_key_status then
			print("which_key not found")
			return
		end

		which_key.setup({
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				spelling = {
					enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				},
				presets = {
					operators = false, -- adds help for operators like d, y, ...
					motions = false, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = false, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
				},
			},
			key_labels = {
				["<space>"] = "SPC",
				["<cr>"] = "RETURN",
				["<tab>"] = "TAB",
				["<Down>"] = "",
				["<Left>"] = "",
				["<Right>"] = "",
				["<Up>"] = "",
			},
			popup_mappings = {
				scroll_down = "<c-k>", -- binding to scroll down inside the popup
				scroll_up = "<c-j>", -- binding to scroll up inside the popup
			},
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "  ", -- symbol used between a key and it's label
				group = "  ", -- symbol prepended to a group
			},
			window = {
				border = "single", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
				zindex = 1000, -- positive value to position WhichKey above other floating windows.
			},
			layout = {
				height = { min = 4, max = 20 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 4, -- spacing between columns
				align = "left", -- align columns left, center or right
			},
		})

		which_key.register({
			mode = { "n" },
			["<leader>f"] = { name = "Telescope" },
			["<leader>s"] = { name = "NvimTree" },
			["<leader>v"] = { name = "VenvSelect" },
			["<leader>g"] = { name = "Git" },
			["<leader>gl"] = { name = "LazyGit" },
			["<leader>gd"] = { name = "Diffview" },
			["<leader>gh"] = { name = "Gitsigns" },
			["<leader>m"] = { name = "Markdown" },
			["<leader>b"] = { name = "Buffer" },
			["<leader>d"] = { name = "Lspsaga" },
			["<leader>e"] = { name = "Format" },
			["<leader>t"] = { name = "Tab" },
			["<leader>w"] = { name = "Window" },
			["<leader>n"] = { name = "Noice" },
			["<leader>q"] = { name = "Quit Options" },
		})
	end,
}

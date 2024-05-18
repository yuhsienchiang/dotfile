return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local which_key = require("which-key")

		which_key.setup({
			plugins = {
				marks = false, -- shows a list of your marks on ' and `
				registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				spelling = { enabled = false }, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				presets = {
					operators = false, -- adds help for operators like d, y, ...
					motions = false, -- adds help for motions
					text_objects = false, -- help for text objects triggered after entering an operator
					windows = false, -- default bindings on <c-w>
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
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "  ", -- symbol used between a key and it's label
				group = "  ", -- symbol prepended to a group
			},
		})

        which_key.register({
            mode = { "n", "v" },
            ["<leader>b"] = { name = "Buffer" },
            ["<leader>d"] = { name = "Lspsaga" },
            ["<leader>e"] = { name = "Format" },
            ["<leader>f"] = { name = "Telescope" },
            ["<leader>g"] = { name = "Git" },
            ["<leader>gd"] = { name = "Diffview" },
            ["<leader>gh"] = { name = "Gitsigns" },
            ["<leader>gl"] = { name = "LazyGit" },
            ["<leader>h"] = { name = "Harpoon" },
            ["<leader>m"] = { name = "Markdown" },
            ["<leader>n"] = { name = "Noice" },
            ["<leader>q"] = { name = "Quit" },
            ["<leader>s"] = { name = "NvimTree" },
            ["<leader>t"] = { name = "Tab" },
            ["<leader>v"] = { name = "VenvSelect" },
            ["<leader>w"] = { name = "Window" },
        })
	end,
}

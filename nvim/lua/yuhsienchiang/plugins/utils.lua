return {
	{
		"rcarriga/nvim-notify",
		lazy = true,
		opts = {
			timeout = 2500,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		},
        config = function(opt)
			vim.opt.termguicolors = true
			vim.notify = require("notify")
            require("notify").setup(opt)
        end
	},
	{
		"MunifTanjim/nui.nvim",
		lazy = true,
	},
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

	{
		"onsails/lspkind.nvim",
		lazy = true,
	},

	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = function()
			require("nvim-web-devicons").setup({
				override = {
					toml = { icon = "" },
				},
			})
		end,
	},
}

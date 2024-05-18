return {
	"linux-cultist/venv-selector.nvim",
	cmd = { "VenvSelect", "VenvSelectCached" },
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local selector = require("venv-selector")

		selector.setup({
			pyenv_path = "/Users/yuhsienchiang/.pyenv/versions",
		})
	end,
}

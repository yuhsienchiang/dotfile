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
			search_venv_managers = true,
			search_workspace = false,
			search = false,
			pyenv_path = "/Users/yuhsienchiang/.pyenv/versions",
			dap_enabled = true,
			auto_refresh = false,
			parents = 2,
			name = { "venv" }, -- NOTE: You can also use a lua table here for multiple names: {"venv", ".venv"}`
			fd_binary_name = "fd",
            changed_venv_hooks = { require("yuhsienchiang.util.venv").basedpyright_hook, selector.hooks.pyright }
		})

		vim.api.nvim_create_autocmd("VimEnter", {
			desc = "Auto select virtualenv Nvim open",
			pattern = "*",
			callback = function()
				local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
				if venv ~= "" then
					selector.retrieve_from_cache()
				end
			end,
			once = true,
		})
	end,
}

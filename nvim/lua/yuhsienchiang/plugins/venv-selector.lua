return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local selector_status, selector = pcall(require, "venv-selector")
		if not selector_status then
			print("venv-selector not found")
			return
		end

		selector.setup({
			search_venv_managers = true,
			search_workspace = true,
			search = false,
			pyenv_path = "/Users/yuhsienchiang/.pyenv/versions",
			dap_enabled = false,
			auto_refresh = false,
			parents = 2,
			name = { "venv", "pyrightconfig.json" }, -- NOTE: You can also use a lua table here for multiple names: {"venv", ".venv"}`
			fd_binary_name = "fd",
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

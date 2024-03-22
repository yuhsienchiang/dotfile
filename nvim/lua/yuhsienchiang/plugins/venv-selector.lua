return {
	"linux-cultist/venv-selector.nvim",
    cmd = { "VenvSelect", "VenvSelectCached" },
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local selector = require("venv-selector")

        local basedpyright_hook = function (_, venv_python)
            local client = (vim.lsp.get_clients or vim.lsp.get_active_clients)({ name = "basedpyright" })[1]
            if not client then
                return
            else
                if client.settings then
                    client.settings = vim.tbl_deep_extend("force", client.settings, { basedpyright = { pythonPath = venv_python } })
                else
                    client.config.settings = vim.tbl_deep_extend("force", client.config.settings, { python = { pythonPath = venv_python } })
                end
                client.notify("workspace/didChangeConfiguration", { settings = nil })
            end
        end

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
            changed_venv_hooks = { basedpyright_hook, selector.hooks.pyright }
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

local M = {}

function M.activated_venv()
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

function M.basedpyright_hook(_, venv_python)
	local client = (vim.lsp.get_clients or vim.lsp.get_active_clients)({ name = "basedpyright" })[1]
	if not client then
		return
	else
		if client.settings then
			client.settings =
				vim.tbl_deep_extend("force", client.settings, { basedpyright = { pythonPath = venv_python } })
		else
			client.config.settings =
				vim.tbl_deep_extend("force", client.config.settings, { python = { pythonPath = venv_python } })
		end
		client.notify("workspace/didChangeConfiguration", { settings = nil })
	end
end

return M

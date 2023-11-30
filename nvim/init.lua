if vim.g.vscode then
	require("yuhsienchiang.core.options")
	-- require("yuhsienchiang.core.keymaps")
else
	local theme_name = "catppuccin"

	require("yuhsienchiang.lazy")
	require("yuhsienchiang.core")

	local theme_status, theme = pcall(require, "yuhsienchiang.plugins.theme." .. theme_name)
	if theme_status then
		vim.cmd.colorscheme(theme_name)
	else
		print("theme not found")
	end
end

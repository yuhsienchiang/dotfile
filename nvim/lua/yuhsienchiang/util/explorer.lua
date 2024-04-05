local tree_api = require("nvim-tree.api")

local M = {}

function M.cd_up()
	tree_api.tree.change_root_to_parent()
	vim.api.nvim_command("tcd " .. ".")
	vim.notify(vim.fn.getcwd(), vim.log.levels.INFO, { title = "NvimTree: Change Directory" })
end

function M.cd_down()
	local node_under_cursor = tree_api.tree.get_node_under_cursor()
	if node_under_cursor.absolute_path == nil and node_under_cursor.name == ".." then
		M.cd_up()
	elseif not (node_under_cursor.absolute_path == nil) and node_under_cursor.type == "directory" then
		-- go to child
		tree_api.tree.change_root_to_node(node_under_cursor)
		vim.api.nvim_command("tcd " .. ".")
		vim.notify(vim.fn.getcwd(), vim.log.levels.INFO, { title = "NvimTree: Change Directory" })
	else
		return
	end
end

return M

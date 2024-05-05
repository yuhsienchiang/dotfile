local tree_api = require("nvim-tree.api")

local M = {}

function M.cd_up()
	tree_api.tree.change_root_to_parent()
	vim.api.nvim_command("tcd " .. ".")
	local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
	vim.notify(" " .. cwd, vim.log.levels.INFO, { title = "NvimTree", render = "compact" })
end

function M.cd_down()
	local node_under_cursor = tree_api.tree.get_node_under_cursor()
	if node_under_cursor.absolute_path == nil and node_under_cursor.name == ".." then
		M.cd_up()
	elseif not (node_under_cursor.absolute_path == nil) and node_under_cursor.type == "directory" then
		-- go to child
		tree_api.tree.change_root_to_node(node_under_cursor)
		vim.api.nvim_command("tcd " .. ".")
		local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
		vim.notify(" " .. cwd, vim.log.levels.INFO, { title = "NvimTree", render = "compact" })
	else
		return
	end
end

local nvim_view_handler = function(style)
	if style == "float" then
		local WIDTH_RATIO = 0.4
		local HEIGHT_RATIO = 0.6
		Float = {
			enable = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
				return {
					border = "single",
					relative = "editor",
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
			end,
		}
		Width = function()
			return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
		end
	else
		Float = { enable = false }
		Width = 35
	end
	require("nvim-tree.view").View.float = Float
	require("nvim-tree.view").View.width = Width
end

function M.nvim_tree_toggle(style)
	nvim_view_handler(style)
	tree_api.tree.toggle({ find_file = true, focus = true })
end

function M.nvim_tree_focus(style)
	nvim_view_handler(style)
	tree_api.tree.open()
end

function M.nvim_tree_find_file(style)
	nvim_view_handler(style)
	tree_api.tree.find_file({ open = true, focus = true })
end

return M

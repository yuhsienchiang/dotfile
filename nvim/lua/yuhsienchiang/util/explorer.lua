local tree_api = require("nvim-tree.api")
-- local view = require("nvim-tree.view")
-- local utils = require("nvim-tree.utils")

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

-- local nvim_view_handler = function(style)
-- 	if style == "float" then
-- 		local WIDTH_RATIO = 0.4
-- 		local HEIGHT_RATIO = 0.6
-- 		Float = {
-- 			enable = true,
-- 			quit_on_focus_loss = true,
-- 			open_win_config = function()
-- 				local screen_w = vim.opt.columns:get()
-- 				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
-- 				local window_w = screen_w * WIDTH_RATIO
-- 				local window_h = screen_h * HEIGHT_RATIO
-- 				local window_w_int = math.floor(window_w)
-- 				local window_h_int = math.floor(window_h)
-- 				local center_x = (screen_w - window_w) / 2
-- 				local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
-- 				return {
-- 					border = "single",
-- 					relative = "editor",
-- 					row = center_y,
-- 					col = center_x,
-- 					width = window_w_int,
-- 					height = window_h_int,
-- 				}
-- 			end,
-- 		}
-- 		Width = function()
-- 			return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
-- 		end
-- 	else
-- 		Float = { enable = false, side = style }
-- 		Width = 35
-- 	end
-- 	view.View.float = Float
-- 	view.View.width = Width
-- end
--
-- local nvim_tree_toggle = function(style)
-- 	nvim_view_handler(style)
-- 	tree_api.tree.toggle({ find_file = true, focus = true })
-- end
--
-- local nvim_tree_focus = function(style)
-- 	nvim_view_handler(style)
-- 	tree_api.tree.open()
-- end
--
-- local nvim_tree_find_file = function(style)
-- 	nvim_view_handler(style)
-- 	tree_api.tree.find_file({ open = true, focus = true })
-- end
--
-- function M.custom_setup()
-- 	vim.api.nvim_create_autocmd("WinLeave", {
-- 		group = vim.api.nvim_create_augroup("NvimTree", { clear = false }),
-- 		pattern = "NvimTree_*",
-- 		callback = function()
-- 			if utils.is_nvim_tree_buf(0) and view.View.float.enable then
-- 				view.close()
-- 			end
-- 		end,
-- 	})
--
-- 	vim.api.nvim_create_user_command("TreeToggle", function()
-- 		nvim_tree_toggle("left")
-- 	end, { desc = "nvim-tree: toggle", bar = true })
--
-- 	vim.api.nvim_create_user_command("TreeFocus", function()
-- 		nvim_tree_focus("left")
-- 	end, { desc = "nvim-tree: focus", bar = true })
--
-- 	vim.api.nvim_create_user_command("TreeFindFile", function()
-- 		nvim_tree_find_file("left")
-- 	end, { desc = "nvim-tree: find file", bar = true })
--
-- 	vim.api.nvim_create_user_command("TreeToggleFloat", function()
-- 		nvim_tree_toggle("float")
-- 	end, { desc = "nvim-tree: toggle float", bar = true })
--
-- 	vim.api.nvim_create_user_command("TreeFocusFloat", function()
-- 		nvim_tree_focus("float")
-- 	end, { desc = "nvim-tree: focus float", bar = true })
--
-- 	vim.api.nvim_create_user_command("TreeFindFileFloat", function()
-- 		nvim_tree_find_file("float")
-- 	end, { desc = "nvim-tree: find file float", bar = true })
-- end

return M

local M = {}

function M.cd_up()
    local tree_api = require("nvim-tree.api")

    tree_api.tree.change_root_to_parent()
    vim.api.nvim_command("tcd " .. ".")
    local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
    vim.notify(" " .. cwd, vim.log.levels.INFO, { title = "NvimTree", render = "compact" })
end

function M.cd_down()
    local tree_api = require("nvim-tree.api")

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

return M

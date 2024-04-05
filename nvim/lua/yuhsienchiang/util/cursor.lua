local M = {}

function M.smart_cursor()
    local cursor_position = vim.api.nvim_win_get_cursor(0)
    local current_line_string = vim.api.nvim_get_current_line():sub(0, cursor_position[2])
    local start_idx, _ = string.find(current_line_string, "%S")
    if start_idx == nil then
        vim.api.nvim_win_set_cursor(0, { cursor_position[1], 0 })
    else
        vim.api.nvim_win_set_cursor(0, { cursor_position[1], start_idx - 1 })
    end
end

return M

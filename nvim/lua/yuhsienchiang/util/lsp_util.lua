local M = {}

M.hover_signature_scroll_forward = function()
    if not require("noice.lsp").scroll(2) then
        return "<c-f>"
    end
end

M.hover_signature_scroll_backward = function()
    if not require("noice.lsp").scroll(-2) then
        return "<c-b>"
    end
end

M.diagnostic_alert = function()
    local symbols = {
        error = "󰅙",
        warn = "",
        info = "",
        hint = "󰠠",
        clear = "",
    }

    local hi = {
        error = "DiagnosticIndicateError",
        warn = "DiagnosticIndicateWarn",
        info = "DiagnosticIndicateInfo",
        hint = "DiagnosticIndicateHint",
        clear = "DiagnosticIndicateOK",
    }

    local result = {}
    for _, name in ipairs({ "error", "warn", "info", "hint", "clear" }) do
        result[name] = "%#" .. hi[name] .. "#" .. symbols[name]
    end

    if (vim.diagnostic.count(0)[1] or 0) > 0 then
        return result.error
    elseif (vim.diagnostic.count(0)[2] or 0) > 0 then
        return result.warn
    elseif (vim.diagnostic.count(0)[3] or 0) > 0 then
        return result.info
    elseif (vim.diagnostic.count(0)[4] or 0) > 0 then
        return result.hint
    else
        return result.clear
    end
end

local function buf_to_win(bufnr)
    local current_win = vim.fn.win_getid()

    -- Check if current window has the buffer
    if vim.fn.winbufnr(current_win) == bufnr then
        return current_win
    end

    -- Otherwise, find a visible window with this buffer
    local win_ids = vim.fn.win_findbuf(bufnr)
    local current_tabpage = vim.fn.tabpagenr()

    for _, win_id in ipairs(win_ids) do
        if vim.fn.win_id2tabwin(win_id)[1] == current_tabpage then
            return win_id
        end
    end

    return current_win
end

-- Split a string into multiple lines, each no longer than max_width
-- The split will only occur on spaces to preserve readability
local function split_line(str, max_width)
    if #str <= max_width then
        return { str }
    end

    local lines = {}
    local current_line = ""

    for word in string.gmatch(str, "%S+") do
        -- If adding this word would exceed max_width
        if #current_line + #word + 1 > max_width then
            -- Add the current line to our results
            table.insert(lines, current_line)
            current_line = word
        else
            -- Add word to the current line with a space if needed
            if current_line ~= "" then
                current_line = current_line .. " " .. word
            else
                current_line = word
            end
        end
    end

    -- Don't forget the last line
    if current_line ~= "" then
        table.insert(lines, current_line)
    end

    return lines
end

local function virtual_lines_format(diagnostic)
    local win = buf_to_win(diagnostic.bufnr)
    local sign_column_width = vim.fn.getwininfo(win)[1].textoff
    local text_area_width = vim.api.nvim_win_get_width(win) - sign_column_width
    local center_width = 5
    local left_width = 1

    local lines = {}
    for msg_line in diagnostic.message:gmatch("([^\n]+)") do
        local max_width = text_area_width - diagnostic.col - center_width - left_width
        vim.list_extend(lines, split_line(msg_line, max_width))
    end

    return table.concat(lines, "\n")
end

M.diagnostic_info_toggle = function()
    local current_virtual_text = type(vim.diagnostic.config().virtual_text) == "table"

    local message = "Diagnostic: "
    if current_virtual_text then
        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = { format = virtual_lines_format },
            severity_sort = true
        })

        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = { format = virtual_lines_format },
            severity_sort = true
        }, neotest_ns)




        message = message .. "Line"
    else
        vim.diagnostic.config({
            virtual_text = { prefix = "  ", source = "if_many" },
            virtual_lines = false,
            severity_sort = true
        })


        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_text = {
                prefix = "  ",
                format = function(diagnostic)
                    -- Replace newline and tab characters with space for more compact diagnostics
                    local diagnostic_message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                    return diagnostic_message
                end,
                source ="if_many",
            },
            virtual_lines = false,
            severity_sort = true
        }, neotest_ns)

        message = message .. "Text"
    end
    require("snacks").notifier.notify(message, vim.log.levels.INFO, { title = "Diagnostic Info", style = "compact" })
end

return M

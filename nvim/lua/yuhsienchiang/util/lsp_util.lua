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
        error = "",
        warn = "",
        info = "",
        hint = "",
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

return M

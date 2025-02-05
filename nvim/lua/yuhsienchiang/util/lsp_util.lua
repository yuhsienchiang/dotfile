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

return M

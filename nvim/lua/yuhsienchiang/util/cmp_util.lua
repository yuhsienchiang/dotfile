local M = {}

M.source_name = {
    buffer   = "Buffer",
    nvim_lsp = "LSP",
    luasnip  = "LuaSnip",
    path     = "Path",
    nvim_lua = "NvimLua",
}

M.abbreviateString = function(str, maxwidth, ellipsis_char)
    if vim.fn.strchars(str) > maxwidth then
        str = vim.fn.strcharpart(str, 0, maxwidth) .. (ellipsis_char ~= nil and ellipsis_char or "")
    end
    return str
end

return M

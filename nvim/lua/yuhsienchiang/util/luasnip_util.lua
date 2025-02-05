local M = {}

function M.active(filter)
    local luasnip = require("luasnip")

    filter = filter or {}
    filter.direction = filter.direction or 1

    if filter.direction == 1 then
        return luasnip.expand_or_jumpable()
    else
        return luasnip.jumpable(filter.direction)
    end
end

function M.jump(direction)
    local luasnip = require("luasnip")
    if direction == 1 then
        if luasnip.expandable() then
            return luasnip.expand_or_jump()
        else
            return luasnip.jumpable(1) and luasnip.jump(1)
        end
    else
        return luasnip.jumpable(-1) and luasnip.jump(-1)
    end
end

function M.expand(snippet)
    local luasnip = require("luasnip")

    luasnip.lsp_expand(snippet)
end

return M

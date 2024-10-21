return {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    config = function()
        require("luasnip").setup({
            keep_roots = true,
            link_roots = true,
            link_children = true,
            exit_roots = false,
            update_events = { "TextChanged", "TextChangedI" },
        })
    end,
}

return {
    "L3MON4D3/LuaSnip",
    version = "*",
    build = "make install_jsregexp",
    opts = {
        keep_roots = true,
        link_roots = true,
        link_children = true,
        exit_roots = false,
        updateevents = "TextChanged,TextChangedI",
    },
}

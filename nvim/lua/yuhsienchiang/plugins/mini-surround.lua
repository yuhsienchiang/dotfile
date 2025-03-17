return {
    "echasnovski/mini.surround",
    version = false,
    keys = {
        { "ga", desc = "Add Surroundin", mode = { "n", "v" } },
        { "gd", desc = "Delete Surrounding" },
        { "gr", desc = "Replace Surrounding" },
        { "gh", desc = "Highlight Surrounding" },
        { "gf", desc = "Find surround to Right" }, -- Highlight surrounding
        { "gF", desc = "Find surround to Left" }, -- Highlight surrounding
    },
    opts = {
        highlight_duration = 1000,
        mappings = {
            add = "ga", -- Add surrounding in Normal and Visual modes
            delete = "gd", -- Delete surrounding
            find = "gf", -- Find surrounding (to the right)
            find_left = "gF", -- Find surrounding (to the left)
            highlight = "gh", -- Highlight surrounding
            replace = "gr", -- Replace surrounding
            update_n_lines = "gn", -- Update `n_lines`
        },
    },
}

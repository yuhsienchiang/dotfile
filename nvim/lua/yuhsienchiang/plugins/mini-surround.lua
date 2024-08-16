return {
    "echasnovski/mini.surround",
    version = false,
    keys = {
        { "<leader>aa", desc = "Add Surrounding", mode = { "n", "v" } },
        { "<leader>ad", desc = "Delete Surrounding" },
        { "<leader>ar", desc = "Replace Surrounding" },
    },
    opts = {
        mappings = {
            add = "<leader>aa", -- Add surrounding in Normal and Visual modes
            delete = "<leader>ad", -- Delete surrounding
            replace = "<leader>ar", -- Replace surrounding
            find = "<leader>af", -- Find surrounding (to the right)
            find_left = "<leader>aF", -- Find surrounding (to the left)
            highlight = "<leader>ah", -- Highlight surrounding
            update_n_lines = "<leader>an", -- Update `n_lines`
        },
    },
}

return {
    "lewis6991/gitsigns.nvim",
    event = { "BufNewFile", "BufReadPost" },
    opts = {
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = " " },
            topdelete = { text = " " },
            changedelete = { text = "~ " },
            untracked = { text = "▎" },
        },
        signs_staged = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = " " },
            topdelete = { text = " " },
            changedelete = { text = "~ " },
            untracked = { text = "▎" },
        },
        attach_to_untracked = true,
    },
}

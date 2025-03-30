return {
    "rachartier/tiny-inline-diagnostic.nvim",
    enabled = false,
    priority = 1000,
    config = function()
        require("tiny-inline-diagnostic").setup({
            preset = "classic",
            signs = {
                left = "",
                right = "",
                diag = "● ",
                arrow = "    ",
                up_arrow = "    ",
                vertical = " │",
                vertical_end = " └",
            },
            blend = { factor = 0.22 },
            options = {
                show_source = true,
                throttle = 5,
                show_all_diags_on_cursorline = true,
                multilines = {
                    enabled = true,
                    always_show = true,
                },
            },
        })
    end,
}

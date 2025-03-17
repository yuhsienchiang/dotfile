return {
    "MeanderingProgrammer/render-markdown.nvim",
    cmd = "RenderMarkdown",
    ft = { "markdown", "md", "Avante" },
    opts = {
        file_types = { "markdown", "md", "Avante" },
        render_modes = { "n", "c", "t", "i" },
        heading = {
            sign = true,
            border = true,
            width = "block",
            above = " ",
            below = "━",
            left_pad = 0,
            right_pad = 2,
            position = "left",
            icons = {
                "█ ",
                "██ ",
                "███ ",
                "████ ",
                "█████ ",
                "██████ ",
            },
        },
    },
}

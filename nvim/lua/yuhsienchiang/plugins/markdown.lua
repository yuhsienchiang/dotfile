return {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown",
    cmd = { "RenderMarkdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
        enabled = false,
        max_file_size = 1.5,
        file_types = { "markdown" },
        render_modes = { "n", "c" },
        latex = { enabled = false },
    },
}

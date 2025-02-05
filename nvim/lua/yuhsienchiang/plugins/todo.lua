return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        signs = false,
        keywords = {
            FIX = {
                color = "error",
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
                signs = false,
            },
            TODO = { signs = false, color = "info" },
            HACK = { signs = false, color = "warning" },
            WARN = { signs = false, color = "warning", alt = { "WARNING", "XXX" } },
            PERF = { signs = false, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { signs = false, color = "hint", alt = { "INFO" } },
            TEST = { signs = false, color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
            QUESTION = { signs = false, color = "warning" },
        },
        merge_keywords = true,
    },
}

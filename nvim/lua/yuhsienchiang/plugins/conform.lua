return {
    "stevearc/conform.nvim",
    lazy = true,
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                html = { "prettier" },
                css = { "prettier" },
                javascript = { "prettier" },
                ymal = { "prettier" },
                markdown = { "prettier" },
                json = { "prettier" },
            },
            notify_on_error = true,
        })
    end,
}

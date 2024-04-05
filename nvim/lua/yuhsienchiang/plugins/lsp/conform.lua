return {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    keys = {
        {
            "<leader>ef",
        function()
                require("conform").format({ lsp_fallback = true, timeout_ms = 3000 })
            end,
            mode = { "n", "v" },
            desc = "Format",
        },
    },
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

return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufNewFile", "BufReadPost" },
    config = function()
        require("ibl").setup({
            enabled = true,
            indent = { char = "▏", tab_char = "▏", smart_indent_cap = true },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    "dashboard",
                    "gitcommit",
                    "help",
                    "lazy",
                    "markdown",
                    "mason",
                    "notify",
                    "NvimTree",
                    "TelescopePrompt",
                    "TelescopeResults",
                    "markdown",
                },
                buftypes = {
                    "nofile",
                    "prompt",
                    "quickfix",
                    "terminal",
                },
            },
        })
    end,
}

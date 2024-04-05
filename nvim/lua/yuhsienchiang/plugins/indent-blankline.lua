return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufNewFile", "BufReadPost" },
    init = function()
        vim.opt.list = true
        vim.opt.listchars:append("eol:↴")
        vim.opt.listchars:append("space: ")
    end,
    config = function()
        require("ibl").setup({
            enabled = true,
            indent = { char = "▏", tab_char = "▏", smart_indent_cap = true },
            scope = {
                enabled = false,
            },
            exclude = {
                filetypes = {
                    "alpha",
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

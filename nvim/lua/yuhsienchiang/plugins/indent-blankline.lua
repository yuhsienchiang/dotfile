return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufNewFile", "BufReadPost" },
    config = function()
        local hooks = require("ibl.hooks")
        hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

        require("ibl").setup({
            enabled = true,
            indent = { char = "▏", tab_char = "▏", smart_indent_cap = true },
            scope = { char = "▏", show_start = false, show_end = false },
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

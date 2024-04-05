return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },

    {
        "onsails/lspkind.nvim",
        lazy = true,
    },

    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        config = function()
            require("nvim-web-devicons").setup({
                override = {
                    toml = { icon = "" }
                }
            })
        end,
    },
}

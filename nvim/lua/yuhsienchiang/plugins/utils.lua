return {
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        opts = {
            override = {
                toml = { icon = "" },
            },
        },
    },
    { "MunifTanjim/nui.nvim", lazy = true },
    { "nvim-lua/plenary.nvim", lazy = true },
    { "onsails/lspkind.nvim", lazy = true },
}

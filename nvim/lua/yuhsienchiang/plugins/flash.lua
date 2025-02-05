return {
    "folke/flash.nvim",
    lazy = true,
    opts = {
        search = { multi_window = true },
        label = {
            rainbow = { enabled = true, shade = 2 },
        },
        modes = {
            search = {
                enabled = true,
                highlight = { backdrop = true },
            },
            treesitter = {
                label = { before = true, after = true, style = "overlay" },
            },
        },
        prompt = {
            enabled = true,
            prefix = { { "󱐋 ", "FlashPromptIcon" } },
        },
    },
}

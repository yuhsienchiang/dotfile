return {
    "folke/flash.nvim",
    lazy = true,
    opts = {
        search = { multi_window = false },
        modes = {
            search = {
                enabled = true,
                highlight = { backdrop = true },
            },
        },
        prompt = {
            enabled = true,
            prefix = { { "󱐋 ", "FlashPromptIcon" } },
        },
    },
}

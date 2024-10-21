return {
    "OXY2DEV/markview.nvim",
    ft = "markdown", -- If you decide to lazy-load anyway
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local presets = require("markview.presets")
        require("markview").setup({
            highlight_groups = { "dynamic" },
            hybrid_modes = { "i", "n"},
            modes = { "n", "no", "c", "i" },

            checkboxes = presets.checkboxes.nerd,
        })
    end,
}

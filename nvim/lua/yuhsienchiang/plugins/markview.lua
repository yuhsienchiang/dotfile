return {
    "OXY2DEV/markview.nvim",
    ft = { "markdown" },
    cmd = "Markview",
    -- dependencies = {
    --     "nvim-treesitter/nvim-treesitter",
    --     "nvim-tree/nvim-web-devicons",
    -- },
    opts = function()
        return {
            highlight_groups = { "dynamic" },
            hybrid_modes = { "i", "n" },
            modes = { "n", "no", "c", "i" },
            checkboxes = {
                enable = true,
                checked = {
                    text = "",
                    hl = "MarkviewCheckboxChecked",
                    scope_hl = "MarkviewCheckboxStriked",
                },
                unchecked = {
                    text = "",
                    hl = "MarkviewCheckboxUnchecked",
                },
                custom = {
                    {
                        match_string = "-",
                        text = "",
                        hl = "MarkviewCheckboxPending",
                    },
                    {
                        match_string = "~",
                        text = "",
                        hl = "MarkviewCheckboxProgress",
                    },
                    {
                        match_string = "o",
                        text = "",
                        hl = "MarkviewCheckboxCancelled",
                    },
                },
            },
        }
    end,
    -- config = function()
    --     local presets = require("markview.presets")
    --     require("markview").setup({
    --         highlight_groups = { "dynamic" },
    --         hybrid_modes = { "i", "n" },
    --         modes = { "n", "no", "c", "i" },
    --
    --         checkboxes = presets.checkboxes.nerd,
    --     })
    -- end,
}

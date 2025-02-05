local theme = "catppuccin"

return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            if theme == "catppuccin" then
                require("yuhsienchiang.plugins.themes.catppuccin").setup("frappe")
            end
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            if theme == "tokyonight" then
                require("yuhsienchiang.plugins.themes.tokyonight").setup("moon")
            end
        end,
    },
}

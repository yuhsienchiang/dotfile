local theme = "catppuccin"

return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            if theme == "catppuccin" then
                require("yuhsienchiang.plugins.themes.catppuccin").setup("mocha")
            end
        end,
    },
    {
        "sam4llis/nvim-tundra",
        lazy = true,
        priority = 1000,
        config = function()
            if theme == "tundra" then
                require("yuhsienchiang.plugins.themes.tundra").setup()
            end
        end,
    },
    {
        "diegoulloao/neofusion.nvim",
        lazy = true,
        priority = 1000,
        config = function ()
            if theme == "neofusion" then
                require("yuhsienchiang.plugins.themes.neofusion").setup()
            end
        end,
    },
}

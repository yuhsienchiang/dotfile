local theme = "catppuccin"

return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            if theme == "catppuccin" then
                require("yuhsienchiang.configs.catppuccin").setup("mocha")
            end
        end,
    },
    {
        "sam4llis/nvim-tundra",
        lazy = true,
        priority = 1000,
        config = function()
            if theme == "tundra" then
                require("yuhsienchiang.configs.tundra").setup()
            end
        end,
    },
}

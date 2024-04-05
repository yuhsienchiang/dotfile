return {
    "nvimdev/lspsaga.nvim",
    event = { "LspAttach" },
    lazy = true,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("lspsaga").setup({
            ui = {
                border = "single",
                devicon = true,
                winblend = 10,
                expand = " ",
                collapse = " ",
                kind = {},
                imp_sign = "󰳛",
                code_action = "󰌵",
            },
            -- keybinds for navigation in lspsaga window
            scroll_preview = {
                scroll_down = "<C-n>",
                scroll_up = "<C-p>",
            },
            -- use enter to open file with definition preview
            definition = {
                keys = {
                    edit = "<C-i>", -- open the file
                    vsplit = "<C-v>",
                    split = "<C-s>",
                    tabnew = "<C-t>",
                    quit = "q", -- close when focusing the window
                    close = "<C-q>", -- close even if not focusing the window
                },
            },
            finder = {
                default = "def+ref+imp",
                layout = "float",
                silent = false,
                keys = {
                    shuttle = "<TAB>",
                    toggle_or_open = "<CR>",
                    vsplit = "<C-v>",
                    split = "<C-s>",
                    tabnew = "<C-t>",
                    quit = "q",
                    close = "<C-q>",
                },
            },
            symbol_in_winbar = { enable = false, },
            outline = { enable = false },
            lightbulb = { enable = false },
            implement = { enable = false },
            beacon = { enable = false },
        })
    end,
}

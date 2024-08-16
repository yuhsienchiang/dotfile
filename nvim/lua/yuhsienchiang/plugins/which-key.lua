return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 500,
        spec = {
            { "<leader>a", mode = { "n", "v" }, group = "Surround" },
            { "<leader>b", mode = "n", group = "Buffer" },
            { "<leader>d", mode = "n", group = "Lsp" },
            { "<leader>e", mode = { "n", "v" }, group = "Edit" },
            { "<leader>ej", mode = { "n", "v" }, desc = "Incrimental Select +" },
            { "<leader>ek", mode = { "n", "v" }, desc = "Incrimental Select -" },
            { "<leader>f", mode = "n", group = "Telescope" },
            { "<leader>g", mode = { "n", "v" }, group = "Git" },
            { "<leader>gd", mode = "n", group = "Diffview" },
            { "<leader>gh", mode = { "n", "v" }, group = "Gitsigns" },
            { "<leader>gl", mode = "n", group = "LazyGit" },
            { "<leader>gg", mode = "n", group = "GitGraph" },
            { "<leader>h", mode = "n", group = "Harpoon" },
            { "<leader>m", mode = "n", group = "Markdown" },
            { "<leader>n", mode = "n", group = "TODO" },
            { "<leader>q", mode = "n", group = "Quit" },
            { "<leader>s", mode = "n", group = "NvimTree" },
            { "<leader>t", mode = "n", group = "Tab" },
            { "<leader>v", mode = "n", group = "VenvSelect" },
            { "<leader>w", mode = "n", group = "Window" },
        },
        notify = true,
        plugins = {
            marks = false,
            registers = true,
            spelling = { enabled = false },
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = false,
                nav = false,
                z = true,
                g = true,
            },
        },
        expand = 0, -- expand groups when <= n mappings
        keys = {
            scroll_down = "<c-j>", -- binding to scroll down inside the popup
            scroll_up = "<c-k>", -- binding to scroll up inside the popup
        },
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "  ", -- symbol used between a key and it's label
            group = "  ", -- symbol prepended to a group
            rules = false,
        },
        win = {
            border = "rounded",
            padding = { 1, 1 }, -- extra window padding [top/bottom, right/left]
        },
        replace = {
            key = {
                { "<Space>", "SPC" },
                { "<space>", "SPC" },
                { "<cr>", "RETURN" },
                { "<tab>", "TAB" },
                { "<Down>", "" },
                { "<Left>", "" },
                { "<Right>", "" },
                { "<Up>", "" },
            },
        },
        show_help = false,
        show_keys = false, -- show the currently pressed key and its label as a message in the command line
    },
}

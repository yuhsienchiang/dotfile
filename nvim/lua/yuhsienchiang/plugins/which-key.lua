return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 800,
        filter = function(mapping) return mapping.desc and mapping.desc ~= "" end,
        -- stylua: ignore
        spec = {
            { "<leader>a",  mode = { "n", "v" }, group = "Avante" },
            { "<leader>b",  mode = "n",          group = "Buffer" },
            { "<leader>c",  mode = "n",          group = "Copilot" },
            { "<leader>d",  mode = "n",          group = "Lsp" },
            { "<leader>e",  mode = { "n", "v" }, group = "Edit" },
            { "<leader>f",  mode = "n",          group = "Fzf" },
            { "<leader>g",  mode = { "n", "v" }, group = "Git" },
            { "<leader>gd", mode = "n",          group = "Diffview" },
            { "<leader>gh", mode = { "n", "v" }, group = "Gitsigns" },
            { "<leader>H",  mode = "n",          group = "Harpoon" },
            { "<leader>m",  mode = "n",          group = "Markdown" },
            { "<leader>n",  mode = "n",          group = "TODO" },
            { "<leader>q",  mode = "n",          group = "Quit" },
            { "<leader>s",  mode = "n",          group = "NvimTree" },
            { "<leader>t",  mode = "n",          group = "Tab" },
            { "<leader>u",  mode = "n",          group = "Dev" },
            { "<leader>ud", mode = "n",          group = "Debug" },
            { "<leader>ut", mode = "n",          group = "Test" },
            { "<leader>v",  mode = "n",          group = "VenvSelect" },
            { "<leader>w",  mode = "n",          group = "Window" },
        },
        notify = true,
        plugins = {
            marks = false,
            registers = true,
            spelling = { enabled = false },
            presets = {
                operators = false,
                motions = false,
                text_objects = true,
                windows = false,
                nav = false,
                z = true,
                g = true,
            },
        },
        expand = 0,
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "  ", -- symbol used between a key and it's label
            group = "  ", -- symbol prepended to a group
            rules = false,
        },
        win = {
            border = "single",
            width = { min = 10 },
            -- padding = { 1, 5 }, -- extra window padding [top/bottom, right/left]
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

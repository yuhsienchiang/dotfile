return {
    "stevearc/oil.nvim",
    cmd = "Oil",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
        local max_width = math.floor(vim.o.columns * 0.6)
        local max_height = math.floor(vim.o.lines * 0.6)
        return {
            default_file_explorer = true,
            delete_to_trash = true,
            watch_for_changes = true,
            use_default_keymaps = false,
            -- stylua: ignore
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split", },
                ["<C-s>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split", },
                ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = { "actions.close", mode = "n" },
                ["<C-l>"] = "actions.refresh",
                ["{"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["~"] = { "actions.cd", mode = "n", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
            },
            view_options = { show_hidden = true },
            win_options = {
                signcolumn = "no",
                number = false,
                relativenumber = false,
            },
            git = {
                -- Return true to automatically git add/mv/rm files
                add = function(_) return false end,
                mv = function(_, _) return true end,
                rm = function(_) return true end,
            },
            float = {
                padding = 2,
                border = "single",
                max_width = max_width,
                max_height = max_height,
                win_options = {
                    winhighlight = "Normal:OilPmenu,CursorLine:OilSel,FloatBorder:OilBorder",
                    winblend = 0,
                },
            },
            ssh = { border = "single" },
            keymaps_help = { border = "single" },
        }
    end,
}

return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    dependencies = { "folke/todo-comments.nvim" },
    opts = {
        auto_preview = false, -- automatically open preview when on an item
        focus = true, -- Focus the window when opened
        restore = true, -- restores the last location in the list when opening
        follow = false, -- Follow the current item
        -- indent_guides = false, -- show indent guides
        open_no_results = false, -- open the trouble window when there are no results
        keys = {
            ["?"] = "help",
            r = "refresh",
            R = "toggle_refresh",
            q = "close",
            ["<esc>"] = "cancel",
            ["<cr>"] = "jump",
            ["<c-s>"] = "jump_split",
            ["<c-v>"] = "jump_vsplit",
        },
        modes = {
            lsp_base = {
                params = {
                    include_current = true,
                },
            },
            lsp_definitions = {
                mode = "lsp_definitions",
                auto_jump = false,
                auto_preview = false,
                preview = {
                    type = "split",
                    relative = "win",
                    position = "right",
                    size = 0.5,
                },
            },
            lsp_references = {
                mode = "lsp_references",
                auto_jump = false,
                auto_preview = false,
                preview = {
                    type = "split",
                    relative = "win",
                    position = "right",
                    size = 0.5,
                },
            },
            symbols = {
                model = "symbols",
                auto_jump = false,
                auto_preview = false,
                focus = false,
                win = {
                    position = "right",
                    size = { width = 0.2 },
                    padding = { 0, 0 },
                },
            },
        },
    },
}

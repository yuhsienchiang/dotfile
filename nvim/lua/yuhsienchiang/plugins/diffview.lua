return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    config = function()
        local actions = require("diffview.actions")
        require("diffview").setup({
            enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
            view = {
                -- Configure the layout and behavior of different types of views.
                -- Available layouts:
                --  'diff1_plain'
                --    |'diff2_horizontal'
                --    |'diff2_vertical'
                --    |'diff3_horizontal'
                --    |'diff3_vertical'
                --    |'diff3_mixed'
                --    |'diff4_mixed'
                -- For more info, see ':h diffview-config-view.x.layout'.
                merge_tool = {
                    -- Config for conflicted files in diff views during a merge or rebase.
                    layout = "diff3_mixed",
                    disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
                    winbar_info = true, -- See ':h diffview-config-view.x.winbar_info'
                },
            },
            -- stylua: ignore
            keymaps = {
                disable_defaults = false, -- Disable the default keymaps
                view = {
                    { "n", "<tab>",       actions.select_next_entry,             { desc = "Open the diff for the next file" } },
                    { "n", "<s-tab>",     actions.select_prev_entry,             { desc = "Open the diff for the previous file" } },
                    { "n", "gf",          actions.goto_file_edit,                { desc = "Open the file in the previous tabpage" } },
                    { "n", "<C-w><C-f>",  actions.goto_file_split,               { desc = "Open the file in a new split" } },
                    { "n", "<C-w>gf",     actions.goto_file_tab,                 { desc = "Open the file in a new tabpage" } },
                    { "n", "<leader>gdo", actions.conflict_choose("ours"),       { desc = "Choose the OURS version of a conflict" } },
                    { "n", "<leader>gdt", actions.conflict_choose("theirs"),     { desc = "Choose the THEIRS version of a conflict" } },
                    { "n", "<leader>gdb", actions.conflict_choose("base"),       { desc = "Choose the BASE version of a conflict" } },
                    { "n", "<leader>gda", actions.conflict_choose("all"),        { desc = "Choose all the versions of a conflict" } },
                    { "n", "<leader>gdx", actions.conflict_choose("none"),       { desc = "Delete the conflict region" } },
                    { "n", "<leader>gdO", actions.conflict_choose_all("ours"),   { desc = "Choose the OURS version of a conflict for the whole file" } },
                    { "n", "<leader>gdT", actions.conflict_choose_all("theirs"), { desc = "Choose the THEIRS version of a conflict for the whole file" } },
                    { "n", "<leader>gdB", actions.conflict_choose_all("base"),   { desc = "Choose the BASE version of a conflict for the whole file" } },
                    { "n", "<leader>gdA", actions.conflict_choose_all("all"),    { desc = "Choose all the versions of a conflict for the whole file" } },
                    { "n", "<leader>gdX", actions.conflict_choose_all("none"),   { desc = "Delete the conflict region for the whole file" } },
                },
                diff2 = {
                    -- Mappings in 2-way diff layouts
                    { "n", "g?", actions.help({ "view", "diff2" }), { desc = "Open the help panel" } },
                },
                diff3 = {
                    -- Mappings in 3-way diff layouts
                    { { "n", "x" }, "<leader>gd2", actions.diffget("ours"),           { desc = "Obtain the diff hunk from the OURS version of the file" } },
                    { { "n", "x" }, "<leader>gd3", actions.diffget("theirs"),         { desc = "Obtain the diff hunk from the THEIRS version of the file" } },
                    { "n",          "g?",          actions.help({ "view", "diff3" }), { desc = "Open the help panel" } },
                },
                diff4 = {
                    -- Mappings in 4-way diff layouts
                    { { "n", "x" }, "<leader>gd1", actions.diffget("base"),           { desc = "Obtain the diff hunk from the BASE version of the file" } },
                    { { "n", "x" }, "<leader>gd2", actions.diffget("ours"),           { desc = "Obtain the diff hunk from the OURS version of the file" } },
                    { { "n", "x" }, "<leader>gd3", actions.diffget("theirs"),         { desc = "Obtain the diff hunk from the THEIRS version of the file" } },
                    { "n",          "g?",          actions.help({ "view", "diff4" }), { desc = "Open the help panel" } },
                },
            },
        })
    end,
}

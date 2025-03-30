return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        -- neotest setup
        local neotest = require("neotest")
        neotest.setup({
            output = { enabled = true, open_on_run = false },
            output_panel = {
                enabled = true,
                open = function()
                    return vim.api.nvim_open_win(0, false, { split = "below", height = math.floor(vim.o.lines * 0.4), style = "minimal" })
                end,
            },
            floating = { border = "single" },
            summary = {
                enabled = true,
                open = function()
                    return vim.api.nvim_open_win(0, false, { split = "right", width = math.floor(vim.o.columns * 0.2), style = "minimal" })
                end,
            },
            icons = {
                expanded = "┐",
                failed = "",
                final_child_prefix = "└",
                non_collapsible = "─",
                notify = "󱈸",
                passed = "",
                running = "󰓦",
                skipped = "󰓨",
                unknown = "",
                watching = "󰛐",
            },
            adapters = {
                require("neotest-python")({
                    dap = { justMyCode = false },
                    args = { "--no-header", "-vv", "-ra", "--tb=long", "--lf" },
                    runner = "pytest",
                }),
            },
        })

        -- neotest diagnostics
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_text = {
                prefix = "  ",
                format = function(diagnostic)
                    -- Replace newline and tab characters with space for more compact diagnostics
                    local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                    return message
                end,
            },
            virtual_lines = { current_line = true },
        }, neotest_ns)

        -- keymaps
        local Util = require("yuhsienchiang.util.neotest_util")
        vim.keymap.set("n", "<leader>utt", function() Util.run({}, true) end,                              { desc = "Run nearest test", silent = true, noremap = true })
        vim.keymap.set("n", "<leader>utd", function() Util.run_dap({}, true) end,                          { desc = "Run test debug", silent = true, noremap = true })
        vim.keymap.set("n", "<leader>utT", function() Util.run(vim.fn.expand("%"), true) end,              { desc = "Run current file tests", silent = true, noremap = true })
        vim.keymap.set("n", "<leader>uta", function() Util.run({ suite = true }, true) end,                { desc = "Run all tests", silent = true, noremap = true })
        vim.keymap.set("n", "<leader>uto", function() Util.output({ mode = "horizontal", size = 0.4}) end, { desc = "Open nearest output", silent = true, noremap = true })
        vim.keymap.set("n", "<leader>utO", function() Util.output({ mode = "horizontal", size = 0.4}) end, { desc = "Open all output", silent = true, noremap = true })
        vim.keymap.set("n", "<leader>uts", neotest.summary.toggle,                                         { desc = "Toggle Summary", silent = true, noremap = true })
        vim.keymap.set("n", "<leader>utq", neotest.run.stop,                                               { desc = "Toggle Summary", silent = true, noremap = true })
    end,
}

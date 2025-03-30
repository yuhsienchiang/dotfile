return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            -- setup highlights
            local signs = {
                Breakpoint =          { sign = "", text_hl = "DiagnosticInfo", line_hl = "" },
                Stopped =             { sign = "󰁕", text_hl = "DiagnosticWarn", line_hl = "Visual" },
                BreakpointCondition = { sign = "", text_hl = "DiagnosticInfo", line_hl = "" },
                BreakpointRejected =  { sign = "", text_hl = "DiagnosticError", line_hl = "" },
                LogPoint =            { sign = "󰍂", text_hl = "DiagnosticInfo", line_hl = "" },
            }
            for name, icon in pairs(signs) do
                vim.fn.sign_define(
                    "Dap" .. name,
                    { text = icon.sign, texthl = icon.text_hl, linehl = icon.line_hl, numhl = "" }
                )
            end

            local dap = require("dap")

            -- setup keymaps
            vim.keymap.set("n", "<leader>udb", dap.toggle_breakpoint,                                           { desc = "Toggle Breakpoint",    silent = true, noremap = true })
            vim.keymap.set("n", "<leader>udB", require("yuhsienchiang.util.dap_util").set_condition_breakpoint, { desc = "Breakpoint Condition", silent = true, noremap = true })
            vim.keymap.set("n", "<leader>udc", dap.continue,                                                    { desc = "Continue",             silent = true, noremap = true })
            vim.keymap.set("n", "<leader>udi", dap.step_into ,                                                  { desc = "Step Into",            silent = true, noremap = true })
            vim.keymap.set("n", "<leader>udo", dap.step_out,                                                    { desc = "Step Out",             silent = true, noremap = true })
            vim.keymap.set("n", "<leader>udO", dap.step_over,                                                   { desc = "Step Over",            silent = true, noremap = true })
            vim.keymap.set("n", "<leader>udq", dap.terminate,                                                   { desc = "Terminate",            silent = true, noremap = true })
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "nvim-neotest/nvim-nio",
        config = function()
            local dapui, dap = require("dapui"), require("dap")

            dapui.setup({
                controls = { enabled = true, element = "console" },
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 0.25 },
                            { id = "breakpoints", size = 0.25 },
                            { id = "stacks", size = 0.25 },
                            { id = "watches", size = 0.25 },
                        },
                        position = "left",
                        size = 30,
                    },
                    {
                        elements = {
                            { id = "repl", size = 0.5, },
                            { id = "console", size = 0.5 },
                        },
                        position = "bottom",
                        size = 8,
                    },
                },
            })

            -- hook up ui
            dap.listeners.before.attach.dapui_config = function() dapui.open() end
            dap.listeners.before.launch.dapui_config = function() dapui.open() end

            -- setup keymaps
            vim.keymap.set("n", "<leader>udu", dapui.toggle, { desc = "Toggle UI", silent = true, noremap = true })
        end,
    },
}

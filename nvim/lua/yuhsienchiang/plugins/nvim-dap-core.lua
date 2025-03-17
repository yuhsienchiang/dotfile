return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            -- setup highlights
            local signs = {
                Breakpoint =          { sign = "", text_hl = "DiagnosticInfo",  line_hl = "",      },
                Stopped =             { sign = "󰁕", text_hl = "DiagnosticWarn",  line_hl = "Visual" },
                BreakpointCondition = { sign = "", text_hl = "DiagnosticInfo",  line_hl = "",      },
                BreakpointRejected =  { sign = "", text_hl = "DiagnosticError", line_hl = "",      },
                LogPoint =            { sign = "󰍂", text_hl = "DiagnosticInfo",  line_hl = "",      },
            }
            for name, icon in pairs(signs) do
                vim.fn.sign_define( "Dap" .. name, { text = icon.sign, texthl = icon.text_hl, linehl = icon.line_hl, numhl = "" })
            end

            local dap  = require("dap")

            -- setup keymaps
            vim.keymap.set("n", "<leader>ub", function() dap.toggle_breakpoint() end,                          { desc = "Toggle Breakpoint",       silent = true, noremap = true })
            vim.keymap.set("n", "<leader>uB", require("yuhsienchiang.util.dap_util").set_condition_breakpoint, { desc = "Breakpoint Condition",    silent = true, noremap = true })
            vim.keymap.set("n", "<leader>uc", function() dap.continue() end,                                   { desc = "Continue",                silent = true, noremap = true })
            vim.keymap.set("n", "<leader>uC", function() dap.run_to_cursor() end,                              { desc = "Run to Cursor",           silent = true, noremap = true })
            vim.keymap.set("n", "<leader>ug", function() dap.goto_() end,                                      { desc = "Go to line (no execute)", silent = true, noremap = true })
            vim.keymap.set("n", "<leader>ui", function() dap.step_into() end,                                  { desc = "Step Into",               silent = true, noremap = true })
            vim.keymap.set("n", "<leader>uj", function() dap.down() end,                                       { desc = "Down",                    silent = true, noremap = true })
            vim.keymap.set("n", "<leader>uk", function() dap.up() end,                                         { desc = "Up",                      silent = true, noremap = true })
            vim.keymap.set("n", "<leader>ul", function() dap.run_last() end,                                   { desc = "Run Last",                silent = true, noremap = true })
            vim.keymap.set("n", "<leader>uo", function() dap.step_out() end,                                   { desc = "Step Out",                silent = true, noremap = true })
            vim.keymap.set("n", "<leader>uO", function() dap.step_over() end,                                  { desc = "Step Over",               silent = true, noremap = true })
            vim.keymap.set("n", "<leader>up", function() dap.pause() end,                                      { desc = "Pause",                   silent = true, noremap = true })
            vim.keymap.set("n", "<leader>ut", function() dap.terminate() end,                                  { desc = "Terminate",               silent = true, noremap = true })
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "nvim-neotest/nvim-nio",
        config = function ()
            local dapui, dap = require("dapui"), require("dap")

            dapui.setup({ enabled = true, element = "console" })

            -- hook up ui
            dap.listeners.before.attach.dapui_config = function() dapui.open() end
            dap.listeners.before.launch.dapui_config = function() dapui.open() end
            dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
            dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

            -- setup keymaps
            vim.keymap.set("n", "<leader>uu", function() dapui.toggle() end, { desc = "Toggle UI", silent = true, noremap = true })
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        opts = {}
    }
}

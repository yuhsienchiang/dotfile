return {
    "mfussenegger/nvim-dap",
    ft = { "python" },
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            lazy = true,
            dependencies = { "nvim-neotest/nvim-nio" },
            config = function()
                local dap = require("dap")
                local dapui = require("dapui")

                dapui.setup({
                    icons = { expanded = "", collapsed = "", current_frame = "" },
                    controls = {
                        enabled = vim.fn.exists("+winbar") == 1,
                        element = "repl",
                        icons = {
                            pause = "󰏤",
                            play = "󰐊",
                            step_into = "",
                            step_over = "",
                            step_out = "",
                            step_back = "",
                            run_last = "",
                            terminate = "󰓛",
                            disconnect = "",
                        },
                    }
                })

                dap.listeners.before.attach.dapui_config = function()
                    dapui.open()
                end
                dap.listeners.before.launch.dapui_config = function()
                    dapui.open()
                end
                dap.listeners.before.event_terminated.dapui_config = function()
                    dapui.close()
                end
                dap.listeners.before.event_exited.dapui_config = function()
                    dapui.close()
                end
            end,
        },
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {},
        },
    },
    keys = {
        { "<leader>ub", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        { "<leader>uc", function() require("dap").continue() end,          desc = "Continue" },
        { "<leader>uC", function() require("dap").run_to_cursor() end,     desc = "Run to Cursor" },
        { "<leader>ug", function() require("dap").goto_() end,             desc = "Go to line (no execute)" },
        { "<leader>ui", function() require("dap").step_into() end,         desc = "Step Into" },
        { "<leader>uj", function() require("dap").down() end,              desc = "Down" },
        { "<leader>uk", function() require("dap").up() end,                desc = "Up" },
        { "<leader>ul", function() require("dap").run_last() end,          desc = "Run Last" },
        { "<leader>uo", function() require("dap").step_out() end,          desc = "Step Out" },
        { "<leader>uO", function() require("dap").step_over() end,         desc = "Step Over" },
        { "<leader>up", function() require("dap").pause() end,             desc = "Pause" },
        { "<leader>us", function() require("dap").session() end,           desc = "Session" },
        { "<leader>ut", function() require("dap").terminate() end,         desc = "Terminate" },
    },
    config = function()
        local signs = {
            Stopped             = { "󰁕", "DiagnosticWarn", "DapStoppedLine" },
            Breakpoint          = "",
            BreakpointCondition = "",
            BreakpointRejected  = { "", "DiagnosticError" },
            LogPoint            = ">",
        }
        for name, icon in pairs(signs) do
            icon = type(icon) == "table" and icon or { icon }
            local hl = "Dap" .. name
            vim.fn.sign_define(
                hl,
                { text = icon[1], texthl = icon[2] or "DiagnosticInfo", linehl = icon[3], numhl = icon[3] }
            )
        end
    end
}

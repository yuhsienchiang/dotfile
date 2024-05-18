return {
	"mfussenegger/nvim-dap",
    lazy = true,
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
					},
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
	config = function()
		local signs = {
			Stopped = { "󰁕", "DiagnosticWarn", "DapStoppedLine" },
			Breakpoint = "",
			BreakpointCondition = "",
			BreakpointRejected = { "", "DiagnosticError" },
			LogPoint = ">",
		}
		for name, icon in pairs(signs) do
			icon = type(icon) == "table" and icon or { icon }
			local hl = "Dap" .. name
			vim.fn.sign_define(
				hl,
				{ text = icon[1], texthl = icon[2] or "DiagnosticInfo", linehl = icon[3], numhl = icon[3] }
			)
		end
	end,
}

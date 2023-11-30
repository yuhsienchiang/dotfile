return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		local copilot_setup, copilot = pcall(require, "copilot")
		if not copilot_setup then
			print("copilot not found")
            return
		end
		copilot.setup({
			panel = {
				enabled = false,
				auto_refresh = true,
				keymap = {},
				layout = {
					position = "right",
					ratio = 0.4,
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
                keymap = {
                    accept = "<C-y>",
                    accept_word = false,
                    accept_line = false,
                    next = "<C-]>",
                    prev = "<C-[>",
                    dismiss = "<C-n>",
                },
			},
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
			},
			copilot_node_command = "node",
		})
	end,
}

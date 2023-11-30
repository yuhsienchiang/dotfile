return {
	"zbirenbaum/copilot-cmp",
    enabled = false,
	lazy = true,
	event = { "InsertEnter", "LspAttach" },
	config = function()
		local copilot_cmp_status, copilot_cmp = pcall(require, "copilot_cmp")
		if not copilot_cmp_status then
			print("copilot_cmp not found")
			return
		end

		copilot_cmp.setup()
	end,
}

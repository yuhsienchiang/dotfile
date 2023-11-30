return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	init = function()
		vim.opt.list = true
		vim.opt.listchars:append("eol:↴")
		vim.opt.listchars:append("space: ")
	end,
	config = function()
		local indent_status, indent = pcall(require, "ibl")
		if not indent_status then
			print("indent-blankline not found")
			return
		end

		indent.setup({
			enabled = true,
			indent = { char = "▏", tab_char = "▏", smart_indent_cap = true },
			scope = {
				enabled = false,
			},
			exclude = {
				filetypes = {
					"NvimTree",
					"help",
					"markdown",
					"alpha",
					"lazy",
					"toggleterm",
					"mason",
					"notify",
					"gitcommit",
					"TelescopePrompt",
					"TelescopeResults",
				},
				buftypes = {
					"terminal",
					"nofile",
					"quickfix",
					"prompt",
				},
			},
		})
	end,
}

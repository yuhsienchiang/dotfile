return {
	"numToStr/Comment.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	config = function()
		local comment = require("Comment")
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		comment.setup({
			toggler = {
				line = "<C-m>",
                block = ""
			},
			opleader = {
				line = "<C-m>",
                block = ""
			},
			mappings = {
				basic = true,
				extra = false,
			},
			pre_hood = ts_context_commentstring.create_pre_hook(),
		})
	end,
}

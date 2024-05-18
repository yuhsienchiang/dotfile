return {
	"lewis6991/gitsigns.nvim",
	event = { "BufNewFile", "BufReadPost" },
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = " " },
				topdelete = { text = " " },
				changedelete = { text = "~ " },
				untracked = { text = "▎" },
			},
			attach_to_untracked = true,
		})
	end,
}

return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("illuminate").configure({
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			delay = 200,
			large_file_cutoff = 2000,
			filetypes_denylist = {
				"NvimTree",
                "alpha"
			},
			large_file_overrides = {
				providers = { "lsp" },
			},
		})
	end,
}

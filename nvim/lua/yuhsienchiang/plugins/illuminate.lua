return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local illuminate_status, illuminate = pcall(require, "illuminate")
		if not illuminate_status then
			print("illuminate not found")
			return
		end

		illuminate.configure({
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

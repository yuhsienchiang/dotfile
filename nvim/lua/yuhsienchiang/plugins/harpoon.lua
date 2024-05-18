return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
    lazy = true,
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		require("harpoon"):setup({})
	end,
}

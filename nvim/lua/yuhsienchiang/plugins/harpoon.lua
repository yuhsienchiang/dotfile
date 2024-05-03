return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	keys = function()
        local harpoon = require("harpoon")
		local keys = {
            { "<leader>hh", require("yuhsienchiang.util.harpoon_action").harpoon_telescope, desc = "Harpoon Menu" },
			{ "<leader>ha", require("yuhsienchiang.util.harpoon_action").harpoon_add,       desc = "Harpoon Add"  },
			{ "<leader>hk", function() harpoon:list():prev() end,                           desc = "Harpoon Prev" },
			{ "<leader>hj", function() harpoon:list():next() end,                           desc = "Harpoon Next" },
		}

		for i = 1, 5 do
			table.insert(keys, {
				"<leader>h" .. i,
				function()
					require("harpoon"):list():select(i)
				end,
				desc = "File " .. i,
			})
		end
		return keys
	end,
	config = function()
		require("harpoon"):setup({})
	end,
}

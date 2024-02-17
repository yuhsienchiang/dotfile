return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

	{
		"onsails/lspkind.nvim",
		event = "VeryLazy",
	},

	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
        config = function()
            local devicons_status, devicons = pcall(require, "nvim-web-devicons")
            if not devicons_status then
                print("nvim-web-devicons not found")
                return
            end
            devicons.setup({
                override = {
                    toml = {
                        icon = "",
                    }
                }
            })
        end,
	},
}

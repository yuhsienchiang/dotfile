return {
	"echasnovski/mini.indentscope",
	version = false, -- wait till new 0.7.0 release to put it back on semver
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		draw = {
			-- Delay (in ms) between event and start of drawing scope indicator
			delay = 0,
			priority = 2,
			animation = function(_, _)
				return 5
			end,
		},
		symbol = "▏",
		options = { try_as_border = true },
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"help",
				"alpha",
				"NvimTree",
				"lazy",
				"mason",
				"toggleterm",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}

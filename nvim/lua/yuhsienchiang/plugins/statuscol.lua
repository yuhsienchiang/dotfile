return {
	"luukvbaal/statuscol.nvim",
	dependencies = { "lewis6991/gitsigns.nvim" },
	event = { "BufNewFile", "BufReadPost" },
	config = function()
		local statuscol = require("statuscol")
		local builtin = require("statuscol.builtin")

		statuscol.setup({
			setopt = true,
			-- configuration goes here, for example:
			ft_ignore = { "NvimTree", "alpha", "lazy", "dashboard" },
			bf_ignore = { "NvimTree", "alpha", "lazy", "dashboard" },
			relculright = false,

			segments = {
				{
					sign = {
						name = { "Dap*" },
						maxwidth = 1, -- maximum number of signs that will be displayed in this segment
						colwidth = 1, -- number of display cells per sign in this segment
						auto = false, -- when true, the segment will not be drawn if no signs matching the pattern are currently placed in the buffer.
						fillchar = " ", -- character used to fill a segment with less signs than maxwidth
					},
				},
				{
					sign = {
						name = { "Diagnostic" },
						maxwidth = 1, -- maximum number of signs that will be displayed in this segment
						colwidth = 1, -- number of display cells per sign in this segment
						auto = false, -- when true, the segment will not be drawn if no signs matching the pattern are currently placed in the buffer.
						fillchar = " ", -- character used to fill a segment with less signs than maxwidth
					},
				},
				{
					text = { " ", builtin.lnumfunc, " " },
					condition = { true, builtin.not_empty },
					colwidth = 3,
				},
				{
					sign = {
						namespace = { "gitsigns*" },
						maxwidth = 1, -- maximum number of signs that will be displayed in this segment
						colwidth = 1, -- number of display cells per sign in this segment
						auto = false, -- when true, the segment will not be drawn if no signs matching the pattern are currently placed in the buffer.
						fillchar = " ", -- character used to fill a segment with less signs than maxwidth
					},
				},
			},
		})
	end,
}

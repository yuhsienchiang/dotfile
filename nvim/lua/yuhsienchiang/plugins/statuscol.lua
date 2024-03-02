return {
	"luukvbaal/statuscol.nvim",
	dependencies = { "lewis6991/gitsigns.nvim" },
	lazy = false,
	config = function()
		local statuscol_status, statuscol = pcall(require, "statuscol")
		if not statuscol_status then
			print("statuscol not found")
			return
		end
		local builtin_status, builtin = pcall(require, "statuscol.builtin")
		if not builtin_status then
			print("statuscol not found")
			return
		end

		statuscol.setup({
			setopt = true,
			-- configuration goes here, for example:
			ft_ignore = { "NvimTree", "alpha", "lazy" },
			bf_ignore = { "NvimTree", "alpha", "lazy" },
			relculright = false,

			segments = {
                {
                    sign = {
                        name = { "Dap*" },
                        maxwidth = 1, -- maximum number of signs that will be displayed in this segment
                        colwidth = 2, -- number of display cells per sign in this segment
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
					colwidth = 4,
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

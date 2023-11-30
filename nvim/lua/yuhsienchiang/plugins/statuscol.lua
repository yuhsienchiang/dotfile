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
						name = { "Diagnostic" },
						colwidth = 1,
						auto = false,
						fillchar = " ",
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
						colwidth = 2,
						auto = false,
						fillchar = " ",
					},
				},
			},
		})
	end,
}

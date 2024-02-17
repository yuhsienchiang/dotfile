return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
		if not treesitter_status then
			print("treesitter.configs not found")
			return
		end

		treesitter.setup({
			-- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- ensure these language parsers are installed
			ensure_installed = {
				"c",
				"cpp",
                "diff",
				"vim",
                "vimdoc",
				"lua",
                "luadoc",
				"python",
				"java",
				"markdown",
				"markdown_inline",
				"html",
				"css",
				"javascript",
				"typescript",
				"json",
				"regex",
                "toml",
				"bash",
				"dockerfile",
				"gitignore",
				"yaml",
                "git_config",
                "git_rebase",
                "gitcommit",


			},
			-- auto install above language parsers
			auto_install = true,
		})
	end,
}

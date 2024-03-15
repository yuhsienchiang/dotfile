return {
	"nvim-treesitter/nvim-treesitter-context",
    lazy = true,
	config = function()
        require("treesitter-context").setup({
            enable = true,
            max_lines = 3,
            multiline_threshold = 1,
            mode = 'cursor',
            separator ='',
        })
	end,
}

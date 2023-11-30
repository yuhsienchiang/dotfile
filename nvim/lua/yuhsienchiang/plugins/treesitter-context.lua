return {
	"nvim-treesitter/nvim-treesitter-context",
	event = "VeryLazy",
	enabled = true,
	config = function()
		local context_status, context = pcall(require, "treesitter-context")
		if not context_status then
			print("treesitter-context not found")
			return
		end

        context.setup({
            enable = true,
            max_lines = 3,
            multiline_threshold = 1,
            mode = 'cursor',
            separator ='',
        })
	end,
}

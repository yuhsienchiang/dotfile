return {
	"nvimdev/lspsaga.nvim",
	event = { "LspAttach" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lspsaga_status, lspsaga = pcall(require, "lspsaga")
		if not lspsaga_status then
			print("lspsaga not found")
			return
		end
		lspsaga.setup({
			ui = {
				border = "rounded",
				devicon = true,
				winblend = 0,
				expand = " ",
				collapse = " ",
				kind = {},
				imp_sign = "󰳛",
				code_action = "󰌵",
			},
			-- keybinds for navigation in lspsaga window
			scroll_preview = {
				scroll_down = "<C-k>",
				scroll_up = "<C-j>",
			},
			-- use enter to open file with definition preview
			definition = {
				keys = {
					edit = "<C-i>", -- open the file
					vsplit = "<C-v>",
					split = "<C-s>",
					quit = "q", -- close when focusing the window
					close = "<C-q>", -- close even if not focusing the window
				},
			},
			finder = {
				default = "def+ref+imp",
				layout = "float",
				silent = false,
				keys = {
					shuttle = "[w",
					toggle_or_open = "<CR>",
					vsplit = "<C-v>",
					split = "<C-s>",
					tabnew = "<C-t>",
					quit = "q",
					close = "<C-q>",
				},
			},
			rename = {
				in_select = true,
				auto_save = false,
				project_max_width = 0.5,
				project_max_height = 0.5,
				keys = {
					quit = "<C-q>",
					exec = "<CR>",
					select = "x",
				},
			},
			symbol_in_winbar = {
				enable = false,
				separator = " › ",
				hide_keyword = true,
				show_file = true,
				folder_level = 2,
				color_mode = false,
				dely = 500,
			},
			outline = {
				enable = false,
			},
			lightbulb = {
				enable = false,
			},
			implement = {
				enable = false,
			},
			beacon = {
				enable = true,
				frequency = 10,
			},
		})

		vim.keymap.set("n",          "<leader>df", "<cmd>Lspsaga finder<CR>",                   { desc = "Show references/definition", noremap = true, silent = true }) -- show definition, references
		vim.keymap.set("n",          "<leader>dd", "<cmd>Lspsaga peek_definition<CR>",          { desc = "Show definition", noremap = true, silent = true }) -- see definition and make edits in window
		vim.keymap.set("n",          "<leader>da", "<cmd>Lspsaga code_action<CR>",              { desc = "Show code actions", noremap = true, silent = true }) -- see available code actions
		vim.keymap.set("n",          "<leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>",  { desc = "Show diagnostics for cursor", noremap = true, silent = true }) -- show diagnostics for cursor
		vim.keymap.set("n",          "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>",    { desc = "Show diagnostics for line", noremap = true, silent = true }) -- show  diagnostics for line
		vim.keymap.set("n",          "<leader>db", "<cmd>Lspsaga show_buf_diagnostics<CR>",     { desc = "Show diagnostics for buffer", noremap = true, silent = true })
		vim.keymap.set("n",          "<leader>dh", "<cmd>Lspsaga hover_doc<CR>",                { desc = "Show hover doc under cursor", noremap = true, silent = true }) -- show documentation for what is under cursor
		vim.keymap.set({ "n", "i" }, "<C-s>",      "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Show signature help", noremap = true, silent = true })
	end,
}

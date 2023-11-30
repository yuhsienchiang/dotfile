return {
	"nvimtools/none-ls.nvim",
    enabled=false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls_setup, null_ls = pcall(require, "null-ls")
		if not null_ls_setup then
			return
		end

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.black, -- python formatter
				null_ls.builtins.formatting.stylua, -- lua formatter
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.clang_format.with({
					filetypes = { "cpp", "c" },
				}),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					local keymap = vim.keymap
					local opts = { noremap = true, silent = true, buffer = bufnr, desc = "Format code" }

					local format_code = function()
						vim.lsp.buf.format({
							filter = function(current_client)
								return current_client.name == "null-ls"
							end,
							bufnr = bufnr,
						})
					end

					keymap.set("n", "<leader>ef", format_code, opts)
				end
			end,
		})
	end,
}

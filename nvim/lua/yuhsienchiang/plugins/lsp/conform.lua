return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform_status, conform = pcall(require, "conform")
		if not conform_status then
			print("conform not found")
			return
		end

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				ymal ={ "prettier" },
				markdown={ "prettier" },
				json={ "prettier" },
			},
			notify_on_error = true,
		})

		vim.keymap.set({ "n", "v" }, "<leader>ef", function()
			conform.format({
				lsp_fallback = true,
				async = false,
                quiet = false,
				timeout_ms = 3000,
			})
		end)
	end,
}

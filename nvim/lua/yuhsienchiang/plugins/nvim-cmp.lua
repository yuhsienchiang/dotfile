return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-buffer", -- Buffer Completions
		"hrsh7th/cmp-path", -- Path Completions
		-- "zbirenbaum/copilot-cmp",
		"L3MON4D3/LuaSnip", -- Snippet Engine
		"saadparwaiz1/cmp_luasnip", -- Snippet Completions
		"rafamadriz/friendly-snippets", -- Bunch of Snippets
		{
			"hrsh7th/cmp-nvim-lsp",
			dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
		}, -- LSP Completions
	},
	config = function()
		local cmp_status, cmp = pcall(require, "cmp")
		if not cmp_status then
			return
		end

		local cmp_compare_status, cmp_compare = pcall(require, "cmp.config.compare")
		if not cmp_compare_status then
			return
		end

		local luasnip_status, luasnip = pcall(require, "luasnip")
		if not luasnip_status then
			return
		end

		local lspkind_status, lspkind = pcall(require, "lspkind")
		if not lspkind_status then
			return
		end

		require("luasnip.loaders.from_vscode").lazy_load()
		-- vim.opt.completeopt = "menu,menuone,noselect"

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					border = "single",
					side_padding = 1,
					winhighlight = "Normal:NoicePopupmenu,FloatBorder:NoicePopupmenuBorder,CursorLine:NoicePopupmenuSelected,Search:None",
					scrollbar = false,
				}),
				documentation = cmp.config.window.bordered({
					border = "single",
					side_padding = 1,
					winhighlight = "Normal:NoicePopupmenu,FloatBorder:NoicePopupmenuBorder,CursorLine:NoicePopupmenuSelected,Search:None",
					scrollbar = false,
				}),
			},
			mapping = {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expandable() then
						luasnip.expand()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<S-CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 8 }, -- lsp
				{ name = "luasnip", priority = 8 }, -- snippets
				{ name = "buffer", priority = 7 }, -- text within current buffer
				{ name = "path", priority = 6 }, -- file system paths
				-- { name = "copilot", priority = 5 }, -- copilot
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
					mode = "symbol_text",
					menu = {
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						path = "[Path]",
						-- copilot = "[Copilot]",
					},
					symbol_map = {
						Class = "",
						Table = "",
						Calendar = "",
						Null = "󰟢",
						-- Copilot = "",
					},
					-- remove duplicates
					before = function(entry, vim_item)
						if entry.source.name == "nvim_lsp" or entry.source.name == "luasnip" then
							vim_item.dup = 0
						end

						return vim_item
					end,
				}),
			},
			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
			},
			sorting = {
				priority_weight = 1.0,
				comparators = {
					cmp_compare.locality,
					cmp_compare.recently_used,
					cmp_compare.score,
					cmp_compare.offset,
					cmp_compare.order,
				},
			},
		})

		cmp.event:on("menu_opened", function()
			vim.b.copilot_suggestion_hidden = false
		end)

		-- Maximum number of items to show in the popup menu
		vim.cmd([[ set pumheight=10 ]])
	end,
}

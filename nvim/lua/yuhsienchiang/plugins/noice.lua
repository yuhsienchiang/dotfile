return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			opts = {
				timeout = 2500,
				max_height = function()
					return math.floor(vim.o.lines * 0.75)
				end,
				max_width = function()
					return math.floor(vim.o.columns * 0.75)
				end,
				on_open = function(win)
					vim.api.nvim_win_set_config(win, { zindex = 100 })
				end,
			},
			init = function()
				vim.opt.termguicolors = true
				vim.notify = require("notify")
			end,
		},
	},
	opts = {
		throttle = 1000 / 50, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = false, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
		},
		cmdline = {
			enabled = true, -- enables the Noice cmdline UI
			view = "cmdline", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
			opts = {}, -- global options for the cmdline. See section on views
			format = {
				cmdline = { pattern = "^:", icon = " 󱞪", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = "  ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = "  ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = " ", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = " ", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = " 󰋖" },
				input = {}, -- Used by input()
			},
		},
		messages = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
		},
		popupmenu = { -- popupmenu for cmdline
			enabled = true,
			backend = "nui",
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			progress = {
				enabled = true,
				format = "lsp_progress",
				format_done = "lsp_progress_done",
				throttle = 1000 / 30, -- frequency to update lsp progress message
				view = "mini",
			},
			hover = {
				enabled = true,
				silent = true, -- set to true to not show a message if hover is not available
				view = nil, -- when nil, use defaults from documentation
				opts = {
					border = {
						style = "rounded",
						padding = { 0, 0 },
					},
				}, -- merged with defaults from documentation
			},
			documentation = {
				view = "hover",
				opts = {
					lang = "markdown",
					replace = true,
					render = "plain",
					format = { "{message}" },
					win_options = {
						concealcursor = "n",
						conceallevel = 3,
						winhighlight = {
							Normal = "NoicePopupmenu", -- change to NormalFloat to make it look like other floats
							FloatBorder = "NoicePopupmenuBorder", -- border highlight
							CursorLine = "NoicePopupmenuSelected", -- used for highlighting the selected item
							PmenuMatch = "NoicePopupmenuMatch", -- used to highlight the part of the item that matches the input
						},
					},
					border = {
						style = "rounded",
						padding = { 0, 0 },
					},
				},
			},
			signature = {
				enabled = true,
				auto_open = {
					enabled = false,
					trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
					luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
					throttle = 50, -- Debounce lsp signature help request by 50ms
				},
				view = nil, -- when nil, use defaults from documentation
				opts = {
					border = {
						style = "rounded",
						padding = { 0, 0 },
					},
				}, -- merged with defaults from documentation
			},
			message = {
				-- Messages shown by lsp servers
				enabled = true,
				view = "notify",
				opts = {},
			},
		},
		views = {
			cmdline = {
				backend = "popup",
				relative = "editor",
				position = { row = "100%", col = 0 },
				size = { height = "auto", width = "100%" },
				border = { style = "none" },
				win_options = {
					winhighlight = {
						Normal = "NoiceCmdline",
						IncSearch = "",
						CurSearch = "",
						Search = "",
					},
				},
			},
			popupmenu = { -- the popupmenu for cmdline
				relative = "editor",
				position = { row = "97%", col = 0 },
				border = {
					style = "rounded",
					padding = { 0, 0 },
				},
				size = {
					min_width = 30,
					max_height = 10,
				},
				win_options = {
					winbar = "",
					foldenable = false,
					cursorline = true,
					cursorlineopt = "line",
					winhighlight = {
						Normal = "NoicePopupmenu", -- change to NormalFloat to make it look like other floats
						FloatBorder = "NoicePopupmenuBorder", -- border highlight
						CursorLine = "NoicePopupmenuSelected", -- used for highlighting the selected item
						PmenuMatch = "NoicePopupmenuMatch", -- used to highlight the part of the item that matches the input
					},
				},
			},
			popup = {
				backend = "popup",
				relative = "editor",
				close = {
					events = { "BufLeave" },
					keys = { "q" },
				},
				enter = true,
				border = {
					style = "rounded",
				},
				position = "50%",
				size = {
					width = "120",
					height = "20",
				},
				win_options = {
					winhighlight = { Normal = "NoicePopup", FloatBorder = "NoicePopupBorder" },
					winbar = "",
					foldenable = false,
				},
			},
		},
	},
}

return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { light = "latte", dark = "mocha", },
				term_colors = true,
				dim_inactive = {
					enabled = true, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.45, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false,
				no_bold = false,
				styles = { comments = { "italic" } },
				integrations = {
					cmp = true,
                    dap = true,
                    dap_ui = true,
                    dashboard = true,
					flash = true,
					gitsigns = true,
					illuminate = { enabled = true, lsp = false },
					indent_blankline = { enabled = true, colored_indent_levels = false },
					lsp_saga = true,
					mason = true,
					mini = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
						inlay_hints = { background = true },
					},
					noice = true,
					notify = true,
					nvimtree = true,
					treesitter = true,
					telescope = { enabled = true },
					which_key = true,
				},
				color_overrides = {},
				custom_highlights = function(colors)
					return {
						-- native nvim
						VertSplit = { fg = colors.peach, bold = true },
                        WinSeparator = { link = "VertSplit" },
						CursorLineNr = { fg = colors.lavender, bold = true },

						-- Dashboard
						DashboardHeader = { fg = colors.yellow },
						DashboardFooter = { fg = colors.surface1 },
						DashboardIcon   = { fg = colors.blue },
						DashboardDesc   = { fg = colors.text },
						DashboardKey    = { fg = colors.peach },

						-- NvimTree
						NvimTreeWinSeparator = { fg = colors.peach, bold = true },

						-- noice
                        NoiceCmdline = { bg = colors.base },
						NoiceCmdlineIcon = { fg = colors.yellow, bg = colors.base },
						NoiceCmdlineIconSearch = { fg = colors.yellow, bg = colors.base },
						NoicePopupmenu = { bg = colors.base }, -- change to NormalFloat to make it look like other floats
						NoicePopupmenuBorder = { fg = colors.overlay2, bg = colors.base }, -- border highlight
						NoicePopupmenuMatch = { fg = colors.text, bold = true }, -- used to highlight the part of the item that matches the input

						-- Telescope
						TelescopeSelection = { fg = colors.flamingo, bg = colors.base, bold = true },
						TelescopeSelectionCaret = { fg = colors.flamingo, bg = colors.base, bold = true },
						TelescopePromptPrefix = { fg = colors.flamingo, bg = colors.base },
						TelescopeNormal = { bg = colors.base },
						TelescopeTitle = { fg = colors.base, bg = colors.rosewater, bold = true },
						TelescopeBorder = { fg = colors.overlay2, bg = colors.base },
						TelescopePromptNormal = { bg = colors.base },
						TelescopePromptTitle = { fg = colors.base, bg = colors.flamingo, bold = true },
						TelescopePromptBorder = { fg = colors.overlay2, bg = colors.base },
						TelescopeResultsNormal = { bg = colors.base },
						TelescopeResultsTitle = { fg = colors.base, bg = colors.green, bold = true },
						TelescopeResultsBorder = { fg = colors.overlay2, bg = colors.base },
						TelescopePreviewNormal = { bg = colors.base },
						TelescopePreviewTitle = { fg = colors.base, bg = colors.blue, bold = true },
						TelescopePreviewBorder = { fg = colors.overlay2, bg = colors.base },
						TelescopeMultiIcon = { fg = colors.flamingo, bg = colors.base, bold = true },
						TelescopeMultiSelection = { fg = colors.flamingo, bg = colors.base },

						-- GitSigns
						GitSignsChange = { fg = colors.blue, bg = colors.base, bold = true },

						-- WhichKey
						WhichKeyFloat = { bg = colors.base }, -- the background color of the float window
						WhichKey = { fg = colors.maroon },
						WhichKeyGroup = { fg = colors.yellow },
						WhichKeyDesc = { fg = colors.text },

						-- Diagnostic Virtual Text [Text]
						DiagnosticVirtualTextError = { fg = colors.red, bg = "none", italic = true, bold = true },
						DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = "none", italic = true, bold = true },
						DiagnosticVirtualTextInfo = { fg = colors.sky, bg = "none", italic = true, bold = true },
						DiagnosticVirtualTextHint = { fg = colors.teal, bg = "none", italic = true, bold = true },
						-- Diagnostic Virtual Text [icon]
						DiagnosticError = { fg = colors.red, bg = "none", italic = true, bold = true },
						DiagnosticWarn = { fg = colors.yellow, bg = "none", italic = true, bold = true },
						DiagnosticInfo = { fg = colors.sky, bg = "none", italic = true, bold = true },
						DiagnosticHint = { fg = colors.teal, bg = "none", italic = true, bold = true },
						-- Diagnostic Signs at sign column
						DiagnosticSignError = { fg = colors.red, bg = "none" },
						DiagnosticSignWarn = { fg = colors.yellow, bg = "none" },
						DiagnosticSignInfo = { fg = colors.sky, bg = "none" },
						DiagnosticSignHint = { fg = colors.teal, bg = "none" },
						-- TreesitterContext
						TreesitterContextLineNumber = { link = "CursorLineNr" },

						-- DAP
                        DapStoppedLine = { link = "Visual" },
					}
				end,

			})
            vim.cmd([[ colorscheme catppuccin ]])
		end,
	},

	{
		"AlexvZyl/nordic.nvim",
        enabled = false,
		lazy = true,
		priority = 1000,
		config = function()
			local nordic_status, nordic = pcall(require, "nordic")
			if not nordic_status then
				print("nordic not found")
				return
			end

			local nordic_colors_status, nordic_colors = pcall(require, "nordic.colors")
			if not nordic_colors_status then
				print("nordic.colors not found")
				return
			end

			local background = nordic_colors.black1
			local background_dark = nordic_colors.black0

			nordic.setup({
				-- This callback can be used to override the colors used in the palette.
				on_palette = function(palette)
					return palette
				end,
				bold_keywords = false,
				italic_comments = true,
				reduced_blue = true,
				-- Cursorline options.  Also includes visual/selection.
				cursorline = {
					bold = false,
					bold_number = true,
					-- Avialable styles: 'dark', 'light'.
					theme = "dark",
					blend = 0.0,
				},
				noice = { style = "classic" },
				telescope = { style = "classic" },

				-- Override the styling of any highlight group.
				override = {
					-- General
					Normal = { fg = nordic_colors.white0, bg = background },
					NormalNC = { link = "Normal" },
					NormalSB = { fg = nordic_colors.gray2, bg = background },
					SignColumn = { fg = nordic_colors.gray2, bg = background }, -- column where |signs| are displayed
					SignColumnSB = { link = "SignColumn" },
					Visual = { bg = nordic_colors.gray2 },
					Comments = { fg = nordic_colors.gray5 },
					VertSplit = { fg = nordic_colors.orange.bright, bold = true },
					WinSeparator = { fg = nordic_colors.orange.bright, bold = true },
					Search = { fg = nordic_colors.white3, bg = nordic_colors.gray5, underline = false, bold = false }, -- Last search pattern highlighting.  Also used for similar items that need to stand out.
					IncSearch = { fg = nordic_colors.black1, bg = nordic_colors.orange.bright, underline = false, bold = false }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
					CurSearch = { link = "IncSearch" },
					WinBar = { fg = nordic_colors.white0, bg = background },
					WinBarNC = { fg = nordic_colors.gray3, bg = background },

					-- Alpha
					AlphaHeader = { fg = nordic_colors.yellow.base, bg = background },
					AlphaFooter = { fg = nordic_colors.gray5, bg = background },
					AlphaButtonIcon1 = { fg = nordic_colors.green.base, bg = background },
					AlphaButtonIcon2 = { fg = nordic_colors.orange.base, bg = background },
					AlphaButtonIcon3 = { fg = nordic_colors.magenta.base, bg = background },
					AlphaButtonIcon4 = { fg = nordic_colors.blue0, bg = background },
					AlphaButtonIcon5 = { fg = "#ffffff", bg = background },
					AlphaButtonIcon6 = { fg = "#a1aab8", bg = background },
					AlphaButtonIcon7 = { fg = nordic_colors.white0, bg = background },
					AlphaButtonTxt = { fg = nordic_colors.white0, bg = background },

					-- Lazy
					LazyButton = { bg = nordic_colors.gray1 },
					LazyButtonActive = { fg = nordic_colors.black0, bg = nordic_colors.blue0 },

					-- NvimTree
					NvimTreeNormal = { bg = nordic_colors.black0 },
					NvimTreeNormalNC = { bg = nordic_colors.black0 },
					NvimTreeIndentMarker = { fg = nordic_colors.gray3, bold = true },
					NvimTreeWinSeparator = { fg = nordic_colors.orange.bright, bg = background },
					NvimTreeRootFolder = { fg = nordic_colors.blue0, bg = "none", bold = true },

					-- Telescope
					TelescopeSelection = { fg = nordic_colors.yellow.base, bg = background, bold = true },
					TelescopeSelectionCaret = { fg = nordic_colors.yellow.base, bg = background, bold = true },
					TelescopePromptPrefix = { fg = nordic_colors.orange.bright, bg = background },

					TelescopeNormal = { bg = background },
					TelescopeTitle = { fg = background, bg = nordic_colors.orange.base, bold = true },
					TelescopeBorder = { fg = nordic_colors.white0, bg = background },

					TelescopePromptNormal = { bg = background },
					TelescopePromptTitle = { fg = background, bg = nordic_colors.orange.base, bold = true },
					TelescopePromptBorder = { fg = nordic_colors.white0, bg = background },

					TelescopeResultsNormal = { bg = background },
					TelescopeResultsTitle = { fg = background, bg = nordic_colors.orange.base, bold = true },
					TelescopeResultsBorder = { fg = nordic_colors.white0, bg = background },

					TelescopePreviewNormal = { bg = background },
					TelescopePreviewTitle = { fg = background, bg = nordic_colors.blue2, bold = true },
					TelescopePreviewBorder = { fg = nordic_colors.white0, bg = background },

					TelescopeMultiIcon = { fg = nordic_colors.yellow.bright, bg = background, bold = true },
					TelescopeMultiSelection = { bg = background },
					TelescopePreviewLine = { bg = nordic_colors.gray1 },

					-- Noice
					NoiceCmdline = { fg = nordic_colors.white0, bg = background },
					NoiceCmdlinePrompt = { fg = nordic_colors.cyan.bright, bg = background },
					NoiceCmdlineIcon = { fg = nordic_colors.yellow.base, bg = background },
					NoiceCmdlineIconSearch = { fg = nordic_colors.yellow.base, bg = background },

					NoicePopupmenu = { bg = background }, -- change to NormalFloat to make it look like other floats
					NoicePopupmenuBorder = { fg = nordic_colors.gray4, bg = background }, -- border highlight
					NoicePopupmenuSelected = { bg = nordic_colors.gray2, bold = true }, -- used for highlighting the selected item
					NoicePopupmenuMatch = { fg = nordic_colors.blue0 }, -- used to highlight the part of the item that matches the input

					-- WhichKey
					WhichKeyBorder = { fg = nordic_colors.white0, bg = nordic_colors.black1 },
					WhichKeyGroup = { fg = nordic_colors.orange.bright, bg = nordic_colors.black1, bold = false },

					-- IndentBlankline
					IndentBlanklineChar = { fg = nordic_colors.gray2 },

					-- Illuminate
					IlluminatedWordText = { bg = nordic_colors.gray3 },
					IlluminatedWordRead = { bg = nordic_colors.gray3 },
					IlluminatedWordWrite = { bg = nordic_colors.gray3 },

					-- Gitsigns
					GitSignsAdd = { fg = nordic_colors.green.bright, bg = background, bold = true },
					GitSignsDelete = { fg = nordic_colors.red.bright, bg = background, bold = true },
					GitSignsChange = { fg = nordic_colors.blue0, bg = background, bold = true },

					-- gray
					CmpItemAbbrDeprecated = { fg = nordic_colors.gray3, strikethrough = true },

					-- blue
					CmpItemAbbrMatch = { fg = nordic_colors.blue0 },
					CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
					CmpItemKindSnippet = { fg = nordic_colors.blue0 },
					CmpItemKindFolder = { fg = nordic_colors.blue0 },
					CmpItemKindFile = { link = "CmpItemKindFolder" },

					-- white
					CmpItemMenu = { fg = nordic_colors.white0, italic = true },
					CmpItemKindText = { fg = nordic_colors.white0 },

					-- yellow
					CmpItemKindClass = { fg = nordic_colors.yellow.dim },
					CmpItemKindStruct = { link = "CmpItemKindClass" },
					CmpItemKindInterface = { link = "CmpItemKindClass" },
					CmpItemKindModule = { link = "CmpItemKindClass" },
					CmpItemKindEvent = { link = "CmpItemKindClass" },
					CmpItemKindEnum = { link = "CmpItemKindClass" },
					CmpItemKindEnumMember = { link = "CmpItemKindClass" },
					CmpItemKindTypeParameter = { link = "CmpItemKindClass" },

					-- magenta
					CmpItemKindVariable = { fg = nordic_colors.magenta.base },
					CmpItemKindConstant = { link = "CmpItemKindVariable" },
					CmpItemKindValue = { link = "CmpItemKindVariable" },
					CmpItemKindUnit = { link = "CmpItemKindVariable" },
					CmpItemKindColor = { link = "CmpItemKindVariable" },

					-- cyan
					CmpItemKindFunction = { fg = nordic_colors.cyan.dim },
					CmpItemKindMethod = { link = "CmpItemKindFunction" },
					CmpItemKindConstructor = { link = "CmpItemKindFunction" },

					-- orange
					CmpItemKindKeyword = { fg = nordic_colors.orange.dim },
					CmpItemKindProperty = { link = "CmpItemKindKeyword" },
					CmpItemKindField = { link = "CmpItemKindKeyword" },
				},
			})
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
        enabled = false,
		config = function()
			local tokyonight_status, tokyonight = pcall(require, "tokyonight")
			if not tokyonight_status then
				print("nordic not found")
				return
			end

			tokyonight.setup({
				style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = { italic = true },
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
				sidebars = { "NvimTree" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
				day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
				dim_inactive = true, -- dims inactive windows
				lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

				--- You can override specific color groups to use other groups or a hex color
				--- function will be called with a ColorScheme table
				-- on_colors = function(colors) end,
				-- --- You can override specific highlights to use other groups or a hex color
				-- --- function will be called with a Highlights and ColorScheme table
				-- on_highlights = function(highlights, colors) end,
			})
		end,
	},
}

require("catppuccin").setup({
	flavour = "macchiato", -- latte, frappe, macchiato, mocha
	background = {
		light = "latte",
		dark = "macchiato",
	},
	term_colors = true,
	dim_inactive = {
		enabled = true, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.45, -- percentage of the shade to apply to the inactive window
	},
	no_italic = false,
	no_bold = false,
	styles = {
		comments = { "italic" },
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = true,
		mini = true,
		alpha = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		lsp_saga = true,
		mason = true,
		noice = false,
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
			inlay_hints = {
				background = true,
			},
		},
		telescope = {
			enabled = true,
		},
		illuminate = {
			enabled = true,
			lsp = false,
		},
		which_key = true,
		flash = true,
	},
	color_overrides = {},
	custom_highlights = function(colors)
		return {
			-- native nvim
			VertSplit = { fg = colors.peach, bold = true },
			CursorLineNr = { fg = colors.lavender, bold = true },

			-- alpha
			AlphaHeader = { fg = colors.yellow },
			AlphaFooter = { fg = colors.surface1 },
			AlphaButtonIcon1 = { fg = colors.green },
			AlphaButtonIcon2 = { fg = colors.peach },
			AlphaButtonIcon3 = { fg = colors.maroon },
			AlphaButtonIcon4 = { fg = colors.blue },
			AlphaButtonIcon5 = { fg = colors.flamingo },
			AlphaButtonIcon6 = { fg = colors.teal },
			AlphaButtonIcon7 = { fg = colors.teal },
			AlphaButtonIcon8 = { fg = "#a1aab8" },
			AlphaButtonIcon9 = { fg = colors.red },
			AlphaButtonTxt = { fg = colors.text },
			AlphaButtonShortcut = { fg = colors.text },

			-- NvimTree
			NvimTreeWinSeparator = { fg = colors.peach, bold = true },

			-- noice
			NoiceCmdlineIcon = { fg = colors.yellow, bg = colors.base },
			NoiceCmdlineIconSearch = { fg = colors.yellow, bg = colors.base },
			NoicePopupmenu = { bg = colors.base }, -- change to NormalFloat to make it look like other floats
			NoicePopupmenuBorder = { fg = colors.overlay2, bg = colors.base }, -- border highlight
			NoicePopupmenuSelected = { bg = colors.surface1 }, -- used for highlighting the selected item
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
			GitSignsAdd = { fg = colors.green, bg = colors.base, bold = true },
			GitSignsDelete = { fg = colors.red, bg = colors.base, bold = true },
			GitSignsChange = { fg = colors.blue, bg = colors.base, bold = true },

			-- WhichKey
			WhichKeyFloat = { bg = colors.base }, -- the background color of the float window
			WhichKey = { fg = colors.maroon },
			WhichKeyBorder = { fg = colors.overlay2 },
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
			TreesitterContext = { bold = true },
			TreesitterContextLineNumber = { link = "CursorLineNr" },

			-- CmpItemKindCopilot = { fg = colors.mauve },
		}
	end,
})

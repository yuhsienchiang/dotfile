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

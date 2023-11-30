return {
	"folke/flash.nvim",
	event = "VeryLazy",
    enabled=true,
	opts = {
        labels = "asdfghjklqwertyuiopzxcvbnm",
		search = {
			multi_window = false,
			forward = true,
			-- when `false`, find only matches in the given direction
			wrap = true,
			mode = "exact",
			-- behave like `incsearch`
			incremental = false,
			exclude = {
				"notify",
				"cmp_menu",
				"noice",
				"flash_prompt",
				function(win)
					-- exclude non-focusable windows
					return not vim.api.nvim_win_get_config(win).focusable
				end,
			},
		},
		jump = {
			-- save location in the jumplist
			jumplist = true,
			-- jump position
			pos = "start",
			-- add pattern to search history
			history = false,
			-- add pattern to search register
			register = false,
			-- clear highlight after jump
			nohlsearch = false,
			-- automatically jump when there is only one match
			autojump = false,
			-- You can force inclusive/exclusive jumps by setting the
			-- `inclusive` option. By default it will be automatically
			-- set based on the mode.
			-- jump position offset. Not used for range jumps.
			-- 0: default
			-- 1: when pos == "end" and pos < current position
			offset = nil,
		},
		label = {
			uppercase = true,
			-- add a label for the first match in the current window.
			-- you can always jump to the first match with `<CR>`
			current = true,
			-- show the label after the match
			after = true,
			-- show the label before the match
			before = false,
			-- position of the label extmark
			style = "overlay",
			-- flash tries to re-use labels that were already assigned to a position,
			-- when typing more characters. By default only lower-case labels are re-used.
			reuse = "lowercase",
			-- for the current window, label targets closer to the cursor first
			distance = true,
			-- minimum pattern length to show labels
			-- Ignored for custom labelers.
			min_pattern_length = 0,
			-- Enable this to use rainbow colors to highlight labels
			-- Can be useful for visualizing Treesitter ranges.
			rainbow = {
				enabled = false,
			},
			-- With `format`, you can change how the label is rendered.
			-- Should return a list of `[text, highlight]` tuples.
			format = function(opts)
				return { { opts.match.label, opts.hl_group } }
			end,
		},
		highlight = {
			-- show a backdrop with hl FlashBackdrop
			backdrop = true,
			-- Highlight the search matches
			matches = true,
			-- extmark priority
			priority = 5000,
			groups = {
				match = "FlashMatch",
				current = "FlashCurrent",
				backdrop = "FlashBackdrop",
				label = "FlashLabel",
			},
		},
		modes = {
			-- options used when flash is activated through
			-- a regular search with `/` or `?`
			search = {
				-- when `true`, flash will be activated during regular search by default.
				enabled = true,
				highlight = { backdrop = true },
			},
			-- options used when flash is activated through
			-- `f`, `F`, `t`, `T`, `;` and `,` motions
			char = {
				enabled = true,
				-- dynamic configuration for ftFT motions
				config = function(opts)
					-- autohide flash when in operator-pending mode
					opts.autohide = vim.fn.mode(true):find("no") and vim.v.operator == "y"

					-- disable jump labels when enabled and when using a count
                    opts.jump_labels = opts.jump_labels and vim.v.count == 0

					-- Show jump labels only in operator-pending mode
					-- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
				end,
				-- hide after jump when not using jump labels
				autohide = false,
				-- show jump labels
				jump_labels = false,
				-- set to `false` to use the current line only
				multi_line = true,
				-- When using jump labels, don't use these keys
				-- This allows using those keys directly after the motion
				label = { exclude = "hjkliardc" },
				-- by default all keymaps are enabled, but you can disable some of them,
				-- by removing them from the list.
				-- If you rather use another key, you can map them
				-- to something else, e.g., { [";"] = "L", [","] = H }
				keys = { "f", "F", "t", "T", ";", ","},
				-- The direction for `prev` and `next` is determined by the motion.
				-- `left` and `right` are always left and right.
				char_actions = function(motion)
					return {
						[";"] = "next", -- set to `right` to always go right
						[","] = "prev", -- set to `left` to always go left
						-- clever-f style
						[motion:lower()] = "next",
						[motion:upper()] = "prev",
						-- jump2d style: same case goes next, opposite case goes prev
						-- [motion] = "next",
						-- [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
					}
				end,
				search = { wrap = false },
				highlight = { backdrop = true },
				jump = { register = false },
			},
			treesitter = {
				labels = "abcdefghijklmnopqrstuvwxyz",
				jump = { pos = "range" },
				search = { incremental = false },
				label = { before = true, after = true, style = "inline" },
				highlight = {
					backdrop = false,
					matches = false,
				},
			},
			treesitter_search = {
				jump = { pos = "range" },
				search = {
                    multi_window = false,
                    wrap = true,
                    incremental = false
                },
				remote_op = { restore = true },
				label = { before = true, after = true, style = "inline" },
			},
			-- options used for remote flash
			remote = {
				remote_op = { restore = true, motion = true },
			},
		},
		prompt = {
			enabled = true,
			prefix = { { " ⚡", "FlashPromptIcon" } },
			win_config = {
				relative = "editor",
				width = 1, -- when <=1 it's a percentage of the editor width
				height = 1,
				row = -1, -- when negative it's an offset from the bottom
				col = 0, -- when negative it's an offset from the right
				zindex = 1000,
			},
		},
		-- options for remote operator pending mode
		remote_op = {
			-- restore window views and cursor position
			-- after doing a remote operation
			restore = false,
			-- For `jump.pos = "range"`, this setting is ignored.
			-- `true`: always enter a new motion when doing a remote operation
			-- `false`: use the window's cursor position and jump target
			-- `nil`: act as `true` for remote windows, `false` for the current window
			motion = false,
		},
	},
	keys = {
		{
			"s",
			mode = { "n", "o", "x" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"S",
			mode = { "n", "o", "x" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},
	},
}

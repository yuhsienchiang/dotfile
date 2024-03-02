return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	cmd = "Telescope",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			enabled = vim.fn.executable("make") == 1,
		},
        {
            "nvim-telescope/telescope-ui-select.nvim",
        },
	},
	config = function()
		local telescope_setup, telescope = pcall(require, "telescope")
		if not telescope_setup then
			print("telescope not found")
			return
		end

		-- import telescope.actions safely
		local actions_setup, actions = pcall(require, "telescope.actions")
		if not actions_setup then
			print("telescope.actions not found")
			return
		end

		local themes_setup, themes = pcall(require, "telescope.themes")
		if not themes_setup then
			print("telescope.themes not found")
			return
		end

		local extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
            ["ui-select"] = {
                themes.get_dropdown({})
            },
		}

		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						height = 0.8, -- the height of the telescope window (relative to the vim window
						width = 0.8, -- the width of the telescope window (relative to the vim window
						preview_width = 0.4, -- the width percentage of the preview window (relative to the telescope window)
						preview_cutoff = 120,
						prompt_position = "bottom",
					},
					scroll_speed = 5,
				},
				mappings = {
					n = {
						["<C-v>"] = actions.select_vertical,
						["<C-s>"] = actions.select_horizontal,
						["<C-t>"] = actions.select_tab,
						["<C-j>"] = actions.preview_scrolling_up,
						["<C-k>"] = actions.preview_scrolling_down,
					},
					i = {
						["<C-v>"] = actions.select_vertical,
						["<C-s>"] = actions.select_horizontal,
						["<C-t>"] = actions.select_tab,
						["<C-j>"] = actions.preview_scrolling_up,
						["<C-k>"] = actions.preview_scrolling_down,
					},
				},
				prompt_prefix = " 󰍉 ",
				selection_caret = "    ",
				multi_icon = " + ",
				entry_prefix = "       ",
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			},
			pickers = {
				find_files = {
					hidden = false,
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
					sorting_strategy = "ascending",
					layout_strategy = "center",
					layout_config = {
						center = {
							width = 0.5,
							height = 0.5,
						},
					},
					borderchars = {
						prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
						results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
					},
					prompt_title = false,
					results_title = false,
					previewer = false,
				},
				grep_string = { hidden = true },
				live_grep = { hidden = true },
				buffers = {
					hidden = true,
					mappings = {
						n = {
							["<C-d>"] = actions.delete_buffer,
						},
						i = {
							["<C-d>"] = actions.delete_buffer,
						},
					},
				},
				oldfiles = {
					hidden = false,
					find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
				},
			},
			extensions = extensions,
		})
		telescope.load_extension("fzf")
		telescope.load_extension("noice")
        telescope.load_extension("ui-select")
	end,
}

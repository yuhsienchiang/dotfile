return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha_setup, alpha = pcall(require, "alpha")
		if not alpha_setup then
			return
		end

		-- import layout template
		local dashboard_theme_setup, dashboard_theme = pcall(require, "alpha.themes.dashboard")
		if not dashboard_theme_setup then
			return
		end

		local vim_api = vim.api

		-------------------
		-- Header Config --
		-------------------
		-- ascii generator
		-- https://patorjk.com/software/taag/#p=display&v=0&f=ANSI%20Shadow&t=NEOVIM
		dashboard_theme.section.header.val = {
			"                                                                                 ",
			"                                                                                 ",
			"   ██████╗ ██████╗ ██████╗ ███████╗            ██████╗ ██████╗ ██████╗ ███████╗  ",
			"  ██╔════╝██╔═══██╗██╔══██╗██╔════╝  ██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝  ",
			"  ██║     ██║   ██║██║  ██║█████╗    ╚═╝      ██║     ██║   ██║██║  ██║█████╗    ",
			"  ██║     ██║   ██║██║  ██║██╔══╝    ██╗      ██║     ██║   ██║██║  ██║██╔══╝    ",
			"  ╚██████╗╚██████╔╝██████╔╝███████╗  ╚═╝      ╚██████╗╚██████╔╝██████╔╝███████╗  ",
			"   ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝            ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝  ",
			"                                                                                 ",
			"                                                                                 ",
		}
		dashboard_theme.section.header.opts.hl = "AlphaHeader"

		-------------------
		-- Button Config --
		-------------------
		local function button(usr_opts, txt, keybind, keybind_opts)
			local if_nil = vim.F.if_nil
			local sc_after = usr_opts.shortcut:gsub("%s", ""):gsub("SPC", "<leader>")

			local default_opts = {
				position = "center",
				cursor = 6,
				width = 50,
				align_shortcut = "right",
				hl_shortcut = "AlphaButtonShortcut",
			}

			local opts = vim.tbl_deep_extend("force", default_opts, usr_opts)

			if nil == keybind then
				keybind = sc_after
			end

			keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
			opts.keymap = { "n", sc_after, keybind, keybind_opts }

			local function on_press()
				local key = vim_api.nvim_replace_termcodes(keybind or sc_after .. "<Ignore>", true, false, true)
				vim_api.nvim_feedkeys(key, "t", false)
			end

			return {
				type = "button",
				val = txt,
				on_press = on_press,
				opts = opts,
			}
		end

		dashboard_theme.section.buttons.val = {
			button({ shortcut = "n", hl = { { "AlphaButtonIcon1", 0, 8  }, { "AlphaButtonTxt", 8, 50  } } }, "     New file", ":ene <BAR> startinsert <CR>"),
			button({ shortcut = "r", hl = { { "AlphaButtonIcon2", 0, 8  }, { "AlphaButtonTxt", 8, 50  } } }, "     Recent file", ":Telescope oldfiles <CR>"),
			button({ shortcut = "e", hl = { { "AlphaButtonIcon3", 0, 9  }, { "AlphaButtonTxt", 9, 50  } } }, "󰙅     Explorer", ":NvimTreeOpen <CR>" ),
			button({ shortcut = "f", hl = { { "AlphaButtonIcon4", 0, 11 }, { "AlphaButtonTxt", 10, 50 } } }, "    Find files", ":Telescope find_files <CR>"),
			button({ shortcut = "w", hl = { { "AlphaButtonIcon5", 0, 12 }, { "AlphaButtonTxt", 11, 50 } } }, " 󰊄   Find word",":Telescope live_grep <CR>"),
			button({ shortcut = "u", hl = { { "AlphaButtonIcon6", 0, 10 }, { "AlphaButtonTxt", 10, 50 } } }, "󰦛    Restore last", ":lua require('persistence').load({last = true})<CR>"),
			button({ shortcut = "U", hl = { { "AlphaButtonIcon7", 0, 10 }, { "AlphaButtonTxt", 10, 50 } } }, "󰦛    Restore here", ":lua require('persistence').load()<CR>"),
			button({ shortcut = "s", hl = { { "AlphaButtonIcon8", 0, 8  }, { "AlphaButtonTxt", 8, 50  } } }, "     Settings", ":e $MYVIMRC | :cd %:p:h<CR>"),
			button({ shortcut = "q", hl = { { "AlphaButtonIcon9", 0, 8  }, { "AlphaButtonTxt", 8, 50  } } }, "     Quit", ":qa<CR>"),
		}

		-------------------
		-- Footer Config --
		-------------------
		dashboard_theme.section.footer.val = {
			"Pause and Pray | Jesus over everything",
		}
		dashboard_theme.section.footer.opts.hl = "AlphaFooter"

		--------------------
		-- Padding Config --
		--------------------
		-- ┌──────────────────────────────────────────────────────────┐ ─┐
		-- │        │                                                 │  │
		-- │    pad_1                                                 │  │
		-- │        └──          ┌──────────────┐ ───┐                │  │
		-- │                     │    header    │    h_buttons        │  │
		-- │        ┌──          └──────────────┘ ───┘                │  │
		-- │    pad_2                                                 │  │
		-- │        │                                                 │  │
		-- │        └──       ┌────────────────────┐ ──┐              │  │
		-- │                  │       button       │   │              │  │
		-- │                  │       button       │   h_buttons      │  │--- vim.o.lines
		-- │                  │       button       │   │              │  │
		-- │        ┌──       └────────────────────┘ ──┘              │  │
		-- │        │                                                 │  │
		-- │    pad_3                                                 │  │
		-- │        └──          ┌──────────────┐ ───┐                │  │
		-- │                     │    footer    │    h_footer         │  │
		-- │                     └──────────────┘ ───┘                │  │
		-- │                                                          │  │
		-- └──────────────────────────────────────────────────────────┘ ─┘

		local h_header = #dashboard_theme.section.header.val
		local h_buttons = #dashboard_theme.section.buttons.val * 2 - 1
		local h_footer = #dashboard_theme.section.footer.val
		local pad_tot = vim.o.lines - (h_header + h_buttons + h_footer)
		local pad_1 = math.ceil(pad_tot * 0.25)
		local pad_2 = math.ceil(pad_tot * 0.20)
		local pad_3 = math.floor(pad_tot * 0.30)
		local pad_last = pad_tot - pad_1 - pad_2 - pad_3

		-------------------
		-- Layout Config --
		-------------------
        if pad_tot < 4 then
            dashboard_theme.config.layout = {
                { type = "padding", val = 4 },
                dashboard_theme.section.buttons,
                { type = "padding", val = 4 },
            }
        else
            dashboard_theme.config.layout = {
                { type = "padding", val = pad_1 },
                dashboard_theme.section.header,
                { type = "padding", val = pad_2 },
                dashboard_theme.section.buttons,
                { type = "padding", val = pad_3 },
                dashboard_theme.section.footer,
                { type = "padding", val = pad_last },
            }
        end

		dashboard_theme.opts.opts.noautocmd = true

        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "DashboardLoaded",
                callback = function()
                    require("lazy").show()
                end,
            })
        end

        alpha.setup(dashboard_theme.opts)
	end,
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
	defaults = {
		lazy = false, -- should plugins be lazy-loaded?
		version = nil,
		cond = nil,
		-- version = "*", -- enable this to try installing the latest stable versions of plugins
	},
	spec = nil,
	lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
	install = {
		missing = true,
		-- try to load one of these colorschemes when starting an installation during startup
		colorscheme = { "catppuccin", "nordic", "tokyonight" },
	},
	ui = {
		-- a number <1 is a percentage., >1 is a fixed size
		size = { width = 0.8, height = 0.8 },
		wrap = true, -- wrap the lines in the ui
		border = "single",
		title = "Lazy",
		title_pos = "center",
		-- Show pills on top of the Lazy window
		pills = true,
		icons = {
			cmd = " ",
			event = " ",
			plugin = " ",
			source = " ",
			start = " ",
			lazy = " 󰒲",
			config = "",
			ft = " ",
			init = " ",
			import = " ",
			keys = " ",
			loaded = "●",
			not_loaded = "○",
			runtime = " ",
			task = "✔ ",
			list = {
				"●",
				"➜",
				"★",
				"‒",
			},
		},
		throttle = 20, -- how frequently should the ui process render events
		custom_keys = {},
	},
	diff = {
		-- diff command <d> can be one of:
		-- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
		--   so you can have a different command for diff <d>
		-- * git: will run git diff and open a buffer with filetype git
		-- * terminal_git: will open a pseudo terminal with git diff
		-- * diffview.nvim: will open Diffview to show the diff
		cmd = "git",
	},
	checker = {
		-- automatically check for plugin updates
		enabled = false,
		concurrency = nil,
		notify = true, -- get a notification when new updates are found
		frequency = 360000, -- check for updates every hour
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = true, -- get a notification when changes are found
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			paths = {}, -- add any custom paths here that you want to includes in the rtp
			disabled_plugins = {
				-- "gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				-- "tarPlugin",
				-- "tohtml",
				-- "tutor",
				-- "zipPlugin",
			},
		},
	},
	-- lazy can generate helptags from the headings in markdown readme files,
	-- so :help works even for plugins that don't have vim docs.
	-- when the readme opens with :help it will be correctly displayed as markdown
	readme = {
		enabled = true,
		root = vim.fn.stdpath("state") .. "/lazy/readme",
		files = { "README.md", "lua/**/README.md" },
		-- only generate markdown helptags for plugins that dont have docs
		skip_if_doc_exists = true,
	},
	state = vim.fn.stdpath("state") .. "/lazy/state.json", -- state info for checker and other things
	build = {
		-- Plugins can provide a `build.lua` file that will be executed when the plugin is installed
		-- or updated. When the plugin spec also has a `build` command, the plugin's `build.lua` not be
		-- executed. In this case, a warning message will be shown.
		warn_on_override = true,
	},
}

local lazy_status, lazy = pcall(require, "lazy")
if not lazy_status then
	return
end

vim.g.mapleader = " "

lazy.setup({
	{ import = "yuhsienchiang.plugins" },
	{ import = "yuhsienchiang.plugins.lsp" },
}, opts)

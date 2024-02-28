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
	},
	lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
	install = {
		missing = true,
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
	checker = {
		-- automatically check for plugin updates
		enabled = false,
		concurrency = nil,
		notify = true, -- get a notification when new updates are found
		frequency = 360000, -- check for updates every hour
	},
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	state = vim.fn.stdpath("state") .. "/lazy/state.json", -- state info for checker and other things
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

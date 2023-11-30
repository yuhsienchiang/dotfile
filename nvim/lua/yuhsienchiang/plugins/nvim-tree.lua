return {
	"nvim-tree/nvim-tree.lua",
	module = true,
	config = function()
		--        vim.g.loaded_netrw = 1
		--        vim.g.loaded_netrwPlugin = 1

		local function on_attach(bufnr)
			local tree_api_setup, tree_api = pcall(require, "nvim-tree.api")
			if not tree_api_setup then
				return
			end

			local opts = function(desc)
				return { desc = "nvim-tree: " .. desc, noremap = true, silent = true, nowait = true, buffer = bufnr }
			end

			vim.keymap.set("n", "<CR>", tree_api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "w", tree_api.tree.collapse_all, opts("Close All Directory"))
			vim.keymap.set("n", "v", tree_api.node.open.vertical, opts("Open: Vertical Split"))
			vim.keymap.set("n", "s", tree_api.node.open.horizontal, opts("Open: Horizontal Split"))
			vim.keymap.set("n", "t", tree_api.node.open.tab, opts("Open: Tab"))

            -- Navigation
			vim.keymap.set("n", "]", tree_api.tree.change_root_to_node, opts("DOWN"))
			vim.keymap.set("n", "[", tree_api.tree.change_root_to_parent, opts("UP"))

            -- File manipulation
			vim.keymap.set("n", "a", tree_api.fs.create, opts("Create"))
			vim.keymap.set("n", "d", tree_api.fs.remove, opts("Delete"))
			vim.keymap.set("n", "c", tree_api.fs.copy.node, opts("Copy: file"))
			vim.keymap.set("n", "x", tree_api.fs.cut, opts("Cut"))
			vim.keymap.set("n", "p", tree_api.fs.paste, opts("Paste"))
			vim.keymap.set("n", "r", tree_api.fs.rename, opts("Rename"))
			vim.keymap.set("n", "f", tree_api.live_filter.start, opts("Filter"))

			vim.keymap.set("n", "y", tree_api.fs.copy.filename, opts("Copy: filename"))
			vim.keymap.set("n", "Y", tree_api.fs.copy.relative_path, opts("Copy: relative path"))

			vim.keymap.set("n", "R", tree_api.tree.reload, opts("Refresh"))
			vim.keymap.set("n", "?", tree_api.tree.toggle_help, opts("Help"))
		end

		local setup, nvimtree = pcall(require, "nvim-tree")
		if not setup then
			return
		end

		nvimtree.setup({
			disable_netrw = false,
			view = {
				width = 35,
			},
			git = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = false,
			},

			filters = {
				dotfiles = false,
				git_ignored = false,
			},

			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
					inline_arrows = false,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
				icons = {
					webdev_colors = true,
					git_placement = "after",
					modified_placement = "after",
					padding = " ",
					show = {
						file = true,
						folder = true,
						folder_arrow = false,
						git = true,
						modified = true,
					},
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},

			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			diagnostics = {
				enable = true,
				debounce_delay = 100,
				show_on_dirs = true,
				show_on_open_dirs = false,
				icons = { hint = "", info = "", warning = "", error = "" },
			},
			on_attach = on_attach,
		})
	end,
}

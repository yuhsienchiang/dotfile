return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
    -- dependencies = { "williamboman/mason-lspconfig.nvim", "jay-babu/mason-null-ls.nvim" },
	build = ":MasonUpdate",
	config = function()
		local mason_status, mason = pcall(require, "mason")
		if not mason_status then
			print("mason not found")
			return
		end

		local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
		if not mason_lspconfig_status then
			print("mason_lspconfig not found")
			return
		end

        -- local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
        -- if not mason_null_ls_status then
        --     print("mason_null_ls not found")
        --     return
        -- end

		local mason_tool_installer_status, mason_tool_installer = pcall(require, "mason-tool-installer")
		if not mason_tool_installer_status then
			print("mason_tool_installer not found")
			return
		end

		local lspconfig_status, lspconfig = pcall(require, "lspconfig")
		if not lspconfig_status then
			return
		end
		local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		if not cmp_nvim_lsp_status then
			return
		end

		local lsp_server = {
			"clangd",
			"dotls",
			"hls",
			"jsonls",
			"jdtls",
			"lua_ls",
			"marksman",
			"pyright",
			"yamlls",
            "bashls",
		}

		local formatter = {
			"clang-format",
			"stylua", -- lua formatter
			"black",
            "isort",
			"prettier",
		}

		mason.setup({

			ui = {
				-- Whether to automatically check for new versions when opening the :Mason window.
				check_outdated_packages_on_open = true,
				border = "rounded",
				width = 0.8,
				height = 0.9,
				icons = {
					-- The list icon to use for installed packages.
					package_installed = "",
					-- The list icon to use for packages that are installing, or queued for installation.
					package_pending = "",
					-- The list icon to use for packages that are not installed.
					package_uninstalled = "",
				},

				keymaps = {
					-- Keymap to expand a package
					toggle_package_expand = "<CR>",
					-- Keymap to install the package under the current cursor position
					install_package = "i",
					-- Keymap to reinstall/update the package under the current cursor position
					update_package = "u",
					-- Keymap to check for new version for the package under the current cursor position
					check_package_version = "c",
					-- Keymap to update all installed packages
					update_all_packages = "U",
					-- Keymap to check which installed packages are outdated
					check_outdated_packages = "C",
					-- Keymap to uninstall a package
					uninstall_package = "X",
					-- Keymap to cancel a package installation
					cancel_installation = "<C-c>",
					-- Keymap to apply language filter
					apply_language_filter = "<C-f>",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = lsp_server,
			automatic_installation = true,
		})

        -- mason_null_ls.setup({
        --     -- list of formatters & linters for mason to install
        --     ensure_installed = formatter,
        --     automatic_installation = true,
        -- })

		mason_tool_installer.setup({
			ensure_installed = formatter,
            run_on_start = true,
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				local opts = {
					on_attach = function(_, bufnr)
						local opts = function(desc)
							return { desc = desc, noremap = true, silent = true, buffer = bufnr }
						end
						local keymap = vim.keymap

						local which_key_status, which_key = pcall(require, "which-key")
						if not which_key_status then
							print("which-key not found")
							return
						end

						-- set keybinds
						keymap.set("n", "<leader>df", "<cmd>Lspsaga finder<CR>", opts("Show references/definition")) -- show definition, references
						keymap.set("n", "<leader>dd", "<cmd>Lspsaga peek_definition<CR>", opts("Show definition")) -- see definition and make edits in window
						keymap.set("n", "<leader>da", "<cmd>Lspsaga code_action<CR>", opts("Show code actions")) -- see available code actions
						keymap.set("n", "<leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts("Show diagnostics for cursor")) -- show diagnostics for cursor
						keymap.set("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>",opts("Show diagnostics for line")) -- show  diagnostics for line
						keymap.set("n", "<leader>db", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts("Show diagnostics for buffer"))
						keymap.set("n", "<leader>dh", "<cmd>Lspsaga hover_doc<CR>", opts("Show hover doc under cursor")) -- show documentation for what is under cursor
						keymap.set({ "n", "i" }, "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts("Show signature help"))
					end,

					capabilities = cmp_nvim_lsp.default_capabilities(),
				}

				local require_ok, server = pcall(require, "yuhsienchiang.plugins.lsp.settings." .. server_name)
				if require_ok then
					opts = vim.tbl_deep_extend("force", server, opts)
				end

				lspconfig[server_name].setup(opts)
			end,
		})
	end,
}

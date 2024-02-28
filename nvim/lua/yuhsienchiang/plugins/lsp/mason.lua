return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	build = ":MasonUpdate",
	config = function()
		local mason_status, mason = pcall(require, "mason")
		if not mason_status then
			print("mason not found")
			return
		end

		mason.setup({
			ui = {
				-- Whether to automatically check for new versions when opening the :Mason window.
				check_outdated_packages_on_open = true,
				border = "rounded",
				width = 0.8,
				height = 0.9,
				icons = {
					package_installed = "",
					package_pending = "",
					package_uninstalled = "",
				},

				keymaps = {
					toggle_package_expand = "<CR>",
					install_package = "i",
					update_package = "u",
					check_package_version = "c",
					update_all_packages = "U",
					check_outdated_packages = "C",
					uninstall_package = "X",
					cancel_installation = "<C-c>",
					apply_language_filter = "<C-f>",
				},
			},
		})
	end,
}

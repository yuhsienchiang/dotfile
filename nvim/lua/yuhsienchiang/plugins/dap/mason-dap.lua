return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = "mason.nvim",
	lazy = true,
	cmd = { "DapInstall", "DapUninstall" },
	opts = {
		automatic_installation = true,
		ensure_installed = { "python" },
	},
}

return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    config = function()
        require("mason").setup({
            ui = {
                check_outdated_packages_on_open = true,
                border = "none",
                icons = {
                    package_pending = " ",
                    package_installed = " ",
                    package_uninstalled = "󰚌 ",
                },
            },
        })
    end,
}

return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
        ui = {
            check_outdated_packages_on_open = true,
            border = "single",
            width = 0.55,
            height = 0.75,
            icons = {
                package_pending = " ",
                package_installed = " ",
                package_uninstalled = "󰚌 ",
            },
        },
    },
}

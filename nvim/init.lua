if not vim.g.vscode then
    local theme_name = "catppuccin"

    require("yuhsienchiang.lazy")
    require("yuhsienchiang.core")

    local theme_status, _ = pcall(require, "yuhsienchiang.plugins.theme." .. theme_name)
    if theme_status then
        vim.cmd.colorscheme(theme_name)
    else
        print("theme not found")
    end
end

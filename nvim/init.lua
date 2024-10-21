if not vim.g.vscode then
    vim.g.mapleader = " "
    vim.g.maplocalleader = "\\"
    require("yuhsienchiang.lazy")
    require("yuhsienchiang.core")
end

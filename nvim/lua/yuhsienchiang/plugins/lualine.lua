return {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
    config = function()
        local catppuccin_color = require("catppuccin.palettes").get_palette("mocha")

        require("lualine").setup({
            options = {
                theme = require("yuhsienchiang.util.lualine_theme").get_catppuccin_theme("mocha"),
                icons_enabled = true,
                always_divide_middle = true,
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {
                        "checkhealth",
                        "dashboard",
                        "help",
                        "NvimTree",
                        "lazy",
                        "lspinfo",
                        "mason",
                        "startuptime",
                    },
                    winbar = {
                        "checkhealth",
                        "dashboard",
                        "help",
                        "lazy",
                        "lspinfo",
                        "mason",
                        "NvimTree",
                        "startuptime",
                    },
                },
            },
            -- lualine for active/focus window
            sections = {
                lualine_a = {
                    {
                        function()
                            return " 󰐁"
                        end,
                        component_separators = { left = "", right = "" },
                        section_separators = { left = "", right = "" },
                        padding = 0,
                    },
                },
                lualine_b = {
                    {
                        "filename",
                        file_status = true,
                        newfile_status = true,
                        symbols = {
                            modified = " ●",
                            unnamed = "[No Name]",
                            newfile = "[New]",
                        },
                        padding = { left = 1, right = 1 },
                        separator = { left = "", right = " " },
                    },
                },
                lualine_c = {
                    {
                        "branch",
                        fmt = function(str)
                            local strw = vim.api.nvim_strwidth(str)
                            if strw > 20 then
                                return ("%s..."):format(str:sub(1, 19))
                            end
                            return str
                        end,
                    },
                },
                lualine_x = {
                    {
                        function()
                            return require("noice").api.status.mode.get()
                        end,
                        cond = function()
                            return package.loaded["noice"] and require("noice").api.status.mode.has()
                        end,
                        color = { fg = catppuccin_color.overlay1, bg = catppuccin_color.base },
                    },
                },
                lualine_y = {
                    {
                        require("yuhsienchiang.util.venv").activated_venv,
                        color = { fg = catppuccin_color.overlay1, bg = catppuccin_color.base },
                    },
                    {
                        require("yuhsienchiang.util.harpoon_action").harpoon_lualine,
                        color = { fg = catppuccin_color.overlay1, bg = catppuccin_color.base },
                    },
                    {
                        "diff",
                        symbols = {
                            added = " ",
                            modified = " ",
                            removed = " ",
                        },
                        source = function()
                            local gitsigns = vim.b.gitsigns_status_dict
                            if gitsigns then
                                return {
                                    added = gitsigns.added,
                                    modified = gitsigns.changed,
                                    removed = gitsigns.removed,
                                }
                            end
                        end,
                        color = { bg = catppuccin_color.base },
                    },
                },
                lualine_z = {
                    {
                        "filetype",
                        colored = false,
                        color = { fg = catppuccin_color.maroon, bg = catppuccin_color.base },
                        separator = "|",
                    },
                },
            },
            -- lualine for inactive/unfoucus window
            inactive_sections = {
                lualine_a = {
                    {
                        "filename",
                        file_status = true,
                        newfile_status = true,
                        symbols = {
                            modified = " ●",
                            unnamed = "[No Name]",
                            newfile = "[New]",
                        },
                        padding = { left = 1, right = 1 },
                        separator = { left = "", right = "" },
                    },
                },
                lualine_b = {
                    {
                        "branch",
                        fmt = function(str)
                            local strw = vim.api.nvim_strwidth(str)
                            if strw > 20 then
                                return ("%s..."):format(str:sub(1, 19))
                            end
                            return str
                        end,
                    },
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}

return {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
    config = function()
        local theme_flavour = "frappe"
        local catppuccin_color = require("catppuccin.palettes").get_palette(theme_flavour)
        local Util = require("yuhsienchiang.util.lualine_util")
        require("lualine").setup({
            options = {
                theme = Util.get_catppuccin_theme(theme_flavour),
                icons_enabled = true,
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {
                        "Avante", "AvanteInput", "AvanteSelectedFiles",
                        "checkhealth",
                        "dap-repl",
                        "dapui_scopes", "dapui_stacks", "dapui_breakpoints", "dapui_watches", "dapui_console",
                        "help",
                        "lazy",
                        "lspinfo",
                        "mason",
                        "NvimTree",
                        "oil",
                        "snacks_dashboard",
                        "startuptime",
                        "trouble",
                    },
                    winbar = {
                        "Avante", "AvanteInput", "AvanteSelectedFiles",
                        "checkhealth",
                        "dap-repl",
                        "dapui_scopes", "dapui_stacks", "dapui_breakpoints", "dapui_watches", "dapui_console",
                        "help",
                        "lazy",
                        "lspinfo",
                        "mason",
                        "NvimTree",
                        "neotest-output",
                        "neotest-output-panel",
                        "neotest-summary",
                        "oil",
                        "snacks_dashboard",
                        "startuptime",
                        "trouble",
                    },
                },
            },
            -- lualine for active/focus window
            sections = {
                lualine_a = {
                    {
                        "mode",
                        separator = { left = "", right = "" },
                        right_padding = 2,
                    },
                },
                lualine_b = {
                    {
                        "filename",
                        file_status = true,
                        newfile_status = true,
                        symbols = {
                            modified = "●",
                            unnamed = "[No Name]",
                            newfile = "[New]",
                        },
                    },
                },
                lualine_c = {
                    {
                        "branch",
                        icon = " ",
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
                        function() return require("noice").api.status.mode.get() end,
                        cond = function()
                            return package.loaded["noice"] and require("noice").api.status.mode.has()
                        end,
                    },
                    {
                        require("yuhsienchiang.util.venv_util").activated_venv,
                        cond = function () return vim.bo.filetype == "python" end,
                    },
                    {
                        require("yuhsienchiang.util.harpoon_util").harpoon_lualine,
                    },
                },
                lualine_y = {
                    {
                        require("yuhsienchiang.util.lsp_util").diagnostic_alert,
                        color = { fg = catppuccin_color.subtext0, bg = catppuccin_color.surface0 },
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
                    },
                },
                lualine_z = {
                    {
                        "filetype",
                        colored = false,
                        color = { fg = catppuccin_color.base, bg = catppuccin_color.lavender, gui = "bold" },
                        separator = { left = "", right = "" },
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
                            modified = "●",
                            unnamed = "[No Name]",
                            newfile = "[New]",
                        },
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
            },
            winbar = {
                lualine_c = {
                    {
                        "filetype",
                        colored = true,
                        icon_only = true,
                    },
                    {
                        "filename",
                        file_status = true,
                        newfile_status = true,
                        symbols = {
                            modified = "●",
                            unnamed = "[No Name]",
                            newfile = "[New]",
                        },
                        color = { fg = catppuccin_color.subtext0, bg = catppuccin_color.base, gui = "bold" },
                    },
                },
            },
            inactive_winbar = {
                lualine_c = {
                    {
                        "filetype",
                        colored = false, -- Displays filetype icon in color if set to true
                        icon_only = true, -- Display only an icon for filetype
                    },
                    {
                        "filename",
                        file_status = true,
                        newfile_status = true,
                        symbols = {
                            modified = "●",
                            unnamed = "[No Name]",
                            newfile = "[New]",
                        },
                        color = { fg = catppuccin_color.overlay1, bg = catppuccin_color.base },
                    },
                },
            },
        })
    end,
}

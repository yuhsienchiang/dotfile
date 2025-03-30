return {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets", "L3MON4D3/LuaSnip" },
    opts = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        local luasnip_util = require("yuhsienchiang.util.luasnip_util")

        return {
            enabled = function()
                return not vim.tbl_contains(
                    { "Avante", "AvanteInput", "AvanteSelectedFiles", "markdown" },
                    vim.bo.filetype
                ) and vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
            end,

            keymap = {
                preset = "none",
                -- selection
                ["<Down>"] = { "select_next", "fallback" },
                ["<Up>"] = { "select_prev", "fallback" },
                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },

                -- snippet
                ["<C-n>"] = { "snippet_forward" },
                ["<C-p>"] = { "snippet_backward" },

                -- confirm and cancel
                ["<CR>"] = { "accept", "fallback" },
                ["<C-e>"] = { "cancel" },

                -- documentation scroll
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            },
            snippets = {
                preset = "luasnip",
                expand = luasnip_util.expand,
                active = luasnip_util.active,
                jump = luasnip_util.jump,
            },
            completion = {
                trigger = {
                    show_on_trigger_character = true,
                    show_on_insert_on_trigger_character = false,
                    show_on_accept_on_trigger_character = true,
                },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = true,
                    },
                },
                menu = {
                    auto_show = true,
                    scrolloff = 1,
                    max_height = 10,
                    min_width = 10,
                    scrollbar = false,
                    border = "single",
                    direction_priority = { "n", "s" },
                    draw = {
                        gap = 1,
                        columns = { { "kind_icon", "kind" }, { "label", "label_description", gap = 5 }, { "source_name" } },
                        components = {
                            label = {
                                ellipsis = true,
                                width = { fill = true, max = 30 },
                            },
                            kind = { width = { max = 4, fill = true } },
                            source_name = {
                                highlight = function(ctx)
                                    return "BlinkCmpSource" .. ctx.source_name
                                end,
                            },
                        },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 550,
                    treesitter_highlighting = true,
                    window = {
                        scrollbar = false,
                        border = "single",
                    },
                },
                ghost_text = { enabled = false },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    lsp = { fallbacks = {} }, -- disable buffer fallbacks
                    path = { fallbacks = {}, opts = { show_hidden_files_by_default = true } },
                },
            },
            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = "normal",
            },

            -- cmdline module
            cmdline = {
                enabled = true,
                sources = function()
                    local type = vim.fn.getcmdtype()
                    if type == ":" or type == "@" then
                        return { "cmdline" }
                    end
                    return {}
                end,
                completion = {
                    menu = {
                        auto_show = true,
                        draw = {
                            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
                        },
                    },
                    list = {
                        selection = {
                            preselect = false,
                            auto_insert = true,
                        },
                    },
                    ghost_text = { enabled = false },
                },
                keymap = {
                    preset = "none",

                    -- cancel cmp before accessing history
                    ["<Down>"] = { function(cmp) cmp.cancel() return false end, "fallback" },
                    ["<Up>"] = { function(cmp) cmp.cancel() return false end, "fallback" },

                    ["<Tab>"] = {},
                    ["<S-Tab>"] = {},
                    ["<C-j>"] = { "select_next", "fallback" },
                    ["<C-k>"] = { "select_prev", "fallback" },
                    ["<CR>"] = { "accept", "fallback" },
                },
            },
        }
    end,
}

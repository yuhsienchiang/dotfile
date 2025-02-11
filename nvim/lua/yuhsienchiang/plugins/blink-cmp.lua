return {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    version = "v0.*",
    dependencies = { "rafamadriz/friendly-snippets", "L3MON4D3/LuaSnip" },
    opts = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        local luasnip_util = require("yuhsienchiang.util.luasnip_util")

        return {
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

                cmdline = {
                    preset = "none",
                    -- cancel cmp before accessing history
                    ["<Down>"] = { function(cmp) cmp.cancel() return false end, "fallback" },
                    ["<Up>"] = { function(cmp) cmp.cancel() return false end, "fallback" },

                    ["<C-j>"] = { "select_next", "fallback" },
                    ["<C-k>"] = { "select_prev", "fallback" },
                    ["<CR>"] = { "accept", "fallback" },
                },
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
                        gap = 2,
                        columns = { { "kind_icon", "kind" }, { "label", "label_description", gap = 1 }, { "source_name" } },
                        components = {
                            label = {
                                ellipsis = true,
                                width = { fill = true, max = 20 },
                            },
                            kind = {
                                width = { max = 4, fill = true },
                                text = function(ctx)
                                    -- don't show "kind if in cmdline" mode
                                    return ctx.source_name == "cmdline" and "" or ctx.kind
                                end,
                            },
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
                    auto_show_delay_ms = 1000,
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
                cmdline = function()
                    local type = vim.fn.getcmdtype()
                    -- only enable completion for : commands
                    if type == ":" then
                        return { "cmdline", "path" }
                    end
                    return {}
                end,
                providers = {
                    lsp = { fallbacks = {} }, -- disable buffer fallbacks
                    path = { fallbacks = {}, opts = { show_hidden_files_by_default = true } },
                    buffer = { max_items = 5 },
                },
            },
            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = "normal",
            },
        }
    end,
}

return {
    "iguanacucumber/magazine.nvim",
    name = "nvim-cmp", -- Otherwise highlighting gets messed up
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        -- snippets
        "L3MON4D3/LuaSnip", -- Snippet Engine
        "rafamadriz/friendly-snippets", -- Bunch of Snippets
        -- sources
        "hrsh7th/cmp-buffer", -- Buffer Completions
        "hrsh7th/cmp-path", -- Path Completions
        "hrsh7th/cmp-cmdline", -- Path Completions
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip", -- Snippet Completions
    },
    config = function()
        local cmp = require("cmp")
        local cmp_compare = require("cmp.config.compare")
        local luasnip = require("luasnip")

        local menu_name = {
            buffer = "Buffer",
            nvim_lsp = "LSP",
            luasnip = "LuaSnip",
            path = "Path",
        }

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = { completeopt = "menu,menuone,noselect,noinsert" },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered({
                    border = "single",
                    side_padding = 1,
                    winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None,FloatBorder:CmpBorder",
                    scrollbar = false,
                }),
                documentation = cmp.config.window.bordered({
                    border = "single",
                    winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
                    scrollbar = false,
                }),
            },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false }),
                ["<C-e>"] = cmp.mapping.close(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-n>"] = cmp.mapping(function(_)
                    if luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { "i", "s" }),
                ["<C-p>"] = cmp.mapping(function(_)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp", priority = 8 }, -- lsp
                { name = "luasnip", priority = 8 }, -- snippets
                { name = "buffer", priority = 7 }, -- text within current buffer
                { name = "nvim_lua", priority = 6 }, -- lsp
                { name = "path", priority = 6 }, -- file system paths
            }),
            formatting = {
                format = function(entry, item)
                    local icons = require("lspkind").symbol_map

                    item.menu = " " .. (menu_name[entry.source.name] ~= nil and menu_name[entry.source.name] or "")
                    item.menu_hl_group = "CmpItemKind" .. (item.kind or "")

                    item.kind = item.kind and icons[item.kind] .. " " or ""
                    item.kind = item.kind or " "

                    return item
                end,
                fields = { "kind", "abbr", "menu" },
            },
            view = {
                entries = { name = "custom", selection_order = "near_cursor", follow_cursor = true },
            },
            sorting = {
                priority_weight = 1.0,
                comparators = {
                    cmp_compare.recently_used,
                    cmp_compare.locality,
                    cmp_compare.score,
                    cmp_compare.offset,
                    cmp_compare.order,
                },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline({
                ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false }),
            }),
            sources = cmp.config.sources({
                { name = "cmdline", priority = 10 },
                { name = "path", priority = 6 }, -- file system paths
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })

        cmp.event:on("menu_opened", function()
            vim.b.copilot_suggestion_hidden = false
        end)
    end,
}

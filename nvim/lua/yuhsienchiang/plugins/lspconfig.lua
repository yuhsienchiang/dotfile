return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "saghen/blink.cmp",
        "rachartier/tiny-inline-diagnostic.nvim",
        -- "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
        lsp_server = {
            "bashls",
            "clangd",
            "dotls",
            "jdtls",
            "jsonls",
            "lua_ls",
            "marksman",
            "pyright",
            "yamlls",
        },
        formatter = {
            "black",
            "clang-format",
            "isort",
            "stylua",
        },
    },
    config = function(_, opts)
        -- setup diagnostic symbols
        local x = vim.diagnostic.severity
        vim.diagnostic.config({
            underline = false,
            update_in_insert = false,
            signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰠠" } },
            virtual_text =false,
            -- virtual_text = {
            --     spacing = 2,
            --     source = "if_many",
            --     prefix = " ",
            -- },
            severity_sort = true,
        })

        -- setup lsp
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")
        -- local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local blink_cmp = require('blink.cmp')
        local Util = require("yuhsienchiang.util.lsp_util")

        mason_lspconfig.setup({
            ensure_installed = opts.lsp_server,
            automatic_installation = true,
        })

        mason_tool_installer.setup({
            ensure_installed = opts.formatter,
            run_on_start = true,
        })

        vim.cmd([[MasonToolsInstall]])

        local lsp_capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            blink_cmp.get_lsp_capabilities()
            -- cmp_nvim_lsp.default_capabilities()
        )

        -- stylua: ignore
		local on_attach = function(_, _)
            vim.keymap.set( "n",              "<leader>df", "<cmd>Trouble lsp_references toggle<CR>",  { desc = "Toggle references/definition (Trouble)", noremap = true, silent = true }) -- show definition, references
			vim.keymap.set( "n",              "<leader>dd", "<cmd>Trouble lsp_definitions toggle<CR>", { desc = "Toggle definition (Trouble)",            noremap = true, silent = true })
			vim.keymap.set( "n",              "<leader>ds", "<cmd>Trouble symbols toggle<CR>",         { desc = "Toggle symbols (Trouble)",               noremap = true, silent = true })
			vim.keymap.set( "n",              "<leader>dk", vim.lsp.buf.hover,                         { desc = "Show hover document",                    noremap = true, silent = true })
            vim.keymap.set( { "n", "i" },     "<C-s>",      vim.lsp.buf.signature_help,                { desc = "Show signature help",                    noremap = true, silent = true })
            vim.keymap.set({ "n", "i", "s" }, "<c-f>",      Util.hover_signature_scroll_forward,       { desc = "Scroll down signature and document",     silent = true, expr = true })
            vim.keymap.set({ "n", "i", "s" }, "<c-b>",      Util.hover_signature_scroll_backward,      { desc = "Scroll up signature and document",       silent = true, expr = true })
        end

        mason_lspconfig.setup_handlers({
            function(server_name)
                local server_opts = {
                    on_attach = on_attach,
                    capabilities = vim.deepcopy(lsp_capabilities),
                }

                local setting_status, server_setting = pcall(require, "yuhsienchiang.plugins.lsp." .. server_name)
                if setting_status then
                    opts = vim.tbl_deep_extend("force", server_setting, server_opts)
                end

                lspconfig[server_name].setup(opts)
            end,
        })
    end,
}

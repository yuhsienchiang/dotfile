return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    dependencies = {
        "mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        "jay-babu/mason-nvim-dap.nvim",
    },
    opts = {
        lsp_server = {
            "bashls",
            "clangd",
            "dotls",
            "hls",
            "jdtls",
            "jsonls",
            "lua_ls",
            "marksman",
            "pyright",
            "yamlls",
            -- "basedpyright",
        },
        formatter = {
            "black",
            "clang-format",
            "isort",
            "prettier",
            "stylua", -- lua formatter
        },
    },
    config = function(_, opts)
        local signs = { Error = "", Warn = "", Hint = "", Info = "" }
        for name, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. name
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        vim.diagnostic.config({
            underline = false,
            update_in_insert = false,
            virtual_text = {
                spacing = 4,
                source = "if_many",
                prefix = " ",
            },
            severity_sort = true,
        })

        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        require("lspconfig.ui.windows").default_options = { border = "single", }

        mason_lspconfig.setup({
            ensure_installed = opts.lsp_server,
            automatic_installation = true,
        })

        mason_tool_installer.setup({
            ensure_installed = opts.formatter,
            run_on_start = true,
        })

        local lsp_capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_nvim_lsp.default_capabilities()
        )
        local keymap_on_attach = function(_, _)
            vim.keymap.set("n",          "<leader>df", "<cmd>Lspsaga finder<CR>",          { desc = "Show references/definition",  noremap = true, silent = true }) -- show definition, references
            vim.keymap.set("n",          "<leader>dd", "<cmd>Lspsaga peek_definition<CR>", { desc = "Show definition",             noremap = true, silent = true }) -- see definition and make edits in window
            vim.keymap.set("n",          "<leader>da", "<cmd>Lspsaga code_action<CR>",     { desc = "Show code actions",           noremap = true, silent = true }) -- see available code actions
            vim.keymap.set("n",          "<leader>dh", "<cmd>Lspsaga hover_doc<CR>",       { desc = "Show hover doc under cursor", noremap = true, silent = true }) -- show documentation for what is under cursor
            vim.keymap.set({ "n", "i" }, "<C-s>",      vim.lsp.buf.signature_help,         { desc = "Show signature help",         noremap = true, silent = true })
        end

        mason_lspconfig.setup_handlers({
            function(server_name)
                local server_opts = {
                    on_attach = keymap_on_attach,
                    capabilities = vim.deepcopy(lsp_capabilities)
                }

                local setting_status, server_setting = pcall(require, "yuhsienchiang.plugins.lsp.settings." .. server_name)
                if setting_status then
                    opts = vim.tbl_deep_extend("force", server_setting, server_opts)
                end

                lspconfig[server_name].setup(opts)
            end
        })

    end,
}

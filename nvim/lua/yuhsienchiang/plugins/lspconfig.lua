return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
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
        },
        formatter = {
            "black",
            "clang-format",
            "isort",
            "prettier",
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
            virtual_text = {
                spacing = 2,
                source = "if_many",
                prefix = "  ",
            },
            severity_sort = true,
        })

        -- setup lsp
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

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

        -- settings from nvchad
        lsp_capabilities.textDocument.completion.completionItem = {
            documentationFormat = { "markdown", "plaintext" },
            snippetSupport = true,
            preselectSupport = true,
            insertReplaceSupport = true,
            labelDetailsSupport = true,
            deprecatedSupport = true,
            commitCharactersSupport = true,
            tagSupport = { valueSet = { 1 } },
            resolveSupport = {
                properties = {
                    "documentation",
                    "detail",
                    "additionalTextEdits",
                },
            },
        }

        -- stylua: ignore
		local keymap_on_attach = function(_, _)
            vim.keymap.set( "n",          "<leader>df", "<cmd>Trouble lsp_references toggle<CR>",  { desc = "Toggle references/definition (Trouble)", noremap = true, silent = true }) -- show definition, references
			vim.keymap.set( "n",          "<leader>dd", "<cmd>Trouble lsp_definitions toggle<CR>", { desc = "Toggle definition (Trouble)",            noremap = true, silent = true }) -- see definition and make edits in window
			vim.keymap.set( "n",          "<leader>ds", "<cmd>Trouble symbols toggle<CR>",         { desc = "Toggle symbols (Trouble)",               noremap = true, silent = true }) -- see definition and make edits in window
			vim.keymap.set( { "n", "i" }, "<C-s>",      vim.lsp.buf.signature_help,                { desc = "Show signature help",                    noremap = true, silent = true })
		end

        mason_lspconfig.setup_handlers({
            function(server_name)
                local server_opts = {
                    on_attach = keymap_on_attach,
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

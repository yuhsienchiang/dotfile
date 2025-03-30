return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "saghen/blink.cmp",
        -- "rachartier/tiny-inline-diagnostic.nvim",
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
                prefix = "  ",
                source = "if_many"
            },
            virtual_lines = { current_line = true },
            severity_sort = true,
        })

        -- setup lsp
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")
        -- local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local blink_cmp = require("blink.cmp")
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
			vim.keymap.set("n",               "<leader>ds", ":Trouble symbols toggle<CR>",        { desc = "Toggle symbols (Trouble)",           silent = true, noremap = true })
            vim.keymap.set("n",               "<leader>df", ":FzfLua lsp_finder<CR>",             { desc = "LSP Finder",                         silent = true, noremap = true })
            vim.keymap.set("n",               "<leader>dd", ":FzfLua lsp_definitions<CR>",        { desc = "LSP Definition",                     silent = true, noremap = true })
            vim.keymap.set("n",               "<leader>dh", vim.lsp.buf.hover,                    { desc = "Show hover document",                silent = true, noremap = true })
			vim.keymap.set({ "n", "i" },      "<C-s>",      vim.lsp.buf.signature_help,           { desc = "Show signature help",                silent = true, noremap = true  })
            vim.keymap.set({ "n", "i", "s" }, "<C-f>",      Util.hover_signature_scroll_forward,  { desc = "Scroll down signature and document", silent = true, expr = true })
            vim.keymap.set({ "n", "i", "s" }, "<C-b>",      Util.hover_signature_scroll_backward, { desc = "Scroll up signature and document",   silent = true, expr = true })
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

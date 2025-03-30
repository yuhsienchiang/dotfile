return {
    "yetone/avante.nvim",
    event = { "BufReadPost", "BufNewFile" },
    version = false,
    build = "make",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "ibhagwan/fzf-lua", -- for file_selector provider fzf
        "nvim-tree/nvim-web-devicons",
        "MeanderingProgrammer/render-markdown.nvim",
    },
    opts = {
        provider = "claude",
        claude = {
            endpoint = "https://api.anthropic.com",
            model = "claude-3-5-sonnet-20241022",
            temperature = 0,
            max_tokens = 4096,
        },
        behaviour = {
            auto_set_highlight_group = false,
        },
        windows = {

            position = "right",
            wrap = true, -- similar to vim.o.wrap
            width = 35, -- default % based on available width in vertical layout
            sidebar_header = {
                enabled = true, -- true, false to enable/disable the header
                align = "right", -- left, center, right for title
                rounded = false,
            },
            input = {
                prefix = "󰦨 ",
                height = 10, -- Height of the input window in vertical layout
            },
            edit = {
                border = "single",
                start_insert = true, -- Start insert mode when opening the edit window
            },
            ask = {
                floating = false, -- Open the 'AvanteAsk' prompt in a floating window
                border = "single",
                start_insert = false, -- Start insert mode when opening the ask window
                focus_on_apply = "ours", -- which diff to focus after applying
            },
        },
        file_selector = {
            provider = "fzf",
            provider_opts = {
                fzf_opts = { ["--multi"] = true },
                prompt = " 󰍉 ",
                cwd_only = true,
                winopts = {
                    height = 0.5, -- window height
                    width = 0.5, -- window width
                    row = 0.35, -- window row position (0=top, 1=bottom)
                    col = 0.50, -- window col position (0=left, 1=right)
                    border = "single",
                    backdrop = 100,
                    title = " Avante: select include files",
                },
            },
        },
    },
}

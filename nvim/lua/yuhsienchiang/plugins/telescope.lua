return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            enabled = vim.fn.executable("make") == 1,
        },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local transform_mod = require("telescope.actions.mt").transform_mod

        local trouble_action = transform_mod({
            open_qflist = function(_)
                require("trouble").open({ mode = "quickfix" })
            end,
        })

        local extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            },
        }
        local layout_strategy = {}

        telescope.setup({
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        height = 0.8, -- the height of the telescope window (relative to the vim window
                        width = 0.8, -- the width of the telescope window (relative to the vim window
                        preview_width = 0.4, -- the width percentage of the preview window (relative to the telescope window)
                        preview_cutoff = 120,
                        prompt_position = "bottom",
                    },
                    scroll_speed = 5,
                },
                mappings = {
                    n = {
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-s>"] = actions.select_horizontal,
                        ["<C-t>"] = actions.select_tab,
                        ["<C-p>"] = actions.preview_scrolling_up,
                        ["<C-n>"] = actions.preview_scrolling_down,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.smart_send_to_qflist + trouble_action.open_qflist,
                    },
                    i = {
                        ["<esc>"] = actions.close,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-s>"] = actions.select_horizontal,
                        ["<C-t>"] = actions.select_tab,
                        ["<C-p>"] = actions.preview_scrolling_up,
                        ["<C-n>"] = actions.preview_scrolling_down,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.smart_send_to_qflist + trouble_action.open_qflist,
                    },
                },
                prompt_prefix = " 󰍉 ",
                selection_caret = "    ",
                multi_icon = " + ",
                entry_prefix = "       ",
                -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                preview = { treesitter = true },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                },
            },
            pickers = {
                find_files = {
                    find_command = { "fd", "-tf", "-tl", "--hidden", "--follow" },
                    sorting_strategy = "ascending",
                    layout_strategy = "center",
                    layout_config = { center = { width = 0.5, height = 0.5 } },
                    borderchars = {
                        -- prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
                        -- results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                        prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
                        results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
                    },
                    prompt_title = "Find",
                    results_title = false,
                    previewer = false,
                },
                grep_string = { hidden = true },
                live_grep = { hidden = true },
                buffers = {
                    hidden = true,
                    mappings = {
                        n = { ["<C-d>"] = actions.delete_buffer },
                        i = { ["<C-d>"] = actions.delete_buffer },
                    },
                },
                oldfiles = {
                    sorting_strategy = "ascending",
                    layout_strategy = "center",
                    layout_config = { center = { width = 0.5, height = 0.5 } },
                    borderchars = {
                        -- prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
                        -- results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                        prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
                        results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
                    },
                    prompt_title = "Recents",
                    results_title = false,
                    previewer = false,
                },
            },
            extensions = extensions,
        })
        telescope.load_extension("fzf")
        telescope.load_extension("noice")
        telescope.load_extension("git_worktree")
    end,
}

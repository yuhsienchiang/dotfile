return {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeOpen" },
    config = function()
        local tree_api = require("nvim-tree.api")
        local Util = require("yuhsienchiang.util.nvimtree_util")

        local function on_attach(bufnr)
            local opts = function(desc)
                return { desc = "nvim-tree: " .. desc, noremap = true, silent = true, nowait = true, buffer = bufnr }
            end

            vim.keymap.set("n", "<CR>", tree_api.node.open.edit, opts("Open"))
            vim.keymap.set("n", "q", tree_api.tree.close_in_this_tab, opts("Close Tree"))
            vim.keymap.set("n", "v", tree_api.node.open.vertical, opts("Open: Vertical Split"))
            vim.keymap.set("n", "s", tree_api.node.open.horizontal, opts("Open: Horizontal Split"))
            vim.keymap.set("n", "t", tree_api.node.open.tab, opts("Open: Tab"))

            -- Navigation
            vim.keymap.set("n", "]", tree_api.tree.change_root_to_node, opts("Down"))
            vim.keymap.set("n", "[", tree_api.tree.change_root_to_parent, opts("Up"))
            vim.keymap.set("n", "}", Util.cd_down, opts("Down & Change Directory"))
            vim.keymap.set("n", "{", Util.cd_up, opts("Up & Change Directory"))

            -- File manipulation
            vim.keymap.set("n", "a", tree_api.fs.create, opts("Create"))
            vim.keymap.set("n", "d", tree_api.fs.trash, opts("Trash"))
            vim.keymap.set("n", "D", tree_api.fs.remove, opts("Delete"))
            vim.keymap.set("n", "c", tree_api.fs.copy.node, opts("Copy: file"))
            vim.keymap.set("n", "x", tree_api.fs.cut, opts("Cut"))
            vim.keymap.set("n", "p", tree_api.fs.paste, opts("Paste"))
            vim.keymap.set("n", "r", tree_api.fs.rename, opts("Rename"))

            vim.keymap.set("n", "y", tree_api.fs.copy.filename, opts("Copy: filename"))
            vim.keymap.set("n", "Y", tree_api.fs.copy.relative_path, opts("Copy: relative path"))

            vim.keymap.set("n", "R", tree_api.tree.reload, opts("Refresh"))
            vim.keymap.set("n", "?", tree_api.tree.toggle_help, opts("Help"))
        end

        require("nvim-tree").setup({
            disable_netrw = true,
            hijack_cursor = true,
            sync_root_with_cwd = true,
            view = { width = 32, side = "right", centralize_selection = true },
            git = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = false,
            },
            filters = {
                dotfiles = false,
                git_ignored = false,
            },

            -- change folder arrow icons
            renderer = {
                root_folder_label = ":t",
                indent_markers = {
                    enable = true,
                    inline_arrows = false,
                    icons = {
                        corner = "└",
                        edge = "│",
                        item = "│",
                        bottom = "─",
                        none = " ",
                    },
                },
                icons = {
                    webdev_colors = true,
                    git_placement = "after",
                    padding = " ",
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = false,
                        git = true,
                        modified = true,
                    },
                    glyphs = {
                        default = "󰈚",
                        symlink = "",
                        folder = {
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "✗",
                            staged = "✓",
                            unmerged = "",
                            renamed = "󰄾",
                            untracked = "?",
                            deleted = "󰗨",
                            ignored = "◌",
                        },
                    },
                },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            diagnostics = {
                enable = true,
                debounce_delay = 100,
                show_on_dirs = true,
                show_on_open_dirs = false,
                icons = { hint = "󰠠", info = "", warning = "", error = "" },
            },
            on_attach = on_attach,
        })
    end,
}

return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function ()
        local logo = [[
         ██████╗ ██████╗ ██████╗ ███████╗            ██████╗ ██████╗ ██████╗ ███████╗        
        ██╔════╝██╔═══██╗██╔══██╗██╔════╝  ██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝        
        ██║     ██║   ██║██║  ██║█████╗    ╚═╝      ██║     ██║   ██║██║  ██║█████╗          
        ██║     ██║   ██║██║  ██║██╔══╝    ██╗      ██║     ██║   ██║██║  ██║██╔══╝          
        ╚██████╗╚██████╔╝██████╔╝███████╗  ╚═╝      ╚██████╗╚██████╔╝██████╔╝███████╗        
         ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝            ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝        
        ]]
        logo = string.rep("\n", 4) .. logo .. "\n\n"

        local buttons = {
            { desc = "New file",     icon = "   ", key = "n", action = "ene | startinsert"},
            { desc = "Explorer",     icon = "󰙅   ", key = "s", action = "NvimTreeOpen"},
            { desc = "Find file",    icon = "   ", key = "f", action = "Telescope find_files"},
            { desc = "Recent file",  icon = "   ", key = "r", action = "lua require('telescope.builtin').oldfiles({only_cwd=true})"},
            { desc = "Find word",    icon = "󰊄   ", key = "w", action = "Telescope live_grep"},
            { desc = "Restore last", icon = "  ", key = "u", action = "lua require('persistence').load({last = true})"},
            { desc = "Restore here", icon = "  ", key = "U", action = "lua require('persistence').load()"},
            { desc = "Lazy",         icon = "󰒲   ", key = "l", action = "Lazy"},
            { desc = "Setting",      icon = "   ", key = "c", action = "e $MYVIMRC | cd %:p:h | NvimTreeOpen"},
            { desc = "Quit",         icon = "   ", key = "q", action = "qa"},
        }

        for _, button in ipairs(buttons) do
            button.desc = string.rep(" ", 10) .. button.desc .. string.rep(" ", 40 - #button.desc)
            button.desc_hl = "DashboardDesc"
            button.key_format = "  %s"
            button.key_hl = "DashboardKey"
            button.icon_hl = "DashboardIcon"
        end

        require("dashboard").setup({
            theme = "doom",
            config = {
                header = vim.split(logo, "\n"),
                center = buttons,
                footer = {"", "Pause and Pray | Jesus over everything" }
            },
            hide = { statusline = false }
        })

        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "DashboardLoaded",
                callback = function()
                    require("lazy").show()
                end,
            })
        end
    end
}

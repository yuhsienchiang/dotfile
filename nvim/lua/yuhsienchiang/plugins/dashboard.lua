return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        local logo = [[
         ██████╗ ██████╗ ██████╗ ███████╗            ██████╗ ██████╗ ██████╗ ███████╗        
        ██╔════╝██╔═══██╗██╔══██╗██╔════╝  ██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝        
        ██║     ██║   ██║██║  ██║█████╗    ╚═╝      ██║     ██║   ██║██║  ██║█████╗          
        ██║     ██║   ██║██║  ██║██╔══╝    ██╗      ██║     ██║   ██║██║  ██║██╔══╝          
        ╚██████╗╚██████╔╝██████╔╝███████╗  ╚═╝      ╚██████╗╚██████╔╝██████╔╝███████╗        
         ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝            ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝        
        ]]
        logo = string.rep("\n", 6) .. logo .. "\n\n"

        -- stylua: ignore
        local buttons = {
            { desc = "Explorer",     icon = "󰙅  ", key = "s", action = "NvimTreeToggle"},
            { desc = "Find file",    icon = "  ", key = "f", action = "Telescope find_files"},
            { desc = "Recent file",  icon = "  ", key = "r", action = "Telescope oldfiles only_cwd=true"},
            { desc = "Find word",    icon = "󰈭  ", key = "w", action = "Telescope live_grep"},
            { desc = "Restore",      icon = "  ", key = "u", action = "lua require('persistence').load()"},
            { desc = "Lazy",         icon = "󰒲  ", key = "l", action = "Lazy"},
            { desc = "Quit",         icon = "  ", key = "q", action = "qa"},
        }

        for _, button in ipairs(buttons) do
            button.desc = string.rep(" ", 5) .. button.desc .. string.rep(" ", 30 - #button.desc)
            button.key_format = "  %s"
        end

        require("dashboard").setup({
            theme = "doom",
            disable_move = false,
            hide = {
                statusline=true,
                tabline=true,
                winbar=true,
            },
            config = {
                header = vim.split(logo, "\n"),
                center = buttons,
                footer = { "", "Pause and Pray | Jesus over everything" },
            },
        })

        if vim.o.filetype == "lazy" then
            vim.api.nvim_create_autocmd("WinClosed", {
                pattern = tostring(vim.api.nvim_get_current_win()),
                once = true,
                callback = function()
                    vim.schedule(function()
                        vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
                    end)
                end,
            })
        end
    end,
}

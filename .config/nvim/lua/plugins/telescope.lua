
-- Fuzzy file finder
return {
    'nvim-telescope/telescope.nvim',
    name = "telescope",
    config = function() 
        require("telescope")
        local builtin = require('telescope.builtin')
        vim.keymap.set(
            'n', '<leader>ff', 
            -- Example of customising the find command
            -- In this case we specify to run ripgrep showing hidden files + removing git directory
            function()
                builtin.find_files(
                    {
                        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" }
                    }
                )
            end)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep)
        vim.keymap.set("n", "<leader>fo", builtin.treesitter)
        vim.keymap.set('n', '<leader>gs', builtin.git_status)
    end
}



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
            end
        )
        vim.keymap.set('n', '<leader>fg', builtin.live_grep)
        vim.keymap.set("n", "<leader>fo", builtin.treesitter)
        vim.keymap.set('n', '<leader>gs', builtin.git_status)

        -- Open file in external editor
        vim.keymap.set(
            'n',
            '<leader>fe',  -- Find External
            function()
                local actions = require('telescope.actions')
                local action_state = require('telescope.actions.state')
                function open_external_program(prompt_bufnr)
                    local entry = action_state.get_selected_entry()
                    local filename = entry.path
                    actions.close(prompt_bufnr)
                    local cmd = "!command -v open && CMD=open || CMD=xdg-open ; $CMD " .. filename
                    os.execute(cmd)
                end
                require('telescope.builtin').find_files(
                    {
                        attach_mappings = function(_, map)
                            map('i', '<CR>', open_external_program)
                            map('n', '<CR>', open_external_program)
                            return true
                        end
                    }
                )
            end
        )
    end
}




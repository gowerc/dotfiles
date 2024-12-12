



return {
    "Vigemus/iron.nvim",
    config = function()
        require('iron.core').setup {
            ignore_blank_lines = false,
            config = {
                repl_definition = {
                    python = {
                        command =  { "python3" }
                    }
                },
                repl_open_cmd = require("iron.view").right(90)
            }
        }
    end
}
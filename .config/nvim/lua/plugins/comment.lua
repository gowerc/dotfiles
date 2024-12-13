
-- return {}

-- Enables the ability to toggle sections of code being commented or not
-- Note that Neovim does support native commenting however it doesn't appear
-- yet have an option to disable commenting on blank lines
return {
    { 
        "numToStr/Comment.nvim",
        config = function() 
            require("Comment").setup({
                -- Ignore blank lines
                ignore = '^ *$',
                opleader = {
                    -- This is equvialent to ctrl+/ (as in ctrl+/ gets
                    -- mapped to <C-_> in many terminals)
                    line = "<C-_>",
                }
            })
        end
    }
}



-- Enable line numbers by default e.g. ":set number"
vim.opt.number = true


-- All things tabs
vim.opt.tabstop = 4         -- Number of spaces to be displayed for a <tab> character
vim.opt.softtabstop = 4     -- Number of spaces to insert/remove when pressing <tab>
                            -- There might be some weird interaction between tabstop and softtabstop
                            -- so best keep them the same length
vim.opt.shiftwidth = 4      -- Number of spaces to use for autoindent
vim.opt.expandtab = true    -- Convert tabs to spaces


-- Set spelling language to GB
vim.opt.spelllang = "en_gb"


-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'



-- Keep signcolumn on by default (this is where lintr notes or issues will be displayed)
vim.opt.signcolumn = 'yes'


-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true


-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }


-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10


-- Vim Indenting :(
-- https://neovim.io/doc/user/indent.html
-- There are in fact four main methods available for indentation, each one
-- overrides the previous if it is enabled, or non-empty for 'indentexpr':
-- 'autoindent'   
--      uses the indent from the previous line.
-- 'smartindent'  
--      is like 'autoindent' but also recognizes some C syntax to
--      increase/reduce the indent where appropriate.
-- 'cindent'      
--      Works more cleverly than the other two and is configurable to
--      different indenting styles.
-- 'indentexpr'
--      The most flexible of all: Evaluates an expression to compute
--      the indent of a line.  When non-empty this method overrides
--      the other ones.  See indent-expression.


-- Don't think this is needed anymore as we've disabled filebased indenting 
-- but will leave here anyway just in case / as a reference
vim.g.python_indent = {
    closed_paren_align_last_line = false,
    open_paren = "shiftwidth()",
    continue = "shiftwidth()",
    nested_paren = "shiftwidth()"
}

vim.cmd("filetype indent off")   -- Disables file based indenting rules (e.g. if R then do this, if python then do that)
                                 -- Instead enable cindenting rules for everything with the following rule set:

vim.opt.cindent = true
vim.opt.cinoptions =
    "" ..
    ">1s" ..   -- indent if { is first symbol on previous line (e.g. c style funcs)
    "e0" ..    -- additional indent if { is not first symbol on previous line  (non c-style funcs)
    "(1s" ..   -- Indent after unclosed parentheses, doesn't include case when ( is the first non-ws character
    "t0" ..    -- Indent of function return types if dangling on a line by themselves
    "p0" ..    -- Indent of K&R type declarations on a new line e.g. int fun() int a; int b;
    "+0" ..    -- Indent for continuation line of an expression
    "U1s" ..   -- Indent if ( is first non-ws character on line
    "m1" ..    -- deindent line if the first non-ws character is )
    "l1" ..    -- Better formatting for switch-case statements
    ""

-- Renable filetype indenting for python only (as its rules are more complicated)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "py",
    callback = function()
        vim.cmd("filetype indent on")  -- Re-enable filetype indenting
        vim.opt_local.indentexpr = "GetPythonIndent()"  -- Restore Python indent function
    end
})
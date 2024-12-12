--------------------------------------------------
--
--   REPL Stuff
--
--------------------------------------------------

TERMINAL_INDEX_PYTHON = 1
TERMINAL_INDEX_R = 1
TERMINAL_INDEX_BASH = 1

-- need to use vim.api.nvim_input instead of vim.cmd and vim.api.nvim_input
-- runs async in the event loop so will be defered to run after any other
-- vim.cmd statements
function new_term(entry, name)
    entry = entry or ""
    vim.api.nvim_input(":terminal <CR>")
    vim.api.nvim_input(":set nonumber <CR>")
    vim.api.nvim_input("a" .. entry .. '<CR><C-\\><C-n>')
    vim.api.nvim_input(":keepalt file term:" .. name .. "<CR>")
end

function new_python_term()
    new_term("python", "Python-" .. TERMINAL_INDEX_PYTHON)
    TERMINAL_INDEX_PYTHON = TERMINAL_INDEX_PYTHON + 1
end

function new_r_term()
    new_term("R", "R-" .. TERMINAL_INDEX_R)
    TERMINAL_INDEX_R = TERMINAL_INDEX_R + 1
end

function new_bash_term()
    new_term("", "-" .. TERMINAL_INDEX_BASH)
    TERMINAL_INDEX_BASH = TERMINAL_INDEX_BASH + 1
end



-- sending lines
vim.keymap.set(
    "n",
    "<C-l>",
    "V\"ly<C-w>p\"lpa<CR><C-\\><C-n><C-w>pj",
    { noremap = true }
)
vim.keymap.set(
    "i",
    "<C-l>",
    "<ESC>V\"ly<C-w>p\"lpa<CR><C-\\><C-n><C-w>pj",
    { noremap = true }
)

-- sending visual selection
vim.keymap.set(
    "v",
    "<C-l>",
    "my\"ly<C-w>p\"lpa<CR><C-\\><C-n><C-w>p'y",
    { noremap = true }
)


-- Resend last selection
vim.keymap.set(
    "n",
    "<C-M-l>",
    "<C-w>p\"lpa<CR><C-\\><C-n><C-w>p",
    { noremap = true }
)







-- Create vertical split
vim.keymap.set(
    "n",
    "<leader>vs",
    function()
        vim.cmd("vsplit")
    end
)


-- Open new python console
vim.keymap.set(
    "n",
    "<leader>tnp",
    function()
        vim.api.nvim_input("<C-w>l")
        new_python_term()
        vim.api.nvim_input("<C-w>h")
    end,
    { noremap = true }
)
-- Reset python console
vim.keymap.set(
    "n",
    "<leader>trp",
    function()
        vim.api.nvim_input("<C-w>l")
        vim.api.nvim_input("aexit()<CR>python<CR><C-\\><C-n>")
        vim.api.nvim_input("<C-w>h")
    end,
    { noremap = true }
)


-- Open new R console
vim.keymap.set(
    "n",
    "<leader>tnr",
    function()
        vim.api.nvim_input("<C-w>l")
        new_r_term()
        vim.api.nvim_input("<C-w>h")
    end,
    { noremap = true }
)
-- Reset R console
vim.keymap.set(
    "n",
    "<leader>trr",
    function()
        vim.api.nvim_input("<C-w>l")
        vim.api.nvim_input("aq('no')<CR>R<CR><C-\\><C-n>")
        vim.api.nvim_input("<C-w>h")
    end,
    { noremap = true }
)




-- Open new Bash console
vim.keymap.set(
    "n",
    "<leader>tnt",
    function()
        vim.api.nvim_input("<C-w>l")
        new_bash_term()
        vim.api.nvim_input("<C-w>h")
    end,
    { noremap = true }
)


-- Cycle through open terminals
vim.keymap.set(
    "n",
    "<leader>tc",
    function()
        local current_window_id = vim.api.nvim_get_current_win()
        vim.cmd("wincmd l")
        local current_buf_id = vim.api.nvim_get_current_buf()
        local first_buf = nil
        local next_buf = nil
        for buffer = 1, vim.fn.bufnr('$') do
            if vim.fn.buflisted(buffer) == 1 then
                local buffer_name = vim.api.nvim_buf_get_name(buffer)
                local short_name = vim.fn.fnamemodify(buffer_name, ":t")
                if string.match(short_name, "^term:") then
                    if not first_buf then
                        first_buf = buffer
                    end
                    if (not next_buf) and (buffer > current_buf_id) then
                        next_buf = buffer
                    end
                end
            end
        end
        if not next_buf then
            next_buf = first_buf
        end
        if not next_buf then
            return
        end
        vim.cmd("b" .. next_buf)
        vim.api.nvim_set_current_win(current_window_id)
    end,
    { noremap = true }
)


-- open terminal buffer selector
vim.keymap.set(
    'n',
    '<leader>tx',
    function()
        local actions = require('telescope.actions')
        local action_state = require('telescope.actions.state')
        local current_window_id = vim.api.nvim_get_current_win()
        function switch_buffer(prompt_bufnr)
            local entry = action_state.get_selected_entry()
            local filename = entry.path
            actions.close(prompt_bufnr)
            vim.cmd('wincmd l') -- Move to the left pane
            vim.cmd('edit ' .. filename)
            vim.api.nvim_set_current_win(current_window_id)
        end
        require('telescope.builtin').buffers(
            {
                attach_mappings = function(_, map)
                    vim.api.nvim_input('<Esc>')
                    map('i', '<CR>', switch_buffer)
                    map('n', '<CR>', switch_buffer)
                    return true
                end,
                default_text = "term"
            }
        )
    end,
    { desc = 'Find files and open in left pane' }
)



-- Esc to exit terminal mode back to normal mode
vim.keymap.set( "t", "<Esc>", "<C-\\><C-n>", { noremap = true })



-- Navigation keys so that its always Alt+
vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-w>l")
vim.keymap.set("i", "<A-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set("i", "<A-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set("i", "<A-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set("i", "<A-l>", "<C-\\><C-N><C-w>l")
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")


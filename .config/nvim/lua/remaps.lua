
-- Set leader key 
vim.g.mapleader = " "


-- open vims default file browser
vim.keymap.set("n", "<leader>op", vim.cmd.Ex, { noremap = true })

-- list open buffers (files)
vim.keymap.set("n", "<leader>ls", vim.cmd.ls, { noremap = true })

-- remove all search highlighting
vim.keymap.set("n", "<esc><esc><esc>", vim.cmd.noh, { noremap = true })


vim.keymap.set("n", "<leader>sc", function() vim.cmd("set spell!") end)

-- vim.keymap.set("n", "<-r>", function()
--     string = vim.api.nvim_get_current_line()
--     if string == "" then
--         string = "\n"
--     end
--     vim.cmd.IronSend(string)
--     x = vim.api.nvim_win_get_cursor(0)
--     x[1] = x[1] + 1
--     vim.api.nvim_win_set_cursor(0, x)
-- end)


-- local function collapse_to_string(array, delimiter)
--     delimiter = delimiter or "\n" -- Default delimiter is an empty string
--     return table.concat(array, delimiter)
-- end

-- function get_visual_selection()
--     string = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."))
--     print(string)
--     return table.concat(string, "\n")
-- end

-- vim.keymap.set(
--     "v",
--     "<leader>k",
--     function()
--         print(get_visual_selection())
--         local esc = vim.api.nvim_replace_termcodes('<esc>', true, false, true)
--         vim.api.nvim_feedkeys(esc, 'x', false)
--         -- vim.api.nvim_feedkeys(esc, 'x', false)
--         -- local start_pos = vim.fn.getpos("'<")
--         -- local end_pos = vim.fn.getpos("'>")
--         -- print(start_pos[1], start_pos[2], start_pos[3], end_pos[1], end_pos[2], end_pos[3])
--         --string = vim.api.nvim_buf_get_text(0, start_pos[2]-1, start_pos[3]-1, end_pos[2], end_pos[3], {})
--         --print(collapse_to_string(string))
--         --vim.cmd.IronSend(collapse_to_string(string))
--     end,
--     { noremap = true }
-- )
    -- local vstart = vim.fn.getpos("'<")
    -- local vend = vim.fn.getpos("'>")
    -- local line_start = vstart[2]
    -- local line_end = vend[2]
    -- local lines = vim.fn.getline(line_start, line_end)
    -- print(vstart[1])
    -- print(vend[1])
-- vim.keymap.set('v', '<leader>s', ':echo "Visual mode key remap"<CR>')



-- sending blocks (clearing previous output)
--vim.keymap.set("n", "<C-r>", "(y)<C-w>wpa<C-l><CR><C-\><C-n><C-w>p)", { noremap = true })








-- open vims default file browser
vim.keymap.set("n", "<leader>op", vim.cmd.Ex, { noremap = true })

-- list open buffers (files)
vim.keymap.set("n", "<leader>ls", vim.cmd.ls, { noremap = true })

-- remove all search highlighting
vim.keymap.set("n", "<esc><esc><esc>", vim.cmd.noh, { noremap = true })


vim.keymap.set("n", "<leader>sc", function() vim.cmd("set spell!") end)


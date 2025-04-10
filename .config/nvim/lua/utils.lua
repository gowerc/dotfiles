

-- -- "listed" means that the buffer (a file) can be seen via ls
-- -- `vim_fn.bufnr('$')` returns the largest buffer id number
-- -- `vim.fn.buflisted(buffer)` returns 1 if the buffer is listed via `:ls`
-- function get_listed_buffer_ids()
--     local buffers = {}
--     local len = 0
--     for buffer = 1, vim_fn.bufnr('$') do
--         if vim.fn.buflisted(buffer) == 1 then
--             len = len + 1
--             buffers[len] = buffer
--         end
--     end
--     return buffers
-- end


-- function hello_world()
--     print("Hello world")
-- end


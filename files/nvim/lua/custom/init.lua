local g = vim.g
g.mapleader = ","
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true})
vim.api.nvim_set_keymap('v', '<leader>gb', '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', {})

-- local wr_group = vim.api.nvim_create_augroup('WinResize', { clear = true })

-- vim.api.nvim_create_autocmd(
--     'VimResized',
--     {
--         group = wr_group,
--         pattern = '*',
--         command = 'wincmd =',
--         desc = 'Automatically resize windows when the host window size changes.'
--     }
-- )

-- vim.api.nvim_create_autocmd({"BufReadPost"}, {
--     pattern = {"*"},
--     callback = function()
--         if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
--             vim.api.nvim_exec("normal! g'\"",false)
--         end
--     end
-- })

-- vim.api.nvim_set_hl(0, "Normal", { bg = "None" } )
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" } )

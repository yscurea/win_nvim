local set = vim.keymap.set
local option = { noremap = true, silent = true }
set("v", "<Leader>j", "<Plug>(edgemotion-j)", option)
set("v", "<Leader>k", "<Plug>(edgemotion-k)", option)
set("n", "<Leader>j", "<Plug>(edgemotion-j)", option)
set("n", "<Leader>k", "<Plug>(edgemotion-k)", option)

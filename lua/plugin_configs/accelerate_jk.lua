local option = { noremap = true, silent = true }
vim.keymap.set({ "n" }, "j", "<Plug>(accelerated_jk_gj)", option)
vim.keymap.set({ "n" }, "k", "<Plug>(accelerated_jk_gk)", option)

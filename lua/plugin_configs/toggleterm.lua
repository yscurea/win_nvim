require("toggleterm").setup({
    size = 70,
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = false,
    direction = "vertical"
})

local set = vim.keymap.set
local option = { noremap = true, silent = true }

set("n", "<C-]>", "<cmd>ToggleTerm<CR>", option)
set("t", "<C-]>", "<C-\\><C-n><cmd>ToggleTerm<CR>", option)
set("i", "<C-]>", "<Esc><cmd>ToggleTerm<CR>", option)

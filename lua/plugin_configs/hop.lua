require('hop').setup()

local set = vim.keymap.set
local option = { noremap = true, silent = true }
set("n", "<Leader>ow", "<cmd>HopWord<CR>", option)
set("n", "<Leader>ov", "<cmd>HopVertical<CR>", option)
set("n", "<Leader>oa", "<cmd>HopAnywhere<CR>", option)

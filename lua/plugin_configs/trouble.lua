require("trouble").setup()
local option = {noremap = true, silent = true}
vim.keymap.set("n", "<C-t>", ":TroubleToggle<CR>", option)

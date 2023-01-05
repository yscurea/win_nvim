local actions = require("telescope.actions")
require("telescope").setup {
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown{}
		},
		file_browser = {},
	},
	defaults = {
		mappings = {
			n = {
				['x'] = actions.close,
				['ss'] = actions.file_split,
				['sv'] = actions.file_vsplit,
			},
		}
	}
}

require("telescope").load_extension("projects")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("file_browser")
-- require("telescope").load_extension("smart_history")

local set = vim.keymap.set
local option = { noremap = true, silent = true }

set("n", "<Leader>tf", ":Telescope find_files<CR>", option)
set("n", "<Leader>tb", ":Telescope file_browser<CR>", option)
set("n", "<Leader>tm", ":Telescope marks<CR>", option)
set("n", "<Leader>tl", ":Telescope live_grep<CR>", option)

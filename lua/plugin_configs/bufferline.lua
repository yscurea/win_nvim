-- NOTE: bufferが全て表示されないときがある
require("bufferline").setup({
	options = {
		-- custom_filter = function(buf_number)
		-- 	return vim.api.nvim_buf_get_name(buf_number):find(
		-- 		vim.fn.getcwd(), 0, true
		-- 	)
		-- end,
		mode = "buffers",
		offsets = { {
			filetype = "NvimTree",
			text = "🌳 Nvim Tree 🌳",
			highlight = "Directory",
			text_align = "left"
		} },
		separator_style = "thick",
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, _, _)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
	},
})

local set = vim.keymap.set
local option = { noremap = true, silent = true }

set("n", "<Leader>h", "<cmd>BufferLineCyclePrev<CR>", option)
set("n", "<Leader>l", "<cmd>BufferLineCycleNext<CR>", option)
set("n", "<Leader>>", "<cmd>BufferLineMoveNext<CR>", option)
set("n", "<Leader><", "<cmd>BufferLineMovePrev<CR>", option)
set("n", "<Leader>b", "<cmd>BufferLinePick<CR>", option)
set("n", "<Leader>q", "<cmd>BufferLinePickClose<CR>", option)

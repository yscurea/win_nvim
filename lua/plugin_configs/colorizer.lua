require('colorizer').setup({})

local colorizer = require('colorizer')

vim.api.nvim_create_autocmd(
	"BufEnter",
	{
		pattern = { "*" },
		callback = function()
			colorizer.attach_to_buffer()
		end,
	}
)

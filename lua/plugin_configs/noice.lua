-- neovide でクラッシュする #17 issue
local setup = function()
	if not vim.g.noevide then
		require("notify").setup({
			render = "minimal",
			top_down = false,
		})
		require("noice").setup({
			messages = {
				enabled = true,
			}
		})
	end
end

setup()

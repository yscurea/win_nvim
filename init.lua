-- impatientによる起動時間短縮
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/impatient.nvim")
local ok, impatient = pcall(require, "impatient")
if ok then
	impatient.enable_profile()
else
	print("impatient is not working")
end

-- coreの読み込み
require("core")
-- プラグインの読み込み
require("plugins")


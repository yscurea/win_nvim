-- impatientによる起動時間短縮
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/impatient.nvim")
local is_exist, impatient = pcall(require, "impatient")
if is_exist then
	impatient.enable_profile()
else
	vim.fn.system {
		'git',
		'clone',
		'https://github.com/lewis6991/impatient.nvim',
		vim.fn.stdpath("data") .. "/impatient.nvim"
	}
end

-- coreの読み込み
require("core")
-- プラグインの読み込み
require("plugins")

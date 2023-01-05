-- TSInstall allをしておく
require("nvim-treesitter.install").perfer_git = true
require("nvim-treesitter.configs").setup {
	auto_intall = true,
	ignore_install = {},
	disable = {},
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
	}
}

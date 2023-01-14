local vim = vim
local set = vim.opt

local set_user_option = function()
	set.encoding       = "utf-8"
	set.number         = true
	set.relativenumber = true
	set.hidden         = true
	set.wrap           = false
	set.autoread       = true
	set.showcmd        = true
	set.wildmenu       = true
	set.cursorline     = true
	set.pumblend       = 15
	set.autoindent     = true
	set.smartindent    = true
	set.ignorecase     = true
	set.incsearch      = true
	set.backup         = false
	set.swapfile       = false
	set.writebackup    = false
	set.cmdheight      = 1
	set.updatetime     = 300
	set.laststatus     = 3
	set.signcolumn     = "yes"
	set.colorcolumn    = "80"
	set.list           = true
	set.listchars      = "tab:  ,nbsp:+,trail: ,extends:→,precedes:←"
	set.showtabline    = 2
	set.showbreak      = "↳  "
	set.tabstop        = 4
	set.shiftwidth     = 4
	set.softtabstop    = 4
	set.expandtab      = false
	set.smarttab       = true
	set.showtabline    = 2

	local powershell_options = {
		shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
		shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
		shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
		shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
		shellquote = "",
		shellxquote = "",
	}
	for option, value in pairs(powershell_options) do
		vim.opt[option] = value
	end

	vim.api.nvim_create_autocmd(
		{ "TermOpen" },
		{
			pattern = "*",
			command = "startinsert"
		}
	)
end

local disable_distribution_plugins = function()
	-- デフォルトでロードされるものをロードされないようにする
	vim.g.did_install_default_menus = 1
	vim.g.did_install_syntax_menu   = 1
	vim.g.did_indent_on             = 1
	vim.g.did_load_filetypes        = 1
	vim.g.did_load_ftplugin         = 1
	vim.g.loaded_2html_plugin       = 1
	vim.g.loaded_gzip               = 1
	vim.g.loaded_man                = 1
	vim.g.loaded_matchit            = 1
	vim.g.loaded_netrw              = 1
	vim.g.loaded_netrwPlugin        = 1
	vim.g.loaded_remote_plugins     = 1
	vim.g.loaded_shada_plugin       = 1
	vim.g.loaded_spellfile_plugin   = 1
	vim.g.loaded_tarPlugin          = 1
	vim.g.loaded_tutor_mode_plugin  = 1
	vim.g.loaded_zipPlugin          = 1
	vim.g.skip_loading_mswin        = 1
	-- vim.g.loaded_clipboard_provider = 1
	if vim.fn.has("gui_running") == false then
		vim.g.loaded_matchparen = 1
	end
	vim.api.nvim_create_autocmd(
		"TextYankPost",
		{
			pattern = { "*" },
			callback = function()
				vim.highlight.on_yank()
			end,
		}
	)
end

local clipboard_config = function()
	local settings = require("core.settings")

	if settings.is_mac then
		vim.g.clipboard = {
			name = "macOS-clipboard",
			copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
			paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
			cache_enabled = 0,
		}
	elseif settings.is_wsl then
		vim.g.clipboard = {
			name = "win32yank-wsl",
			copy = {
				["+"] = "win32yank.exe -i --crlf",
				["*"] = "win32yank.exe -i --crlf",
			},
			paste = {
				["+"] = "win32yank.exe -o --lf",
				["*"] = "win32yank.exe -o --lf",
			},
			cache_enabled = 0,
		}
	elseif settings.is_windows then
		vim.opt.clipboard:append { 'unnamedplus' }
	end
end

local theme_config = function()
	if vim.fn.has('nvim') == 1 then
		vim.cmd [[let $NVIM_TUI_ENABLE_TRUE_COLOR=1]]
		if vim.fn.has("termguicolors") == 1 then
			vim.opt.termguicolors = true
		end
	end
	vim.cmd [[syntax on]]
	vim.api.nvim_command([[set background=dark]])
end

local set_options = function()
	disable_distribution_plugins()
	set_user_option()
	clipboard_config()
	theme_config()
end

set_options()

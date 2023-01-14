require("sidebar-nvim").setup({
	disable_default_keybindings = 0,
	bindings = nil,
	open = false,
	side = "right",
	initial_width = 25,
	hide_statusline = false,
	update_interval = 1000,
	sections = { "datetime", "git", "diagnostics" },
	section_separator = { "", "-----", "" },
})

vim.keymap.set(
	"n",
	"<C-s>",
	"<Cmd>SidebarNvimToggle<CR>",
	{ noremap = true, silent = true }
)

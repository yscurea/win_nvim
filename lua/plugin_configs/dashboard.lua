local db = require("dashboard")

db.preview_file_path = "~/.config/nvim/static/neovim.cat"
db.preview_file_height = 12
db.preview_file_width = 80
db.custom_center = {
	{
		icon = ' ',
		desc = "Recently latest session                 ",
		action = "SessionLoad"
	},
	{
		icon = " ",
		desc = "Project find                            ",
		action = "Telescope projects",
	},
	{
		icon = " ",
		desc = "Find File                               ",
		action = "Telescope find_files",
	},
	{
		icon = " ",
		desc = "Find word                               ",
		action = "Telescope live_grep",
	},
	{
		icon = " ",
		desc = "Open Personal dotfiles                  ",
		action = "cd ~/.config/nvim | e ~/.config/nvim/init.lua",
	}
}
db.custom_header = {
'                                                       ',
' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
'                                                       ',
}

require("hlslens").setup({
   build_position_cb = function(plist, _, _, _)
		require("scrollbar.handlers.search").handler.show(plist.start_pos)
   end,
})
vim.cmd([[
	augroup scrollbar_search_hide
		autocmd!
		autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
	augroup END
]])

require('gitsigns').setup({
	signs                        = {
		add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
		change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
		delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
		topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
		changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
	},
	signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir                 = {
		interval = 1000,
		follow_files = true
	},
	attach_to_untracked          = true,
	current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts      = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
	sign_priority                = 6,
	update_debounce              = 100,
	status_formatter             = nil, -- Use default
	max_file_length              = 40000, -- Disable if file is longer than this (in lines)
	preview_config               = {
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
	},
	yadm                         = {
		enable = false
	},
	keymaps                      = {
		noremap = true,
		buffer = true,
	},
})
require("scrollbar.handlers.gitsigns").setup()


require("scrollbar").setup({
    show = true,
    show_in_active_only = false,
    set_highlights = true,
    folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
    max_lines = false, -- disables if no. of lines in buffer exceeds this
    hide_if_all_visible = false, -- Hides everything if all lines are visible
    throttle_ms = 100,
    handle = {
        text = " ",
        color = nil,
        cterm = nil,
        highlight = "CursorColumn",
        hide_if_all_visible = true, -- Hides handle if all lines are visible
    },
    marks = {
        Cursor = {
            text = "•",
            priority = 0,
            color = nil,
            cterm = nil,
            highlight = "Normal",
        },
        Search = {
            text = { "-", "=" },
            priority = 1,
            color = nil,
            cterm = nil,
            highlight = "Search",
        },
        Error = {
            text = { "-", "=" },
            priority = 2,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
            text = { "-", "=" },
            priority = 3,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextWarn",
        },
        Info = {
            text = { "-", "=" },
            priority = 4,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextInfo",
        },
        Hint = {
            text = { "-", "=" },
            priority = 5,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextHint",
        },
        Misc = {
            text = { "-", "=" },
            priority = 6,
            color = nil,
            cterm = nil,
            highlight = "Normal",
        },
        GitAdd = {
            text = "┆",
            priority = 7,
            color = nil,
            cterm = nil,
            highlight = "GitSignsAdd",
        },
        GitChange = {
            text = "┆",
            priority = 7,
            color = nil,
            cterm = nil,
            highlight = "GitSignsChange",
        },
        GitDelete = {
            text = "▁",
            priority = 7,
            color = nil,
            cterm = nil,
            highlight = "GitSignsDelete",
        },
    },
    excluded_buftypes = {
        "terminal",
    },
    excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "noice",
    },
    autocmd = {
        render = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
        },
        clear = {
            "BufWinLeave",
            "TabLeave",
            "TermLeave",
            "WinLeave",
        },
    },
    handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = false, -- Requires gitsigns
        handle = true,
        search = false, -- Requires hlslens
    },
})


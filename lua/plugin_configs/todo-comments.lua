require("todo-comments").setup({
	signs = true,
	sign_priority = 8,
	keywords = {
		XXX = {
			icon = " ",
			color = "xxx"
		},
		FIX = {
			icon = " ",
			color = "error",
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "ERROR" },
		},
		WARN = { icon = " ", color = "warn", alt = { "WARNING", "REVIEW" } },
		TODO = { icon = " ", color = "todo" },
		HACK = { icon = " ", color = "hack" },
		PERF = { icon = " ", color = "perf",
			alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = " ", color = "hint",
			alt = { "INFO", "NOTE" } },
		TEST = { icon = "⏲ ", color = "test",
			alt = { "TESTING", "PASSED", "FAILED" } },
	},
	gui_style = {
		fg = "NONE",
		bg = "BOLD",
	},
	merge_keywords = true,
	highlight = {
		multiline = true,
		multiline_pattern = "^.",
		multiline_context = 10,
		before = "",
		keyword = "wide",
		after = "fg",
		pattern = [[.*<(KEYWORDS)\s*:]],
		comments_only = true,
		max_line_len = 400,
		exclude = {},
	},
	colors = {
		xxx = { "XXX", "#ff0000" },
		error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
		warn = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
		todo = { "DiagnosticInfo", "#2563EB" },
		hack = { "Hack", "#FFFFFF" },
		hint = { "DiagnosticHint", "#10B981" },
		perf = { "performance", "#EEBB99" },
		test = { "Identifier", "#FF00FF" },
		default = { "Identifier", "#7C3AED" },
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
		},
		pattern = [[\b(KEYWORDS):]], -- ripgrep regex
	},
})

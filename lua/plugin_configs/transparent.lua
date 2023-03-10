require("transparent").setup({
	enable = false,
	extra_groups = {
		"NvimTreeLspDiagnosticsError",
		"NvimTreeLspDiagnosticsWarning",
		"NvimTreeLspDiagnosticsInformation",
		"NvimTreeLspDiagnosticsHint",
		"NvimTreeBg"
	},
	exclude = {
		"BufferLineTabClose",
		"BufferlineBufferSelected",
		"BufferLineFill",
		"BufferLineBackground",
		"BufferLineSeparator",
		"BufferLineIndicatorSelected",
		"CmpDocumentationBorder",
		"ColorColumn",
		"Comment",
		"CopilotSuggestion",
		"Cursor",
		"CursorLine",
		"DefinitionBorder",
		"DiagnosticError",
		"DiagnosticHint",
		"DiagnosticInfo",
		"DiagnosticWarn",
		"FinderSpinnerBorder",
		"FloatBorder",
		"GitSignsAdd",
		"GitSignsAddLn",
		"GitSignsChange",
		"GitSignsChangeLn",
		"GitSignsDelete",
		"GitSignsDeleteLn",
		"IndentBlankLineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
		"LSOutlinePreviewBorder",
		"LspFloatWinBorder",
		"LspSagaCodeActionBorder",
		"LspSagaDiagnosticBorder",
		"LspSagaHoverBorder",
		"LspSagaLspFinderBorder",
		"LspSagaRenameBorder",
		"LspSagaSignatureHelpBorder",
		"NeotestBorder",
		"NotifyDEBUGBorder",
		"NotifyERRORBorder",
		"NotifyINFOBorder",
		"NotifyTRACEBorder",
		"NotifyWARNBorder",
		"NotifyERRORIcon",
		"NotifyWARNIcon",
		"NotifyINFOIcon",
		"NotifyDEBUGIcon",
		"NotifyTRACEIcon",
		"NotifyERRORTitle ",
		"NotifyWARNTitle",
		"NotifyINFOTitle",
		"NotifyDEBUGTitle ",
		"NotifyTRACETitle ",
		"NotifyERRORBody",
		"NotifyWARNBody",
		"NotifyINFOBody",
		"NotifyDEBUGBody",
		"NotifyTRACEBody",
		"NvimSeparator",
		"OutlineDetail",
		"OutlineIndentEvn",
		"ScrollbarCursor",
		"ScrollbarHandle",
		"ScrollbarSearch",
		"Search",
		"TelescopeBorder",
		"TelescopePreviewBorder",
		"TelescopePromptBorder",
		"TelescopeResultsBorder",
		"TelescopeSelection",
		"TodoBgFix",
		"TodoBgHACK",
		"TodoBgNOTE",
		"TodoBgPERF",
		"TodoBgTODO",
		"TodoBgWARN",
		"Visual",
		"WinSeparator",
		"lualine_a_command",
		"lualine_a_insert",
		"lualine_a_normal",
		"lualine_a_visual",
	},
})

vim.keymap.set({"n"}, "<Leader>p", ":TransparentToggle<CR>")

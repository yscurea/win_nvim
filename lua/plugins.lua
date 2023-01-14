local settings = require("core.settings")
local sep = settings.is_windows and [[\]] or [[/]]
local function join(...)
	return table.concat({ ... }, sep)
end

local home = settings.home_path
local config_path = settings.config_path
local cache_path = settings.cache_path
local rtp = { config_path, cache_path }
for _, p in ipairs(vim.opt.runtimepath:get()) do
	if p:sub(1, #home) ~= home then
		rtp[#rtp + 1] = p
	end
end
vim.opt.runtimepath = rtp
local pack_path = join(cache_path, 'site')
local package_root = join(pack_path, 'pack')
local compile_path = join(cache_path, 'plugin', 'packer_compiled.lua')
vim.g.loaded_remote_plugins = 1
vim.opt.packpath:prepend(pack_path)
local packer_bootstrap = false
local packer_install_path = join(
	package_root,
	'packer',
	'start',
	'packer.nvim'
)
if vim.fn.isdirectory(packer_install_path) == 0 then
	vim.fn.system {
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		packer_install_path
	}
	vim.cmd.packadd 'packer.nvim'
	packer_bootstrap = true
end


return require("packer").startup({ function()
	use "wbthomason/packer.nvim" -- プラグイン管理ツール
	use "nathom/filetype.nvim" -- デフォルトのより早いfiletype
	use { -- 起動時間を表示する
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
	}
	use { -- project 管理
		"ahmedkhalf/project.nvim",
		opt = true,
		after = "telescope.nvim",
		config = function() require("project_nvim").setup({}) end,
	}
	use { -- ファイル指定せずに起動したときの画面
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function() require("plugin_configs.dashboard") end,
	}
	------------------------ よく依存されるプラグイン ----------------------- {
	use {
		"nvim-lua/plenary.nvim",
		opt = true,
	}
	use {
		"MunifTanjim/nui.nvim",
		opt = true,
	}
	use {
		"kyazdani42/nvim-web-devicons",
		opt = true,
	}
	-- } ----------------------------- LSP 関連 ----------------------------- {
	use {
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		requires = {
			{ "williamboman/mason.nvim", opt = true },
			{ "williamboman/mason-lspconfig.nvim", opt = true },
			{ "jose-elias-alvarez/null-ls.nvim", opt = true },
			{ "onsails/lspkind.nvim", opt = true },
			{ "hrsh7th/nvim-cmp", opt = true },
			{ "hrsh7th/cmp-path", opt = true },
			{ "hrsh7th/cmp-buffer", opt = true },
			{ "hrsh7th/cmp-cmdline", opt = true },
			{ "hrsh7th/cmp-nvim-lsp", opt = true },
			{ "hrsh7th/cmp-vsnip", opt = true },
			{ "hrsh7th/vim-vsnip", opt = true },
			{ "SmiteshP/nvim-navic", opt = true },
			{ "folke/neodev.nvim", opt = true },
		},
		wants = {
			"nvim-navic",
			"mason.nvim",
			"mason-lspconfig.nvim",
			"null-ls.nvim",
			"lspkind.nvim",
			"nvim-cmp",
			"cmp-path",
			"cmp-buffer",
			"cmp-cmdline",
			"cmp-nvim-lsp",
			"cmp-vsnip",
			"vim-vsnip",
			"neodev.nvim",
		},
		config = function() require('plugin_configs.lsp') end,
	}
	use {
		"SmiteshP/nvim-navic",
		opt = true,
	}
	-- } -------------------------- debug -------------------------------- {
	use {
		"mfussenegger/nvim-dap",
		opt = true,
	}
	use {
		"rcarriga/nvim-dap-ui",
		opt = true,
	}
	use {
		"mfussenegger/nvim-dap-python",
		opt = true,
	}
	-- } -------------------------- 検索関連 -------------------------------- {
	use { -- ファイルツリー
		"nvim-tree/nvim-tree.lua",
		keys = { { "n", "sf" }, },
		setup = function()
			vim.keymap.set("n", "sf", ":NvimTreeToggle<CR>")
		end,
		config = function() require("plugin_configs.tree") end,
		requires = {
			{ "nvim-tree/nvim-web-devicons", opt = true },
		},
		wants = { "nvim-web-devicons" },
	}
	use { -- root設定
		"airblade/vim-rooter",
		event = { "BufAdd", "BufWipeout" },
	}
	use { -- 多種多様なものを検索する最強プラグイン
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		module = "telescope",
		keys = {
			{ "n", "<Leader>tf" },
			{ "n", "<Leader>tb" },
			{ "n", "<Leader>tm" },
			{ "n", "<Leader>tg" },
		},
		setup = function()
			vim.keymap.set("n", "<Leader>tf", ":Telescope find_files<CR>")
			vim.keymap.set("n", "<Leader>tb", ":Telescope file_browser<CR>")
			vim.keymap.set("n", "<Leader>tm", ":Telescope marks<CR>")
			vim.keymap.set("n", "<Leader>tg", ":Telescope live_grep<CR>")
		end,
		requires = {
			{ "airblade/vim-rooter", opt = true },
			{ "ahmedkhalf/project.nvim", opt = true },
			{ "nvim-lua/plenary.nvim", opt = true },
			{ "crispgm/telescope-heading.nvim", opt = true },
			{ "nvim-telescope/telescope-github.nvim", opt = true },
			{ "nvim-telescope/telescope-ui-select.nvim", opt = true },
			{ "nvim-telescope/telescope-file-browser.nvim", opt = true },
			{ "nvim-telescope/telescope-smart-history.nvim", opt = true },
			{ "kkharji/sqlite.lua", opt = true },
		},
		wants = {
			"vim-rooter",
			"project.nvim",
			"plenary.nvim",
			"sqlite.lua",
			"telescope-github.nvim",
			"telescope-heading.nvim",
			"telescope-ui-select.nvim",
			"telescope-file-browser.nvim",
			"telescope-smart-history.nvim",
		},
		config = function() require("plugin_configs.telescope") end,
	}
	use { -- エラー等一覧表示
		"folke/trouble.nvim",
		keys = { { "n", "<C-t>" } },
		setup = function()
			vim.keymap.set("n", "<C-t>", ":TroubleToggle<CR>")
		end,
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		wants = { "nvim-web-devicons" },
		config = function() require("plugin_configs.trouble") end,
	}
	use { -- コマンド出力をバッファ書き込み
		"tyru/capture.vim",
		cmd = "Capture",
	}
	use { -- keymap表示
		"folke/which-key.nvim",
		cmd = "WhichKey",
	}
	-- } ---------------------- カーソル移動関連 ---------------------------- {
	use { -- jk長押しでカーソル加速
		"rhysd/accelerated-jk",
		event = "CursorMoved",
		config = function() require("plugin_configs.accelerate_jk") end,
	}
	use { -- 文字のない部分を飛ばすjk移動
		"haya14busa/vim-edgemotion",
		keys = {
			{ "n", "<Leader>j" }, { "n", "<Leader>k" },
			{ "v", "<Leader>j" }, { "v", "<Leader>k" },
		},
		setup = function()
			local set = vim.keymap.set
			local option = { noremap = true, silent = true }
			set("v", "<Leader>j", "<Plug>(edgemotion-j)", option)
			set("v", "<Leader>k", "<Plug>(edgemotion-k)", option)
			set("n", "<Leader>j", "<Plug>(edgemotion-j)", option)
			set("n", "<Leader>k", "<Plug>(edgemotion-k)", option)
		end,
		config = function() require("plugin_configs.vim-edgemotion") end,
	}
	use { -- カーソル移動をどこでも一発で
		"phaazon/hop.nvim",
		tag = "v2",
		keys = { { "n", "<Leader>ow" }, { "n", "<Leader>ov" } },
		setup = function()
			local set = vim.keymap.set
			set("n", "<Leader>ow", "<cmd>HopWord<CR>")
			set("n", "<Leader>ov", "<cmd>HopVertical<CR>")
		end,
		config = function() require("plugin_configs.hop") end,
	}
	use { -- マルチカーソル
		"mg979/vim-visual-multi",
		event = "CursorMoved",
	}
	-- } ---------------------------- 編集系 -------------------------------- {
	use { -- gccでコメントアウト
		"tpope/vim-commentary",
		event = "BufReadPost",
	}
	-- use {
	-- 	"JoosepAlviste/nvim-ts-context-commentstring",
	-- 	event = "BufReadPre",
	-- 	config = function()
	-- 		require("nvim-treesitter.configs").setup({
	-- 			context_commentstring = {
	-- 				enable = true
	-- 			}
	-- 		})
	-- 	end,
	-- 	requires = {
	-- 		{ "nvim-treesitter/nvim-treesitter", opt = true },
	-- 	},
	-- }
	use { -- editorconfigの使用
		"editorconfig/editorconfig-vim",
		opt = true,
	}
	use { -- 閉じ括弧自動挿入
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function() require("nvim-autopairs").setup() end,
	}
	use { -- 括弧編集強化
		"tpope/vim-surround",
		event = "InsertEnter",
	}
	use { -- 名前のcase変換
		"arthurxavierx/vim-caser",
		event = "InsertEnter",
	}
	use { -- mdのテーブルを楽に書く
		"dhruvasagar/vim-table-mode",
		event = "InsertEnter",
		ft = "md",
	}
	-- } --------------------------- 見た目とか ----------------------------- {
	use { -- colorscheme
		-- "rmehri01/onenord.nvim",
		"navarasu/onedark.nvim",
		config = function() require("plugin_configs.theme") end,
	}
	use { -- 背景透過, shell側で画像を背景にしていればそれが見える
		"xiyaowong/nvim-transparent",
		keys = { { "n", "<Leader>p" } },
		setup = function()
			vim.g.transparent_enabled = true
			local set = vim.keymap.set
			set({ "n" }, "<Leader>p", ":TransparentToggle<CR>")
		end,
		config = function() require("plugin_configs.transparent") end,
	}
	use { -- 通知をリッチに
		"folke/noice.nvim",
		event = { "CmdLineEnter" },
		requires = {
			{ "MunifTanjim/nui.nvim", opt = true },
			{ "rcarriga/nvim-notify", opt = true },
		},
		wants = {
			"nvim-notify",
			"nui.nvim",
		},
		config = function() require("plugin_configs.noice") end,
	}
	use { -- 下に各種情報表示
		"nvim-lualine/lualine.nvim",
		event = "BufReadPost",
		requires = { "rmehri01/onenord.nvim", },
		config = function() require("plugin_configs.lualine") end,
	}
	use { -- 構文解析による色づけ
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPost",
		config = function() require("plugin_configs.treesitter") end,
	}
	use { -- bufferを画面上部に表示
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		event = "BufAdd",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
		wants = { "nvim-web-devicons" },
		setup = function() vim.opt.termguicolors = true end,
		config = function() require("plugin_configs.bufferline") end,
	}
	use { -- 無駄の空白の赤ハイライト
		"ntpeters/vim-better-whitespace",
		event = "BufReadPost",
		setup = function() require("plugin_configs.whitespace") end,
	}
	use { -- markした行を行番号の左にサイン
		"chentoast/marks.nvim",
		event = "CursorMoved",
		config = function() require("plugin_configs.marks") end,
	}
	use { -- スクロールバーを表示
		"petertriho/nvim-scrollbar",
		event = "BufReadPost",
		requires = {
			{ "kevinhwang91/nvim-hlslens", opt = true, },
			{ "lewis6991/gitsigns.nvim", opt = true, },
		},
		wants = { "gitsigns.nvim", "nvim-hlslens" },
		config = function() require("plugin_configs.scrollbar") end,
	}
	use { -- insert modeで行数を絶対値に
		"myusuf3/numbers.vim",
		event = "InsertEnter",
		setup = function() require("plugin_configs.number") end,
	}
	use { -- todoなどのコメントをハイライト、telescopeで検索
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		wants = {
			"plenary.nvim",
			"telescope.nvim",
		},
		config = function() require("plugin_configs.todo-comments") end,
	}
	use { -- fやtコマンドで一回か2回で飛べる文字をハイライト
		"unblevable/quick-scope",
		event = "BufReadPost",
	}
	use { -- 同じ文字をハイライト
		"RRethy/vim-illuminate",
		event = "BufReadPost",
	}
	use { -- カラーコードを色付きで表示
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPost",
		config = function() require("plugin_configs.colorizer") end,
	}
	use { -- indentを見やすくする
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		config = function() require("plugin_configs.indent-blankline") end,
	}
	-- } -------------------------- ターミナル ------------------------------ {
	use { -- ターミナルを使いやすくする
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		keys = { { "n", "<C-]>" }, { "i", "<C-]>" } },
		setup = function()
			vim.keymap.set("n", "<C-]>", "<cmd>ToggleTerm<CR>")
			vim.keymap.set("i", "<C-]>", "<Esc><cmd>ToggleTerm<CR>")
		end,
		config = function() require("plugin_configs.toggleterm") end,
	}
	-- } ----------------------------- 言語 --------------------------------- {
	use {
		"simrat39/rust-tools.nvim",
		ft = { "rs" },
	}
	use {
		"akinsho/flutter-tools.nvim",
		ft = { "dart" },
		cmd = {
			"FlutterRun",
			"FlutterDevices",
			"FlutterEmulators",
			"FlutterReload",
			"FlutterRestart",
			"FlutterQuit",
			"FlutterDetach",
			"FlutterOutlineToggle",
			"FlutterOutlineOpen",
			"FlutterDevTools",
			"FlutterCopyProfilerUrl",
			"FlutterLspRestart",
			"FlutterSuper",
			"FlutterReanalyze",
		},
		requires = {
			"nvim-lua/plenary.nvim",
		},
		wants = { "plenary.nvim" },
		config = function() require("flutter-tools").setup({}) end,
	}
	-- } ----------------------------------------------------------------------

	if packer_bootstrap then
		require('packer').sync()
	end
end,
	config = {
		package_root = package_root,
		compile_path = compile_path,
	}
})

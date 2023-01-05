local set_common_mapping = function()
    local set = vim.keymap.set
    local opts = { noremap = true, silent = true }
	vim.g.mapleader = " "

	-- ESC処理
    set({ "i" }, "jj", "<Esc>", opts)
    set({ "i" }, "jk", "<Esc>", opts)
    set({ "i" }, "kk", "<Esc>", opts)
    set({ "i" }, "kj", "<Esc>", opts)
    set({ "t" }, "jj", "<C-\\><C-n>", opts)

    -- ファイル
    set({ "n" }, "<Leader>w", ":wa<CR>", opts)
    set({ "n" }, "<Leader>d", "\"_d", opts)
    set({ "n" }, "<Leader>c", "\"_c", opts)

    -- window
    set({ "n" }, "ss", ":<C-u>sp<CR>", opts)
    set({ "n" }, "sv", ":<C-u>vs<CR>", opts)
    set({ "n" }, "sJ", "<C-w>J", opts)
    set({ "n" }, "sK", "<C-w>K", opts)
    set({ "n" }, "sL", "<C-w>L", opts)
    set({ "n" }, "sH", "<C-w>H", opts)
    set({ "n" }, "sj", "<C-w>j", opts)
    set({ "n" }, "sk", "<C-w>k", opts)
    set({ "n" }, "sl", "<C-w>l", opts)
    set({ "n" }, "sh", "<C-w>h", opts)
    set({ "n" }, "s>", "<C-w>>", opts)
    set({ "n" }, "s<", "<C-w><", opts)
    set({ "n" }, "s+", "<C-w>+", opts)
    set({ "n" }, "s-", "<C-w>-", opts)
    set({ "n" }, "s=", "<C-w>=", opts)
    set({ "n" }, "s_", "<C-w>_", opts)
    set({ "n" }, "sc", "<C-w>c", opts)
    set({ "n" }, "sn", "<C-w>w", opts)
    set({ "n" }, "sp", "<C-w>W", opts)

    -- タブ
    set({ "n" }, "<Leader>L", "gt", opts)
    set({ "n" }, "<Leader>H", "gT", opts)
    set({ "n" }, "<Leader><", ":tabm -1<CR>", opts)
    set({ "n" }, "<Leader>>", ":tabm -1<CR>", opts)

    -- バッファ
    set({ "n" }, "<Leader>x", ":bd<CR>", opts)

    -- カーソル移動
    set({ "n", "o" }, "gh", "0", opts)
    set({ "n", "o" }, "gl", "$", opts)
    set({ "n" }, "<C-j>", "+", opts)
    set({ "n" }, "<C-k>", "-", opts)
    set({ "i" }, "<C-k>", "<C-o>k", opts)
    set({ "n" }, "zj", "zt", opts)
    set({ "n" }, "zk", "zb", opts)
    set({ "n" }, "<Leader>e", "%", opts)
    set({ "n" }, "<Left>", "<Nop>", opts)
    set({ "n" }, "<Down>", "<Nop>", opts)
    set({ "n" }, "<Up>", "<Nop>", opts)
    set({ "n" }, "<Right>", "<Nop>", opts)
    set({ "o" }, "8", "i(", opts)
    set({ "o" }, "2", 'i"', opts)
    set({ "o" }, "7", "i'", opts)
    set({ "o" }, "@", "i`", opts)
    set({ "o" }, "[", "i[", opts)
    set({ "o" }, "{", "i{", opts)

    -- 編集
    set({ "n" }, "<C-l>", "<Del>", opts)
    set({ "n" }, "+", "<C-a>", opts)
    set({ "n" }, "-", "<C-x>", opts)
    set({ "n" }, "<Leader>re", ":%s;\\<<C-R><C-W>\\>;g<Left><Left>;", opts)
end

set_common_mapping()

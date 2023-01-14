local settings = {}
local os_name = vim.loop.os_uname().sysname


function settings:load_variables()
	-- OSの判定
	self.is_mac = os_name == "Darwin"
	self.is_linux = os_name == "Linux"
	self.is_windows = os_name == "Windows_NT"
	self.is_wsl = vim.fn.has("wsl") == 1

	-- パスの設定
	local path_sep = self.is_windows and "\\" or "/"
	local function join(...) return table.concat({ ... }, path_sep) end
	if self.is_windows then
		self.home_path = os.getenv("USERPROFILE")
	else
		self.home_path = os.getenv("HOME")
	end
	self.config_path = vim.fn.stdpath("config")
	self.cache_path = join(self.home_path, ".cache", "nvim", "nvim-data")
end

settings:load_variables()
return settings

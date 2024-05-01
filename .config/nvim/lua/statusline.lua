vim.cmd([[highlight KomisarMode guifg=#1d2225 guibg=#f1e4c3 gui=bold cterm=bold]])
vim.cmd([[highlight KomisarBranch guifg=#53d306 guibg=#242424 gui=bold cterm=bold]])
vim.cmd([[highlight KomisarFilename guifg=#149dfe guibg=#242424 gui=bold cterm=bold]])

local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "V·LINE",
	[""] = "V·BLOCK",
	["s"] = "SELECT",
	["S"] = "S·LINE",
	[""] = "S·BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "V·REPLACE",
	["c"] = "COMMAND",
	["cv"] = "VIM·EX",
	["ce"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MORE",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}
-- M.base_30 = {
--   white = "#D3C6AA",
--   darker_black = "#272f35",
--   black = "#2b3339", --  nvim bg
--   black2 = "#323a40",
--   one_bg = "#363e44",
--   one_bg2 = "#363e44",
--   one_bg3 = "#3a4248",
--   grey = "#4e565c",
--   grey_fg = "#545c62",
--   grey_fg2 = "#626a70",
--   light_grey = "#656d73",
--   red = "#e67e80",
--   baby_pink = "#ce8196",
--   pink = "#ff75a0",
--   line = "#3a4248", -- for lines like vertsplit
--   green = "#83c092",
--   vibrant_green = "#a7c080",
--   nord_blue = "#78b4ac",
--   blue = "#7393b3",
--   yellow = "#dbbc7f",
--   sun = "#d1b171",
--   purple = "#ecafcc",
--   dark_purple = "#d699b6",
--   teal = "#69a59d",
--   orange = "#e69875",
--   cyan = "#95d1c9",
--   statusline_bg = "#2e363c",
--   lightbg = "#3d454b",
--   pmenu_bg = "#83c092",
--   folder_bg = "#7393b3",
-- }
local function mode()
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format(" %s ", modes[current_mode]):upper()
end

-- LSP block
local function lsp()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	if count["errors"] ~= 0 then
		errors = string.format("%%#LspDiagnosticsError# %d%%*", count["errors"])
	end
	if count["warnings"] ~= 0 then
		warnings = string.format(" %%#LspDiagnosticsWarning# %d%%*", count["warnings"])
	end
	if count["hints"] ~= 0 then
		hints = string.format(" %%#LspDiagnosticsHint# %d%%*", count["hints"])
	end
	if count["info"] ~= 0 then
		info = string.format(" %%#LspDiagnosticsInformation# %d%%*", count["info"])
	end

	return string.format("%s%s%s%s", errors, warnings, hints, info)
end

local smart_file_path = function()
	local buf_name = vim.api.nvim_buf_get_name(0)
	if buf_name == "" then
		return "[No Name]"
	end
	local home = vim.env.HOME
	local is_term = false
	local file_dir = ""

	if buf_name:sub(1, 5):find("term") ~= nil then
		---@type string
		file_dir = vim.env.PWD
		if file_dir == home then
			return "$HOME "
		end
		is_term = true
	else
		file_dir = vim.fs.dirname(buf_name)
	end

	file_dir = file_dir:gsub(home, "~", 1)

	if vim.api.nvim_win_get_width(0) <= 80 then
		file_dir = vim.fn.pathshorten(file_dir)
	end

	if is_term then
		return file_dir .. " "
	else
		return string.format("%s/%s ", file_dir, vim.fs.basename(buf_name))
	end
end

local git_branch = function()
	if vim.g.loaded_fugitive then
		local branch = vim.fn.FugitiveHead()
		if branch ~= "" then
			if vim.api.nvim_win_get_width(0) <= 80 then
				return string.format(" %s", branch:sub(1, 2))
			end
			return string.format(" %s", branch)
		end
	end
	return ""
end

M = {}

function M.setup()
	return table.concat({
		"%#KomisarMode#",
		mode(), -- get current mode
		"%#KomisarBranch# ",
		git_branch(), -- branch name
		" %<", -- spacing
		-- "%{get(b:,'gitsigns_status','')}", -- gitsigns
		"%#KomisarFilename# ",
		smart_file_path(), -- smart full path filename
		"%#Normal# ",
		lsp(),
		"%=%#Normal#", -- right align and add color
		vim.bo.filetype,
		"[%-3.(%l:%c]", -- line number, column number
	})
end

return M

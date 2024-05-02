vim.cmd([[highlight KomisarMode guifg=#1d2225 guibg=#f1e4c3 gui=bold cterm=bold]])

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
		errors = string.format(" %d", count["errors"])
	end
	if count["warnings"] ~= 0 then
		warnings = string.format("  %d", count["warnings"])
	end
	if count["hints"] ~= 0 then
		hints = string.format("  %d", count["hints"])
	end
	if count["info"] ~= 0 then
		info = string.format("  %d", count["info"])
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
		-- "%#KomisarBranch# ",
		"%#Normal# ",
		git_branch(), -- branch name
		" %<", -- spacing
		-- "%{get(b:,'gitsigns_status','')}", -- gitsigns
		smart_file_path(), -- smart full path filename
		"%#Normal# ",
		lsp(),
		"%=", -- right align and add color
		vim.bo.filetype,
		"[%-3.(%l:%c]", -- line number, column number
	})
end

return M

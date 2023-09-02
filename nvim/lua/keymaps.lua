keymap = vim.keymap -- as a shorthand

---------------------
-- <C> - CTRL
-- <S> - Shift
-- <A> - Alt
-- <M> - Meta
-- <Tab> - Tab
---------------------

---------------------
-- General Keymaps
---------------------
-- Mapping hjkl movement with CTRL in Insert Mode
keymap.set("i", "<C-h>", "<Left>", { noremap = true, silent = true })
keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })
keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })

-- Navigate between splitted windows
keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Disable macro recording
keymap.set("n", "q", "<Nop>", { noremap = true, silent = true })
keymap.set("v", "q", "<Nop>", { noremap = true, silent = true })

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })

-- clear search highlights
keymap.set("n", "q", ":silent nohl<CR>", { noremap = true, silent = true })

-- delete single character without copying into register
keymap.set("n", "x", '"_x', { noremap = true, silent = true })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { noremap = true, silent = true }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { noremap = true, silent = true }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { noremap = true, silent = true }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { noremap = true, silent = true }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { noremap = true, silent = true }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>", { noremap = true, silent = true }) -- close current split window

-- buffer management
keymap.set("n", "<leader>to", ":tabnew<CR>", { noremap = true, silent = true }) -- open new tab
-- keymap.set("n", "<leader>x", ":bdelete<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>x", ":bp<bar>sp<bar>bn<bar>bd<CR>", { noremap = true, silent = true })
keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true }) --  go to next tab
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true }) --  go to previous tab
-- keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true }) --  go to next tab
-- keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true }) --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- File manager Neotree
keymap.set("n", "<leader>e", ":Neotree focus<CR>", { noremap = true, silent = true }) -- focus file explorer
keymap.set("n", "<C-n>", ":Neotree close<CR>", { noremap = true, silent = true }) -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true }) -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true }) -- find string in current working directory as you type
keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", { noremap = true, silent = true }) -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true }) -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true }) -- list available help tags
keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", { noremap = true, silent = true }) -- list available help tags
keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { noremap = true, silent = true }) -- find files within current working directory, respects .gitignore

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { noremap = true, silent = true }) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", { noremap = true, silent = true }) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { noremap = true, silent = true }) -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { noremap = true, silent = true }) -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>", { noremap = true, silent = true }) -- mapping to restart lsp if necessary

-- Add json struct tags
keymap.set("n", "<leader>gsj", "<cmd> GoTagAdd json <cr>", { noremap = true, silent = true })
-- Add yaml struct tags
keymap.set("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { noremap = true, silent = true })
-- Remove tags (json/yaml) from struct
keymap.set("n", "<leader>gsr", "<cmd>GoTagRm json,yaml<CR>", { noremap = true, silent = true })
-- Add if err check
keymap.set("n", "<leader>rr", "<cmd>GoIfErr<CR>", { noremap = true, silent = true })

---------------------
-- Debugging Keymaps
---------------------

-- Toggle the DAP UI
keymap.set("n", "<F4>", ":lua require('dapui').toggle()<CR>", { noremap = true, silent = true })

-- Toggle breakpoint
keymap.set("n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>", { noremap = true, silent = true })

-- Continue execution
keymap.set("n", "<F9>", ":lua require('dap').continue()<CR>", { noremap = true, silent = true })

-- Step over, into, out
keymap.set("n", "<F1>", ":lua require('dap').step_over()<CR>", { noremap = true, silent = true })
keymap.set("n", "<F2>", ":lua require('dap').step_into()<CR>", { noremap = true, silent = true })
keymap.set("n", "<F3>", ":lua require('dap').step_out()<CR>", { noremap = true, silent = true })

-- Leader mappings for step commands
keymap.set("n", "<Leader>dsc", ":lua require('dap').continue()<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>dsv", ":lua require('dap').step_over()<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>dsi", ":lua require('dap').step_into()<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>dso", ":lua require('dap').step_out()<CR>", { noremap = true, silent = true })
-- Hover over variables
keymap.set("n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>", { noremap = true, silent = true })
keymap.set("v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>", { noremap = true, silent = true })

-- UI widgets for hovering and displaying scopes
keymap.set("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>", { noremap = true, silent = true })
keymap.set(
	"n",
	"<Leader>duf",
	":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>",
	{ noremap = true, silent = true }
)

-- Open and run the last command in the REPL
keymap.set("n", "<Leader>dro", ":lua require('dap').repl.open()<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>", { noremap = true, silent = true })

-- Set and toggle breakpoints
keymap.set(
	"n",
	"<Leader>dbc",
	":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ noremap = true, silent = true }
)
keymap.set(
	"n",
	"<Leader>dbm",
	":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
	{ noremap = true, silent = true }
)
keymap.set("n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>", { noremap = true, silent = true })

-- Display variables and toggle the DAP UI
keymap.set("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>di", ":lua require('dapui').toggle()<CR>", { noremap = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

function insert_header()
	local lines = {
		"----     __ __",
		"----    / //_/____   ____ ___   (_)_____ ____ _ _____",
		"----   / ,<  / __ \\ / __ `__ \\ / // ___// __ `// ___/",
		"----  / /| |/ /_/ // / / / / // /(__  )/ /_/ // /",
		"---- /_/ |_|\\____//_/ /_/ /_//_//____/ \\__,_//_/",
		"----",
		"---- File        : " .. vim.fn.expand("%:t"),
		"---- Author      : Your Name",
		"---- Description : <input description>",
		"---- Version     : 1.0.0",
		"---- Created     : " .. os.date("%Y-%m-%d"),
		"---- Updated     : " .. os.date("%Y-%m-%d"),
		"----",
	}

	-- Replace lines at the beginning of the file
	-- Adjust the number 13 to the actual number of lines your header takes
	vim.api.nvim_buf_set_lines(0, 0, 13, false, lines)
end

-- Map to <Leader>ih
vim.api.nvim_set_keymap("n", "<Leader>ih", [[<Cmd>lua insert_header()<CR>]], { noremap = true, silent = true })

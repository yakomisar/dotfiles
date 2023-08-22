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
keymap.set("n", "<leader>x", ":bdelete<CR>:bnext<CR>", { noremap = true, silent = true })
keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true }) --  go to next tab
keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true }) --  go to previous tab

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

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { noremap = true, silent = true }) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", { noremap = true, silent = true }) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { noremap = true, silent = true }) -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { noremap = true, silent = true }) -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>", { noremap = true, silent = true }) -- mapping to restart lsp if necessary

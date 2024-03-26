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

-- Mapping hjkl movement with CTRL in Insert Mode (RU)
keymap.set("i", "<C-р>", "<Left>", { noremap = true, silent = true })
keymap.set("i", "<C-о>", "<Down>", { noremap = true, silent = true })
keymap.set("i", "<C-л>", "<Up>", { noremap = true, silent = true })
keymap.set("i", "<C-д>", "<Right>", { noremap = true, silent = true })

-- Navigate between splitted windows
keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Disable macro recording
keymap.set("n", "q", "<Nop>", { noremap = true, silent = true })
keymap.set("v", "q", "<Nop>", { noremap = true, silent = true })

-- use jk/kj to exit insert mode
keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })

-- clear search highlights
keymap.set("n", "q", ":silent nohl<CR>", { noremap = true, silent = true })

-- delete single character without copying into register
keymap.set("n", "x", '"_x', { noremap = true, silent = true })

-- buffer management
keymap.set("n", "<leader>x", ":bp<bar>sp<bar>bn<bar>bd<CR>", { noremap = true, silent = true })

-- Toggle terminal
vim.api.nvim_set_keymap("n", "<D-j>", ":ToggleTerm<CR>", { noremap = true, silent = true })

-- giga yankers and pasters
-- keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste from system clipboard" })
-- keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Del and yank into system clipboard" })
-- keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank into system clipboard" })
-- keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank curr line into system clipboard" })

-- better indenting
keymap.set("v", "<", "<gv", { desc = "Indent v-block to right" })
keymap.set("v", ">", ">gv", { desc = "Indent v-block to left" })

-- adjust split sizes easier
keymap.set("n", "<C-,>", ":vertical resize +3<CR>", { desc = "Expand window in width" })
keymap.set("n", "<C-.>", ":vertical resize -3<CR>", { desc = "Collapse window in width" })

-- center screen on Ctrl+u, Ctrl+d moves
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-------------------------------
-- Automatically close brackets
-------------------------------
-- keymap.set("i", "'", "''<left>")
-- keymap.set("i", '"', '""<left>')
-- keymap.set("i", "(", "()<left>")
-- keymap.set("i", "[", "[]<left>")
-- keymap.set("i", "{;", "{};<left><left>")
-- keymap.set("i", "/*", "/**/<left><left>")
-------------------------------
-------------END---------------
-------------------------------

-- utils
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Rename in curr buffer" })

---------------
-- Visual Maps
---------------
-- sort
keymap.set("v", "<C-s>", ":sort<CR>")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '>-2<CR>gv=gv")
------END------

-- center screen on next
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- move between buffers
keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

----------------------
-- Plugin Keybinds
----------------------

-- File manager Neotree
keymap.set("n", "<leader>e", ":Neotree focus<CR>", { noremap = true, silent = true }) -- focus file explorer
keymap.set("n", "<C-n>", ":Neotree close<CR>", { noremap = true, silent = true }) -- toggle file explorer

----------------------
-- Gopher Keymaps
----------------------
-- Add json struct tags
keymap.set("n", "<leader>gsj", "<cmd>GoTagAdd json<cr>", { noremap = true, silent = true })
-- Add yaml struct tags
keymap.set("n", "<leader>gsy", "<cmd>GoTagAdd yaml<CR>", { noremap = true, silent = true })
-- Add avro struct tags
keymap.set("n", "<leader>gsa", "<cmd>GoTagAdd avro<CR>", { noremap = true, silent = true })
-- Remove tags (json/yaml) from struct
keymap.set("n", "<leader>gsr", "<cmd>GoTagRm json,yaml,avro<CR>", { noremap = true, silent = true })
-- Add if err check
keymap.set("n", "<leader>rr", "<cmd>GoIfErr<CR>", { noremap = true, silent = true })

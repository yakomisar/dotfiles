local defaults = { noremap = true, silent = true } -- as a shorthand
local map = vim.keymap.set -- as a shorthand

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
map("i", "<C-h>", "<Left>", defaults)
map("i", "<C-j>", "<Down>", defaults)
map("i", "<C-k>", "<Up>", defaults)
map("i", "<C-l>", "<Right>", defaults)

-- Navigate between splitted windows
map("n", "<C-h>", "<C-w>h", defaults)
map("n", "<C-j>", "<C-w>j", defaults)
map("n", "<C-k>", "<C-w>k", defaults)
map("n", "<C-l>", "<C-w>l", defaults)

-- Disable macro recording
map("n", "q", "<Nop>", defaults)
map("v", "q", "<Nop>", defaults)

-- Disable space since it is used as a leader key
map("v", "<space>", "<Nop>", defaults)

-- use jk/kj to exit insert mode
map("i", "jk", "<ESC>", defaults)
map("i", "kj", "<ESC>", defaults)

-- clear search highlights
map("n", "q", ":silent nohl<CR>", defaults)

-- delete single character without copying into register
map("n", "x", '"_x', defaults)

-- use U for redo
map("n", "U", "<C-r>", { desc = "redo" })

-- buffer management
map("n", "<leader>x", ":bp<bar>sp<bar>bn<bar>bd<CR>", defaults)

-- Toggle terminal
map("n", "<D-j>", ":ToggleTerm<CR>", defaults)
-- Exit terminal mode shortcut
map("t", "<C-t>", "<C-\\><C-n>")

-- Paste without overwriting register
map("v", "p", [["_dP]], { desc = "Paste from system clipboard" })

-- better indenting
map("v", "<", "<gv", { desc = "Indent v-block to right" })
map("v", ">", ">gv", { desc = "Indent v-block to left" })

-- adjust split sizes easier
map("n", "<C-,>", ":vertical resize +3<CR>", { desc = "Expand window in width" })
map("n", "<C-.>", ":vertical resize -3<CR>", { desc = "Collapse window in width" })

-- center screen on Ctrl+u, Ctrl+d moves
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-------------------------------
-- Automatically close brackets
-------------------------------
-- map("i", "'", "''<left>") -- old
-- map("i", '"', '""<left>')
-- map("i", "(", "()<left>")
-- map("i", "[", "[]<left>")
-- map("i", "{<cr>", "{<cr>}<ESC>kA<CR>") --new
local closing_pairs = { ")", "]", '"', "'", ">", "}" }
local opening_pairs = { "(", "[", '"', "'", "<", "{" }
for key, chr in pairs(opening_pairs) do
	map("i", chr, chr .. closing_pairs[key] .. "<esc>i", {})
end
-------------------------------
-------------END---------------
-------------------------------

-- use U for redo :))
map("n", "U", "<C-r>", {})

-- utils
map("n", "<leader>re", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Rename in curr buffer" })

---------------
-- Visual Maps
---------------
-- sort
map("v", "<C-s>", ":sort<CR>")
-- move selected lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
------END------

-- center screen on next
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- move between buffers
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

----------------------
-- Plugin Keybinds
----------------------

-- File manager Neotree
map("n", "<leader>e", ":Neotree focus<CR>", defaults) -- focus file explorer
map("n", "<C-n>", ":Neotree close<CR>", defaults) -- toggle file explorer

----------------------
-- Gopher Keymaps
----------------------
-- Add json struct tags
map("n", "<leader>gsj", "<cmd>GoTagAdd json<cr>", defaults)
-- Add yaml struct tags
map("n", "<leader>gsy", "<cmd>GoTagAdd yaml<CR>", defaults)
-- Add avro struct tags
map("n", "<leader>gsa", "<cmd>GoTagAdd avro<CR>", defaults)
-- Remove tags (json/yaml) from struct
map("n", "<leader>gsr", "<cmd>GoTagRm json,yaml,avro<CR>", defaults)
-- Add if err check
-- map("n", "<leader>rr", "<cmd>GoIfErr<CR>", defaults)
-- Add if err check (without plugin)
map("n", "<leader>rr", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

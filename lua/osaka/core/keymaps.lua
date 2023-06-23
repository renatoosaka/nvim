vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("n", "<ESC>", ":nohl<CR><ESC>")
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "nh", ":nohl<CR>")
-- keymap.set("n", "x", "_x")

-- incremente/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

keymap.set("n", "<C-n>", ":enew<CR>")

-- split window
keymap.set("n", "ss", ":split<CR><C-w>w")
keymap.set("n", "sv", ":vsplit<CR><C-w>w")
keymap.set("n", "sx", ":close<CR>")

-- Move window
keymap.set("n", "<leader>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- tabs
keymap.set("n", "to", ":tabnew<CR>")
keymap.set("n", "tx", ":tabclose<CR>")
keymap.set("n", "tn", ":tabn<CR>")
keymap.set("n", "tp", ":tabp<CR>")

-- vim-maximizer
keymap.set("n", "sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "fs", "<cmd>lua require('telescope.builtin').live_grep({ additional_args = { '-j1' }})<CR>")
keymap.set("n", "fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "fh", "<cmd>Telescope help_tags<cr>")

-- diffview
keymap.set("n", "dv", ":DiffviewOpen")

-- lazygit
keymap.set("n", "<C-g>", ":LazyGit<CR>")

keymap.set("n", "<C-w>", ":bdelete!<CR>")
keymap.set("n", "<Tab>", ":bnext<CR>")
keymap.set("n", "<S-Tab>", ":bprevious<CR>")

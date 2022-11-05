local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-l>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)
keymap("n", "<C-c>", ":bdelete<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("n", "<A-Down>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-Up>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-Down>", ":m .+1<CR>==", opts)
keymap("v", "<A-Up>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Extra keybinds
keymap("n", "<C-t>", ":ToggleTerm <CR>", opts)
keymap("n", "<C-T>", ":terminal<CR>", opts)
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)
keymap("n", "<esc>", ":noh<CR>", opts)
keymap("n", ":w<CR>", ":Prettier<CR>:w<CR>", opts)

-- Similar keybinds as in alpha dashboard
keymap("n", "<leader>N", ":ene <BAR> startinsert <CR>", opts)
keymap("n", "<leader>f", ":Telescope find_files <CR>", opts)
keymap("n", "<leader>t", ":Telescope live_grep <CR>", opts)
keymap("n", "<leader>r", ":Telescope oldfiles <CR>", opts)
keymap("n", "<leader>d", ":e ~/Projects/ <CR>", opts)
keymap("n", "<leader>dp", ":e ~/Projects/ <CR>", opts)
keymap("n", "<leader>ds", ":e ~/Projects/react-n-ftend/ <CR>", opts)
keymap("n", "<leader>n", ":NvimTreeToggle ~/Documents <CR>", opts)
keymap("n", "<leader>ni", ":e ~/Documents/Ideas.md <CR>", opts)
keymap("n", "<leader>nn", ":e ~/Documents/Notes.md <CR>", opts)
keymap("n", "<leader>nm", ":e ~/Documents/MoMs.md <CR>", opts)
keymap("n", "<leader>c", ":e ~/configs <CR>", opts)
keymap("n", "<leader>cw", ":e ~/configs/bspwm/bspwmrc <CR>", opts)
keymap("n", "<leader>cn", ":e ~/configs/nvim/init.lua <CR>", opts)
keymap("n", "<leader>ck", ":e ~/configs/sxhkd/sxhkdrc <CR>", opts)
keymap("n", "<leader>cl", ":e ~/configs/betterlockscreen/betterlockscreenrc <CR>", opts)
keymap("n", "<leader>q", ":qa<CR>", opts)

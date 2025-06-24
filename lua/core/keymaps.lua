local functions = require("core.functions")
-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to down split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to up split" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

keymap.set("n", "<leader>t", "<cmd>term<CR>i", { desc = "Open terminal" })

keymap.set("n", "<leader>yd", functions.copy_diagnostic_under_cursor, { desc = "Copy diagnostic under cursor" })

keymap.set("n", "]q", "<cmd>cn<CR>", { desc = "Next item in quick fix list" })
keymap.set("n", "[q", "<cmd>cp<CR>", { desc = "Perv item in quick fix list" })

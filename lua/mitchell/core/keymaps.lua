vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode with jj"})

keymap.set("n", "<leader>ch", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers 
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment Number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement Number" })

-- window management 
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make Splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })



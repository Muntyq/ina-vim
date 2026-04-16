--File for remaping keys

--This sets map leader to <space>, then upon calling in normal ("n") mode <space p v> executes :Ex command
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.g.maplocalleader = "\\"


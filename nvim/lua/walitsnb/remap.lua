vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>mb", ":Dispatch mvn clean package<CR>", { noremap = true,  silent = true })
vim.keymap.set("n", "<leader>msr", ":term /home/walitsnb/.config/nvim/scripts/runTargetJAR.sh<CR>")


vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set({ "n", "v" }, "y", '"+y')
vim.keymap.set("n", "Y", '"+Y')
vim.keymap.set("n", "<leader>of", ":!open -R %<CR>", { desc = "Open in Finder" })
return {}

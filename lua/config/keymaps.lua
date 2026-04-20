-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set({ "n", "v" }, "y", '"+y')
vim.keymap.set("n", "Y", '"+Y')

for _, mode in ipairs({ "n", "i", "v" }) do
  vim.keymap.set(mode, "<ScrollWheelUp>", "<C-Y>", { silent = true })
  vim.keymap.set(mode, "<ScrollWheelDown>", "<C-E>", { silent = true })
  vim.keymap.set(mode, "<S-ScrollWheelUp>", "<C-U>", { silent = true })
  vim.keymap.set(mode, "<S-ScrollWheelDown>", "<C-D>", { silent = true })
end

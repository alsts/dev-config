-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set({ "n", "v" }, "y", '"+y')
vim.keymap.set("n", "Y", '"+Y')
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape insert mode" })

for _, mode in ipairs({ "n", "i", "v" }) do
  vim.keymap.set(mode, "<ScrollWheelUp>", "<C-Y>", { silent = true })
  vim.keymap.set(mode, "<ScrollWheelDown>", "<C-E>", { silent = true })
  vim.keymap.set(mode, "<S-ScrollWheelUp>", "<C-U>", { silent = true })
  vim.keymap.set(mode, "<S-ScrollWheelDown>", "<C-D>", { silent = true })
end

local function yank_path(modifier, label)
  return function()
    local path = vim.fn.expand("%:" .. modifier)
    if path == "" then
      vim.notify("No file in buffer", vim.log.levels.WARN)
      return
    end
    vim.fn.setreg("+", path)
    vim.notify(path, vim.log.levels.INFO, { title = "Yanked " .. label })
  end
end

vim.keymap.set("n", "<leader>gR", function()
  vim.cmd("checktime")
  vim.cmd("silent! LspRestart")
  vim.notify("Project Refreshed", vim.log.levels.INFO)
end, { desc = "Git: Reload Files & LSP" })

vim.keymap.set("n", "<leader>yp", yank_path("p", "absolute path"), { desc = "Yank absolute path" })
vim.keymap.set("n", "<leader>yr", yank_path("", "relative path"), { desc = "Yank relative path" })
vim.keymap.set("n", "<leader>yn", yank_path("t", "filename"), { desc = "Yank filename" })
vim.keymap.set("n", "<leader>yd", yank_path("p:h", "directory"), { desc = "Yank directory" })

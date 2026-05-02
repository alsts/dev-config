-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = ""

-- Always use cwd as project root (avoid LazyVim picking the nearest
-- package.json in monorepos like setmindset).
vim.g.root_spec = { "cwd" }

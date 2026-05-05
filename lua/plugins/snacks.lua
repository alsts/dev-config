return {
  "folke/snacks.nvim",
  init = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = "#ffd866" })
        vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { fg = "#908e8f" })
      end,
    })
    vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = "#ffd866" })
    vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { fg = "#908e8f" })
  end,
  opts = {
    dashboard = {
      preset = {
        header = "",
      },
    },
    picker = {
      hidden = true,
      ignored = true,
      exclude = {
        "node_modules",
        ".git",
        "dist",
        "build",
        ".next",
        ".turbo",
        ".cache",
        "coverage",
        ".worktrees",
        ".claude",
        "package-lock.json",
        "pnpm-lock.yaml",
        "yarn.lock",
        "bun.lockb",
      },
      sources = {
        explorer = { hidden = true, ignored = true },
        files = { hidden = true, ignored = true },
        grep = { hidden = true, ignored = true },
        smart = { hidden = true, ignored = true },
      },
    },
    lazygit = {
      theme = {
        inactiveBorderColor = { fg = "Comment" },
      },
      win = {
        wo = {
          winblend = 0,
          winhighlight = "NormalFloat:Normal,FloatBorder:Normal",
        },
      },
    },
  },
}

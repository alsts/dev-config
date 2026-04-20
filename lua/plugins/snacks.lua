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
    picker = {
      sources = {
        explorer = {
          hidden = true,
        },
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

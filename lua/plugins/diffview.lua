return {
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
    },
    keys = {
      { "<leader>gs", "<cmd>DiffviewOpen<cr>", desc = "Git Status (Diffview)" },
      { "<leader>gS", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
      { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gV", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
      { "<leader>gF", "<cmd>DiffviewFileHistory %<cr>", desc = "File History (current)" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch History" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = { layout = "diff2_horizontal" },
        merge_tool = { layout = "diff3_mixed" },
        file_history = { layout = "diff2_horizontal" },
      },
      file_panel = {
        listing_style = "tree",
        win_config = { width = 35 },
      },
      hooks = {
        diff_buf_read = function()
          vim.opt_local.wrap = false
          vim.opt_local.list = false
          vim.opt_local.colorcolumn = ""
        end,
      },
    },
  },
}

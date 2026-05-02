return {
  "loctvl842/monokai-pro.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("monokai-pro").setup({
      filter = "ristretto",
      background_clear = {},
      override = function(c)
        return {
          MiniFilesNormal = { bg = c.editor.background, fg = c.base.white },
          MiniFilesNormalNC = { bg = c.editor.background, fg = c.base.white },
          MiniFilesBorder = { bg = c.editor.background, fg = c.base.dimmed3 },
          MiniFilesBorderModified = { bg = c.editor.background, fg = c.base.red },
          MiniFilesTitle = { bg = c.editor.background, fg = c.base.dimmed3 },
          MiniFilesTitleFocused = { bg = c.editor.background, fg = c.base.yellow, bold = true },
          MiniFilesCursorLine = { bg = "#1a1a1a" },
          MiniFilesDirectory = { fg = c.base.blue, bg = c.editor.background },
          MiniFilesFile = { fg = c.base.white, bg = c.editor.background },

          DiffAdd = { bg = "#132a1a", fg = "NONE" },
          DiffChange = { bg = "#132a1a", fg = "NONE" },
          DiffDelete = { bg = "#3a1519", fg = "#6e2a2f" },
          DiffText = { bg = "#1c5c31", fg = "NONE", bold = true },

          DiffviewDiffAdd = { bg = "#132a1a", fg = "NONE" },
          DiffviewDiffAddAsDelete = { bg = "#3a1519", fg = "NONE" },
          DiffviewDiffChange = { bg = "#132a1a", fg = "NONE" },
          DiffviewDiffDelete = { bg = "#2a0f12", fg = "#4a1a20" },
          DiffviewDiffText = { bg = "#1c5c31", fg = "NONE", bold = true },
          DiffviewDiffDeleteDim = { bg = "#2a0f12", fg = "#3a1519" },

          DiffviewFilePanelTitle = { fg = "#c9d1d9", bold = true },
          DiffviewFilePanelCounter = { fg = "#8b949e", bold = true },
          DiffviewFilePanelFileName = { fg = "#e6edf3" },
          DiffviewFilePanelPath = { fg = "#8b949e" },
          DiffviewFilePanelRootPath = { fg = "#c9d1d9", bold = true },
          DiffviewFilePanelSelected = { fg = "#e6edf3", bold = true },
          DiffviewFolderName = { fg = "#909dab" },
          DiffviewFolderSign = { fg = "#6e7681" },
          DiffviewStatusModified = { fg = "#c9d1d9", bold = true },
          DiffviewStatusAdded = { fg = "#8b949e", bold = true },
          DiffviewStatusDeleted = { fg = "#8b949e", bold = true },
          DiffviewStatusRenamed = { fg = "#c9d1d9", bold = true },
          DiffviewStatusUntracked = { fg = "#8b949e", bold = true },
          DiffviewNonText = { fg = "#545d68" },
          DiffviewReference = { fg = "#8b949e" },
          DiffviewSecondary = { fg = "#8b949e" },

          GitSignsAdd = { fg = "#57ab5a", bg = "NONE" },
          GitSignsChange = { fg = "#daaa3f", bg = "NONE" },
          GitSignsDelete = { fg = "#f47067", bg = "NONE" },

          SnacksPickerDir = { fg = c.sideBar.foreground, bg = c.sideBar.background },
          SnacksPickerFile = { fg = c.sideBar.foreground, bg = c.sideBar.background },
          SnacksPickerPathHidden = { fg = "#ffd866", bg = c.sideBar.background },
          SnacksPickerPathIgnored = { fg = "#908e8f", bg = c.sideBar.background },
          SnacksPickerListCursorLine = { bg = "#1a1a1a" },
          SnacksPickerList = { bg = c.sideBar.background },
          SnacksPickerListItem = { bg = c.sideBar.background },
        }
      end,
    })
    vim.cmd.colorscheme("monokai-pro")

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "minifiles",
      callback = function(args)
        vim.api.nvim_set_option_value("winblend", 0, { win = vim.api.nvim_get_current_win() })
        vim.bo[args.buf].bufhidden = "wipe"
      end,
    })
  end,
}

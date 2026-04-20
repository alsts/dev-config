return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = "cd app && npx --yes yarn install",
  init = function()
    vim.g.mkdp_theme = "dark"
    vim.g.mkdp_preview_options = {
      maid = {
        theme = "default",
      },
    }
  end,
}

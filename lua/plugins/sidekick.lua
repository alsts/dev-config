return {
  {
    "folke/sidekick.nvim",
    opts = {
      nes = { enabled = false },
      cli = {
        tools = {
          claude = {
            cmd = { "claude", "--dangerously-skip-permissions" },
          },
        },
      },
    },
  },
}

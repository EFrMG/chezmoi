return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewToggleFiles", "DiffviewFileHistory" },
  config = true,
  keys = {
    { "<leader>an", "<cmd>DiffviewOpen<cr>",          desc = "Diffview open" },
    { "<leader>aN", "<cmd>DiffviewClose<cr>",         desc = "Diffview close" },
    { "<leader>am", "<cmd>DiffviewToggleFiles<cr>",   desc = "Diffview toggle files" },
    { "<leader>ab", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview file history" },
  },
}

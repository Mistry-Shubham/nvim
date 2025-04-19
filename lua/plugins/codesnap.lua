return {
  "mistricky/codesnap.nvim",
  event = "VeryLazy",
  build = "make",
  cmd = { "CodeSnap", "CodeSnapSave" },
  opts = {
    has_breadcrumbs = true,
    bg_theme = "sea",
    watermark = "",
    bg_padding = 40,
  },
  keys = {
    { "<leader>cc", ":CodeSnap<CR>", mode = "x", desc = "Save snap to clipboard" },
    { "<leader>cs", ":CodeSnapSave<CR>", mode = "x", desc = "Save snap to pictures directiory" },
  },
}

return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  keys = {
    { "<leader>gd", "<cmd>Gvdiffsplit<CR>", desc = "Git Diff (vsplit)" },
    { "<leader>gD", "<cmd>Gdiffsplit<CR>", desc = "Git Diff" },
    { "<leader>gB", "<cmd>Git blame<CR>", desc = "Git blame all line" },
  },
}

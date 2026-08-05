return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  keys = {
    { "<leader>gc", "<cmd>only<CR>", desc = "Close diff split view" },
    { "<leader>gd", "<cmd>Gvdiffsplit!<CR>", desc = "Git Diff (vsplit)" },
    { "<leader>gD", "<cmd>Gdiffsplit!<CR>", desc = "Git Diff" },
    { "<leader>gB", "<cmd>Git blame<CR>", desc = "Git blame all line" },
    { "<leader>gq", "<cmd>Git mergetool<CR>", desc = "Create quick fix list of merge conflicts" },
    { "<leader>go", "<cmd>diffgett //2<CR>", desc = "Choose our changes" },
    { "<leader>gt", "<cmd>diffgett //3<CR>", desc = "Choose their changes" },
  },
}

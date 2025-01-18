return {
  -- Git fugitive
  { "tpope/vim-fugitive" },
  -- Todo comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  -- colorizer
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  -- Vim commentary
  { "tpope/vim-commentary" },
  -- Codesanp
  {
    "mistricky/codesnap.nvim",
    build = "make",
    cmd = { "CodeSnap", "CodeSnapSave" },
    opts = {
      has_breadcrumbs = true,
      bg_theme = "sea",
      watermark = "",
      bg_padding = 80,
    },
  },
}

return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    opts = {},
  },
}

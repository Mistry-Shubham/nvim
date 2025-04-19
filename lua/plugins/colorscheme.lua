return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local bg = true

    require("onedark").setup({
      style = "darker",
      transparent = bg, -- Show/hide background
      term_colors = true, -- Change terminal color as per the selected theme style
      ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    })
    require("onedark").load()

    local toggle_transparency = function()
      bg = not bg
      require("onedark").setup({
        transparent = bg, -- Show/hide background
      })
      require("onedark").load()
    end
    vim.keymap.set("n", "<leader>bg", toggle_transparency, { desc = "Toggle background transparency" })
  end,
}

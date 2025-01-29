return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local mode = {
      "mode",
      fmt = function(str)
        return " " .. str
        -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
      end,
    }

    local function get_path_based_on_window_size()
      local width = vim.fn.winwidth(0) -- Get the current window width
      if width < 101 then
        return 0 -- Just show the filename if the window width is less than 80
      else
        return 1 -- Show absolute path if the window width is greater than 120
      end
    end

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local filename = {
      "filename",
      file_status = true, -- displays file status (readonly status, modified status)
      path = get_path_based_on_window_size(), -- 0 = just filename, 1 = relative path, 2 = absolute path
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " ", info = " ", hint = " " },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      "diff",
      colored = true,
      symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
      cond = hide_in_width,
    }

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "nord", -- Set theme based on environment variable
        -- Some useful glyphs:
        -- https://www.nerdfonts.com/cheat-sheet
        --        
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "neo-tree" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { "branch" },
        lualine_c = { filename },
        lualine_x = { diagnostics, diff, { "encoding", cond = hide_in_width }, { "filetype", cond = hide_in_width } },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { { "location", padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive" },
    })
  end,
}

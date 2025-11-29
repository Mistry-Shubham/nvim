return {
  "romgrk/barbar.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local barbar = require("barbar")
    local icons = require("core.icons")

    local set_hl = vim.api.nvim_set_hl

    barbar.setup({
      icons = {
        buffer_index = false,
        buffer_number = false,
        pinned = { button = "", filename = true },
        custom_colors = false,
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = icons.error },
          [vim.diagnostic.severity.WARN] = { enabled = true, icon = icons.warn },
          [vim.diagnostic.severity.HINT] = { enabled = true, icon = icons.hint },
          [vim.diagnostic.severity.INFO] = { enabled = true, icon = icons.info },
        },
      },
      sidebar_filetypes = {
        NvimTree = true,
        undotree = { text = "Undotree" },
        ["neo-tree"] = { event = "BufWipeout" },
      },
    })

    local function hl(name)
      return vim.api.nvim_get_hl(0, { name = name })
    end

    local colors = {
      error = hl("DiagnosticError").fg or "#ff0000",
      warn = hl("DiagnosticWarn").fg or "#ffaa00",
      info = hl("DiagnosticInfo").fg or "#00aaff",
      hint = hl("DiagnosticHint").fg or "#aaaaaa",
    }

    local function set_diag(name, fg)
      set_hl(0, "BufferCurrent" .. name, { fg = fg, bg = "none" })
      set_hl(0, "BufferVisible" .. name, { fg = fg, bg = "none" })
      set_hl(0, "BufferInactive" .. name, { fg = fg, bg = "none" })
    end

    set_diag("ERROR", colors.error)
    set_diag("WARN", colors.warn)
    set_diag("INFO", colors.info)
    set_diag("HINT", colors.hint)

    set_hl(0, "BufferInactiveERROR", { bg = "none" })
    set_hl(0, "BufferInactiveWARN", { bg = "none" })
    set_hl(0, "BufferInactiveINFO", { bg = "none" })
    set_hl(0, "BufferInactiveHINT", { bg = "none" })

    set_hl(0, "BufferCurrentSign", { bg = "none" })
    set_hl(0, "BufferVisibleSign", { bg = "none" })
    set_hl(0, "BufferInactiveSign", { bg = "none" })

    set_hl(0, "BufferCurrent", { fg = "#00aaff", bold = true })
    set_hl(0, "BufferInactive", { fg = "#aaaaaa" })

    local set = vim.api.nvim_set_hl

    set(0, "TabLineFill", { bg = "none" })
    set(0, "TabLine", { bg = "none" })
    set(0, "TabLineSel", { bg = "none" })
    set(0, "BufferTabpageFill", { bg = "none", underline = true })

    local keymap = vim.keymap
    keymap.set("n", "<Tab>", "<cmd>:BufferNext<CR>", { desc = "Switch next buffer" })
    keymap.set("n", "<S-Tab>", "<cmd>:BufferPrevious<CR>", { desc = "Switch previous buffer" })
    keymap.set("n", "<A-n>", "<cmd>:BufferMoveNext<CR>", { desc = "Move buffer to right" })
    keymap.set("n", "<A-p>", "<cmd>:BufferMovePrevious<CR>", { desc = "Move buffer to left" })
    keymap.set("n", "<leader>bp", "<cmd>:BufferPin<CR>", { desc = "Pin/Unpin buffer" })
    keymap.set("n", "<leader>bx", "<cmd>:BufferClose<CR>", { desc = "Close current active buffer" })
    keymap.set("n", "<leader>ba", "<cmd>:BufferCloseAllButCurrentOrPinned<CR>", { desc = "Close all the buffers (except pinned and current)" })
    keymap.set("n", "<leader>bA", "<cmd>:BufferCloseAllButCurrent<CR>", { desc = "Close all the buffers (except current)" })

    keymap.set("n", "<leader>bs", function()
      local options = {
        { label = "Buffer Number", cmd = "BufferOrderByBufferNumber" },
        { label = "Name", cmd = "BufferOrderByName" },
        { label = "Directory", cmd = "BufferOrderByDirectory" },
        { label = "Language", cmd = "BufferOrderByLanguage" },
        { label = "Window Number", cmd = "BufferOrderByWindowNumber" },
      }

      vim.ui.select(options, {
        prompt = "Sort buffers by:",
        format_item = function(item)
          return item.label
        end,
      }, function(choice)
        if choice then
          vim.cmd(choice.cmd)
        end
      end)
    end, { desc = "Sort buffers by" })
  end,
}

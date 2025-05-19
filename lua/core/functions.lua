local M = {}

function M.copy_diagnostic_under_cursor()
  local diagnostics = vim.diagnostic.get(0)
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local line = cursor_pos[1] - 1
  local col = cursor_pos[2]

  for _, diag in ipairs(diagnostics) do
    if diag.lnum == line and col >= diag.col and col <= (diag.end_col or diag.col + 1) then
      vim.fn.setreg("+", diag.message) -- System clipboard
      vim.notify("Copied diagnostic to clipboard")
      return
    end
  end

  vim.notify("No diagnostic under cursor", vim.log.levels.INFO)
end

return M

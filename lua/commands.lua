function openColorSelectPopup()
  local buf = vim.api.nvim_create_buf(false, true)
  local current_scheme = vim.g.colors_name
  local colour_schemes = vim.fn.getcompletion('', 'color')
  local current_index = 1

  for i, c in ipairs(colour_schemes) do
    vim.fn.appendbufline(buf, i-1, c)
    if c == current_scheme then
      current_index = i
    end
  end

  vim.api.nvim_buf_set_option(buf, 'readonly', true)

  local gheight = vim.api.nvim_list_uis()[1].height
  local gwidth = vim.api.nvim_list_uis()[1].width
  local popup_height = math.min(50, #colour_schemes)
  local popup_width = 60
  local opts = {
    relative = 'editor',
    width = popup_width,
    height = popup_height,
    row = math.floor((gheight - popup_height) / 2),
    col = math.floor((gwidth - popup_width) / 2),
    style = 'minimal'
  }

  vim.api.nvim_create_autocmd({'CursorMoved'}, {
    buffer = buf,
    callback = function(ops)
      local current_line_num = vim.api.nvim_win_get_cursor(0)[1]
      vim.cmd('colorscheme ' .. colour_schemes[current_line_num])
    end
  })

  local w = vim.api.nvim_open_win(buf, 0, opts)
  vim.api.nvim_win_set_option(w, 'cursorline', true)
  vim.api.nvim_win_set_cursor(w, {current_index, 0})
end

function filterQuickfixList(opts)
  local qfentries = vim.fn.getqflist() 
  local res = {}
  local query = opts.fargs[1]
  for i,v in ipairs(qfentries) do
    if not(string.match(vim.fn.bufname(v.bufnr), query)) then
      table.insert(res, v)
    end
  end
  vim.fn.setqflist(res, 'r')
end

vim.api.nvim_create_user_command("MyFilterQf", filterQuickfixList, { nargs=1 })

local M = {}

-- Show git-tracked file
local function show_git_file(rev, relative_path, current_file, current_line, buf_name)
  -- Open in a new buffer in the current window
  vim.cmd("enew")
  local bufnr = vim.api.nvim_get_current_buf()
  local winid = vim.api.nvim_get_current_win()

  vim.api.nvim_set_option_value("buftype", "nofile", { buf = bufnr })
  vim.api.nvim_set_option_value("swapfile", false, { buf = bufnr })

  -- Use a table to avoid shell expansion issues and improve performance
  local output = vim.fn.systemlist({ "git", "show", string.format("%s:%s", rev, relative_path) })

  if vim.v.shell_error ~= 0 then
    vim.notify("Git error: Could not retrieve file.", vim.log.levels.ERROR)
    vim.api.nvim_buf_delete(bufnr, { force = true })
    return
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, output)
  -- Set filetype based on detected type OR extension
  local ft = vim.filetype.match({ filename = current_file }) or vim.fn.fnamemodify(current_file, ":e")
  vim.api.nvim_set_option_value("filetype", ft, { buf = bufnr })
  vim.api.nvim_set_option_value("modified", false, { buf = bufnr })
  vim.api.nvim_buf_set_name(bufnr, buf_name)

  local last_line = vim.api.nvim_buf_line_count(bufnr)
  local target_line = math.min(current_line, last_line)

  vim.api.nvim_win_set_cursor(winid, { target_line, 0 })
  vim.cmd("normal! zz")
end

-- Retrieve git-tracked file accross branches and revs
function M.view_git_version()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_file = vim.api.nvim_buf_get_name(current_buf)
  local current_line = vim.api.nvim_win_get_cursor(0)[1]

  -- Get relative path for git show
  local relative_path = vim.fn.systemlist({ "git", "ls-files", "--full-name", current_file })[1]

  if not relative_path or relative_path == "" then
    vim.notify("File not tracked by Git", vim.log.levels.WARN)
    return
  end

  -- 1. Select Branch
  Snacks.picker.git_branches({
    layout = "select",
    title = "Select Branch",
    confirm = function(picker, item)
      picker:close()
      if not item then
        return
      end

      local branch = item.branch or item.text:match("^%*?%s*(%S+)")

      -- 2. Select Revision from that branch (filtered for current file)
      Snacks.picker.git_log({
        cmd_args = { branch, "--", relative_path },
        layout = "select",
        title = string.format("Select Rev (%s): %s", branch, relative_path),
        confirm = function(picker2, item2)
          picker2:close()
          if item2 then
            local rev = item2.commit or item2.text:match("(%x+)")
            local buf_name = string.format("git://%s/%s", rev, relative_path)
            show_git_file(rev, relative_path, current_file, current_line, buf_name)
          end
        end,
      })
    end,
  })
end

-- Copy relative or absolute path of current file
function M.copy_path(absolute)
  local path = not absolute and vim.fn.expand("%:.") or vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied: "' .. path .. '"')
end

-- Execute file / script
function M.run_script()
  local file_extension = vim.fn.expand("%:e")
  local file_path = vim.fn.expand("%:p")

  local cmds = {
    js = "node",
    lua = "lua",
    sh = "bash",
    py = "python3",
  }

  local cmd = cmds[file_extension]
  if cmd then
    if file_extension == "sh" and vim.fn.has("unix") == 1 then
      if vim.fn.executable(file_path) == 0 then
        vim.fn.system("chmod +x " .. vim.fn.shellescape(file_path))
        vim.notify("Made script executable: " .. file_path, vim.log.levels.INFO)
      end
    end
    vim.cmd("term " .. cmd .. " " .. file_path)
  else
    vim.notify("No runner configured for ." .. file_extension, vim.log.levels.WARN)
  end
end

-- Run shell command
function M.run_shell_cmd()
  vim.ui.input({ prompt = "Run Shell Command: " }, function(input)
    if input and input ~= "" then
      vim.cmd("term " .. input)
    end
  end)
end

-- Query visual selection
function M.db_query_visual()
  local clients = { "psql", "sqlite3", "mysql" }

  vim.ui.select(clients, { prompt = "Select DB client:" }, function(choice)
    if not choice then
      return
    end
    local db_client = choice

    vim.cmd('normal! "qy')
    local query = vim.fn.getreg('q')

    vim.cmd("term echo " .. vim.fn.shellescape(query) .. " | " .. db_client)
  end)
end

-- Close all normal buffers
function M.close_all_normal_buff()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      local bt = vim.api.nvim_get_option_value("buftype", { buf = buf })

      -- Only normal buffers
      if bt == "" then
        -- Save if modified
        if vim.api.nvim_get_option_value("modified", { buf = buf }) then
          vim.api.nvim_buf_call(buf, function()
            vim.cmd("silent write")
          end)
        end

        vim.api.nvim_buf_delete(buf, {})
      end
    end
  end
end

-- Toggle cursor line highlight
function M.toggle_cursor_line_highlight()
  vim.wo.cursorline = not vim.wo.cursorline
end

-- Temporary buffer with filetype selection
function M.create_temp_with_picker()
  local filetypes = vim.fn.getcompletion('', 'filetype')

  Snacks.picker.select(filetypes, {
    prompt = " 󰈚 Temporary Buffer Filetype ",
  }, function(choice)
    -- On Esc / nil
    if not choice then return end

    vim.cmd("enew")
    local bufnr = vim.api.nvim_get_current_buf()

    vim.api.nvim_set_option_value("buftype", "nofile", { buf = bufnr })
    vim.api.nvim_set_option_value("swapfile", false, { buf = bufnr })
    vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = bufnr })
    vim.api.nvim_set_option_value("filetype", choice, { buf = bufnr })
    vim.api.nvim_buf_set_name(bufnr, choice:upper())
  end)
end

return M

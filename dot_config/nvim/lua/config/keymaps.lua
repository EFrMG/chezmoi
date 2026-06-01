local map = vim.keymap.set
-- local del = vim.keymap.del
local gitsigns = require("gitsigns")
local grug_far = require("grug-far")

-- Utils module
local utils = require("utils.utils")

-- SYSTEM --.

-- Quit All
map("n", "<C-q>", "<Cmd>qa<CR>", { desc = "Quit All", silent = true })

-- Restart
map("n", "<C-S-q>", "<Cmd>:restart<CR>", { desc = "Restart Nvim", silent = true, noremap = true })

-- Save without formatting
map({ "n", "v", "i" }, "<C-S-s>", "<Cmd>noa w<CR>", { desc = "Save w/o formatting", silent = true })

-- Show full path of buffer
map({ "n" }, "<leader>af", "<Cmd>echo expand('%:p')<CR>", { desc = "Full buffer path", silent = true })

-- :diffthis
map("n", "<leader>at", "<Cmd>diffthis<CR>", { desc = "Diff this!", silent = true })
-- :diffoff
map("n", "<leader>ao", "<Cmd>diffoff<CR>", { desc = "Diff off!", silent = true })

-- MOTIONS --.

-- Additional up and down motions
map({ 'n', 'v' }, "<C-j>", "<C-d>zz", { noremap = true })
map({ 'n', 'v' }, "<C-k>", "<C-u>zz", { noremap = true })

-- Move cursor to start of line
map("n", "<leader>m", "0", { noremap = true })
-- Move cursor to end of line
map("n", "<leader>o", "$", { noremap = true })

-- Keeps the cursor centered when jumping through search results
map("n", "n", "nzz", { desc = "Next search result (centered)" })
map("n", "N", "Nzz", { desc = "Prev search result (centered)" })

-- YANK / PUT --.

-- Yank to system clipboard
map("v", "<C-c>", '"+y', { noremap = true, silent = true })

-- Put from last yank
map({ "n", "v" }, "<leader>ap", '"0p', { desc = "Put from last yank", noremap = true, silent = true })

-- Put from system clipboard
map({ "n", "v" }, "<leader>aP", '"+p', { desc = "Put from system clipboard", noremap = true, silent = true })

-- Delete in normal and visual modes without yanking.
map({ "n", "v" }, "d", '"_d')
map("n", "D", '"_D')
map({ "n", "v" }, "c", '"_c')
map("n", "C", '"_C')
map({ "n", "v" }, "x", '"_x')
map("n", "X", '"_X')
map("v", "p", '"_dp')
map("v", "P", '"_dP')

-- Yank to the default register when deleting text, like the original commands.
map({ "n", "v" }, "<leader>ay", "", { desc = "Cut text bindings" })
map({ "n", "v" }, "<leader>ayl", "dd", { desc = "Cut single line" })
map({ "n", "v" }, "<leader>ayd", "d", { desc = "Cut with d" })
map("n", "<leader>ayD", "D", { desc = "Cut to end of line" })
map({ "n", "v" }, "<leader>ayc", "c", { desc = "Cut and change" })
map("n", "<leader>ayC", "C", { desc = "Cut to end of line and change" })
map({ "n", "v" }, "<leader>ayx", "x", { desc = "Cut character" })
map("n", "<leader>ayX", "X", { desc = "Cut character before cursor" })

-- PLUGINS --.

-- gitsigns
map("n", "<leader>ah", function()
  gitsigns.nav_hunk("next")
end, { desc = "Next hunk" })

map("n", "<leader>aH", function()
  gitsigns.nav_hunk("prev")
end, { desc = "Previous hunk" })

-- vim-visual-multi.
-- Add new cursor at position
map("n", "<leader>aa", "<Plug>(VM-Add-Cursor-At-Pos)", { desc = "Add new cursor", noremap = false })

-- Select all with new cursor
map("n", "<leader>aA", "<Plug>(VM-Select-All)", { desc = "New cursor in all occurrences", noremap = false })
map("x", "<leader>aA", "<Plug>(VM-Visual-All)", { desc = "New cursor in all occurrences (visual)", noremap = false })

-- Code companion --.
-- CodeCompanion: Chat
map("n", "<leader>ai", "<Cmd>CodeCompanionChat<CR>", { desc = " CodeCompanion: Chat", noremap = true, silent = true })

-- CodeCompanion: Actions
map("n", "<leader>aI", "<Cmd>CodeCompanionActions<CR>",
  { desc = " CodeCompanion: Actions", noremap = true, silent = true })

-- grug-far.
-- Search word under cursor
map("n", "<leader>aR", function()
  grug_far.open({
    prefills = { search = vim.fn.expand("<cword>") },
  })
end, { desc = "S & R word under cursor" })

-- Search in the current buffer
map("n", "<leader>ar", function()
  grug_far.open({
    prefills = { paths = vim.fn.expand("%") },
  })
end, { desc = "S & R in current buffer" })

-- Search word/s under cursor in the current buffer
map("v", "<leader>ar", function()
  grug_far.with_visual_selection({
    prefills = { paths = vim.fn.expand("%") },
  })
end, { desc = "S & R visual selection in current buffer" })

-- DIAGNOSTICS --.
--
-- Next diagnostic
map("n", "<leader>ad", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Next diagnostic" })

-- Previous diagnostic
map("n", "<leader>aD", function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = "Previous diagnostic" })

-- Next error
map("n", "<leader>ae", function()
  vim.diagnostic.jump({
    count = 1,
    severity = vim.diagnostic.severity.ERROR,
  })
end, { desc = "Next error" })

-- Previous error
map("n", "<leader>aE", function()
  vim.diagnostic.jump({
    count = -1,
    severity = vim.diagnostic.severity.ERROR,
  })
end, { desc = "Previous error" })

-- Next warning
map("n", "<leader>aw", function()
  vim.diagnostic.jump({
    count = 1,
    severity = vim.diagnostic.severity.WARN,
  })
end, { desc = "Next warning" })

-- Previous warning
map("n", "<leader>aW", function()
  vim.diagnostic.jump({
    count = -1,
    severity = vim.diagnostic.severity.WARN,
  })
end, { desc = "Previous warning" })

-- MODULE FUNCTIONS --.

-- Retrieve git-tracked file accross branches and revs
map("n", "<leader>ag", function()
  utils.view_git_version()
end, { desc = "Git: Retrieve file from history" })

-- Copy relative or absolute path of current file
map("n", "<leader>ac", function()
  utils.copy_path(false)
end, { desc = "Copy Relative Path" })
map("n", "<leader>aC", function()
  utils.copy_path(true)
end, { desc = "Copy Absolute Path" })

-- Run shell command
map("n", "<leader>ax", function()
  utils.run_shell_cmd()
end, { desc = "Run shell command" })

-- Execute file / script
map("n", "<leader>aX", function()
  utils.run_script()
end, { desc = "Run file!" })

-- Query visual selection
map("v", "<leader>aq", function()
  utils.db_query_visual()
end, { desc = "Query visual selection" })

-- Close all normal buffers
map("n", "<leader>bA", function()
  utils.close_all_normal_buff()
end, { desc = "Close all normal buffers" })

-- Toggle cursor line highlight
map("n", "<leader>al", function()
  utils.toggle_cursor_line_highlight()
end, { desc = "Toggle cursor line highlight" })

-- Temporary buffer with filetype selection
map("n", "<leader>bs", function()
  utils.create_temp_with_picker()
end, { desc = "Temporary buffer" })

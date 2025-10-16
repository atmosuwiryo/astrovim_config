-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Terminal
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  local bufname = vim.fn.bufname()
  
  -- Only set the escape mapping for regular ToggleTerm terminals, not LazyGit
  if vim.bo.buftype == "terminal" and 
     string.find(bufname, "toggleterm") and 
     not string.find(bufname:lower(), "lazygit") then
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)  -- escape from terminal's insert mode
  end
end

-- Apply the terminal keymaps check for all terminal buffers
vim.cmd('autocmd! TermOpen * lua set_terminal_keymaps()')

-- ToggleTerm Float Toggle Mapping
vim.keymap.set({'n', 'i', 't'}, '<C-\\>', '<Cmd>ToggleTerm direction=float<CR>', { noremap = true, silent = true })

-- WinterIsComing theme
-- vim.cmd("colorscheme WinterIsComing-dark-blue-color-theme")

vim.cmd("colorscheme default")

-- enable background transparency for all themes
-- vim.cmd [[
--   highlight Normal guibg=none
--   highlight NonText guibg=none
--   highlight Normal ctermbg=none
--   highlight NonText ctermbg=none
--   highlight SignColumn guibg=none
--   highlight NormalFloat guibg=none
--   highlight FloatBorder guibg=none
--   highlight Pmenu guibg=none
--   highlight PmenuSel guibg=#3a3a3a
--   highlight CursorLine guibg=#1a1a1a
--   highlight LineNr guibg=none
--   highlight VertSplit guibg=none
--   highlight StatusLine guibg=none
--   highlight StatusLineNC guibg=none
--   highlight TabLine guibg=none
--   highlight TabLineFill guibg=none
--   highlight Comment gui=italic
--   highlight FoldColumn guibg=none
--   highlight Folded guibg=none
-- ]]

-- Add this to your AstroNvim user configuration
-- Typically in ~/.config/nvim/lua/user/init.lua or similar

-- Simple version - just add to your AstroNvim user config
-- Store the transparency state
local transparency_enabled = false

-- Function to toggle transparency
local function toggle_transparency()
  if transparency_enabled then
    -- Disable transparency (set backgrounds)
      vim.cmd("colorscheme " .. vim.g.colors_name)
  else
    -- Enable transparency (your current code)
    vim.cmd [[
      highlight Normal guibg=none
      highlight NonText guibg=none
      highlight Normal ctermbg=none
      highlight NonText ctermbg=none
      highlight SignColumn guibg=none
      highlight NormalFloat guibg=none
      highlight FloatBorder guibg=none
      highlight Pmenu guibg=none
      "highlight PmenuSel guibg=#3a3a3a
      "highlight CursorLine guibg=#1a1a1a
      highlight LineNr guibg=none
      highlight VertSplit guibg=none
      highlight StatusLine guibg=none
      highlight StatusLineNC guibg=none
      highlight TabLine guibg=none
      highlight TabLineFill guibg=none
      "highlight Comment gui=italic
      highlight FoldColumn guibg=none
      highlight Folded guibg=none
    ]]
  end
  transparency_enabled = not transparency_enabled
end

-- Set the keymap
vim.keymap.set('n', '<C-t>', toggle_transparency, { desc = "Toggle transparency" })

-- Apply initial transparency
toggle_transparency()
toggle_transparency() -- Call twice to start with transparency enabled

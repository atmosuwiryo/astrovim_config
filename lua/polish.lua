-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Terminal
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)  -- escape from terminal's insert mode
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- WinterIsComing theme
vim.cmd("colorscheme WinterIsComing-dark-blue-color-theme")

-- enable background transparency for all themes
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight SignColumn guibg=none
  highlight NormalFloat guibg=none
  highlight FloatBorder guibg=none
  highlight Pmenu guibg=none
  highlight PmenuSel guibg=#3a3a3a
  highlight CursorLine guibg=#1a1a1a
  highlight LineNr guibg=none
  highlight VertSplit guibg=none
  highlight StatusLine guibg=none
  highlight StatusLineNC guibg=none
  highlight TabLine guibg=none
  highlight TabLineFill guibg=none
  highlight Comment gui=italic
  highlight FoldColumn guibg=none
  highlight Folded guibg=none
]]

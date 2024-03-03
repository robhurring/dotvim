vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('t', 'jk', '<C-\\><C-n>')

-- indent
vim.keymap.set('n', '<leader>=', 'gg=G<C-o>')

-- movement
vim.keymap.set('n', '<c-q>', vim.cmd.bdelete)
vim.keymap.set('n', '<c-x>', vim.cmd.bunload)
vim.keymap.set('n', '<localleader><localleader>', ':b#<cr>')

-- newlines
vim.keymap.set('i', '<s-cr>', '<c-o>o')
vim.keymap.set('i', '<c-cr>', '<c-o>O')

-- splits
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- move
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- paste
vim.keymap.set('x', '<leader>p', '"_dP')

-- j/k menu
vim.keymap.set('i', '<c-k>', function()
  return vim.fn.pumvisible() == 1 and 'k' or '<Up>'
end, { silent = true, expr = true })

vim.keymap.set('i', '<c-j>', function()
  return vim.fn.pumvisible() == 1 and 'j' or '<Down>'
end, { silent = true, expr = true })

-- j/k on displayed lines
vim.keymap.set('n', 'gk', 'k')
vim.keymap.set('n', 'gj', 'j')

vim.keymap.set({ 'n', 'x' }, 'j', function()
  return vim.v.count > 0 and 'j' or 'gj'
end, { noremap = true, expr = true })

vim.keymap.set({ 'n', 'x' }, 'k', function()
  return vim.v.count > 0 and 'k' or 'gk'
end, { noremap = true, expr = true })

-- toggle quick/loc
vim.keymap.set('n', '<leader>q', function()
  require('toggles.quickfix').toggle()
end)

vim.keymap.set('n', '<leader>l', function()
  require('toggles.location').toggle()
end)

-- comments - <c-/>
vim.keymap.set('n', '<c-_>', function()
  return vim.v.count == 0
      and '<Plug>(comment_toggle_linewise_current)'
      or '<Plug>(comment_toggle_linewise_count)'
end, { expr = true })
vim.keymap.set('x', '<c-_>', '<Plug>(comment_toggle_linewise_visual)')

-- toggles
vim.keymap.set('n', 'cor', ':set relativenumber!<cr>')
vim.keymap.set('n', 'cow', ':set wrap!<cr>')

-- undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- misc
vim.keymap.set({ 'i', 'n' }, '<c-s>', '<esc>:update<cr>')
vim.keymap.set('c', 'w!!', 'w !sudo tee > /dev/null %')
vim.keymap.set('n', '*', '*``')
vim.keymap.set('n', '<leader>/', vim.cmd.noh, { silent = true })
vim.keymap.set('v', '.', ':normal .<CR>')
vim.keymap.set('v', '@', ':normal! @<CR>')
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', 'gv', '`[v`]')
vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set({ 'n', 'v' }, '<tab>', '>>')
vim.keymap.set({ 'n', 'v' }, '<s-tab>', '<<')

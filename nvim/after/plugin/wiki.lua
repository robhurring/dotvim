local wikipath = os.getenv('XDG_DATA_HOME') .. '/kiwi'

if not vim.loop.fs_stat(wikipath) then
  vim.fn.system({
    'mkdir', '-p',
    wikipath,
  })
end

require('kiwi').setup({
  {
    name = 'work',
    path = wikipath
  }
})

local kiwi = require('kiwi')

-- Necessary keybindings
vim.keymap.set('n', '<leader>ww', kiwi.open_wiki_index, {})
vim.keymap.set('n', 'T', kiwi.todo.toggle, {})

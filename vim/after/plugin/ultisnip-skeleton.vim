" https://noahfrederick.com/log/vim-templates-with-ultisnips-and-projectionist
if !exists('g:did_plugin_ultisnips')
  finish
endif

augroup ultisnips_custom
  autocmd!
  " trigger after projectionist creates a file
  autocmd User ProjectionistActivate silent! call snippet#InsertSkeleton()
  " autocmd BufNewFile * silent! call snippet#InsertSkeleton()
augroup END

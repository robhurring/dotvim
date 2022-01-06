if !exists('g:loaded_lightline')
  finish
endif

if exists('g:loaded_lightline_customizations')
  finish
endif
let g:loaded_lightline_customizations = 1

let g:lightline = {
      \'colorscheme': 'darculaOriginal',
      \'active': {
      \   'left': [['shortmode', 'paste'], ['root'], ['readonly', 'filename', 'modified']],
      \   'right': [['trailing', 'linter', 'mylineinfo'], ['filetype', 'spell']]
      \ },
      \'component': {
      \   'shortmode': '%{strpart(lightline#mode(), 0, 1)}',
      \   'filename': '%{expand("%:t")}',
      \   'root': '%{pathshorten(fnamemodify(getcwd(), ":~:."))}',
      \   'spell': '%{&spell?&spelllang:""}',
      \   'mylineinfo': '%3l:%-2v %p%%'
      \ },
      \ 'component_function': {
      \ },
      \ 'component_expand': {
      \   'trailing': 'LLTrailingSpaceWarning',
      \   'linter': 'coc#status'
      \ },
      \ 'component_type': {
      \   'trailing': 'error',
      \   'linter': 'error'
      \ },
      \'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'spell': '&spell'
      \ },
      \ }

augroup StatuslineGroup
  autocmd!
  autocmd CursorHold,BufWritePost,InsertLeave * call s:flags()
augroup END

function! s:flags()
  call LLTrailingSpaceWarning()
  call lightline#update()
endfunction

function! LLTrailingSpaceWarning()
  let l:trailing = search('\s$', 'nw')
  return (l:trailing != 0) ? get(g:, 'my_trailing_space_icon', '… ') . trailing : ''
endfunction

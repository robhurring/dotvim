if g:my_statusline != 'lightline'
  finish
endif

let g:lightline = {
      \'colorscheme': 'wombat',
      \'active': {
      \   'left': [['shortmode', 'paste'], ['root', 'ctrlpmark'], ['readonly', 'filename', 'modified']],
      \   'right': [['trailing', 'neomake', 'lineinfo'], ['filetype']]
      \ },
      \'component': {
      \   'fugitive': '%{exists("*fugitive#head")?"\ue0a0 ".fugitive#head():""}',
      \   'syntax': '%{neomake#statusline#LoclistStatus()}',
      \   'shortmode': '%{strpart(lightline#mode(), 0, 1)}',
      \   'filename': '%{expand("%:t") == "ControlP" ? g:lightline.ctrlp_item : expand("%:p")}',
      \   'root': '%{pathshorten(fnamemodify(getcwd(), ":~:."))}'
      \ },
      \ 'component_function': {
      \   'ctrlpmark': 'CtrlPMark'
      \ },
      \ 'component_expand': {
      \   'trailing': 'LLTrailingSpaceWarning',
      \   'neomake': 'LLNeomake'
      \ },
      \ 'component_type': {
      \   'trailing': 'error',
      \   'neomake': 'error'
      \ },
      \'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
      \ },
      \ }

augroup StatuslineGroup
  autocmd!
  autocmd CursorHold,BufWritePost,InsertLeave * call s:flags()
augroup END

function! s:flags()
  if exists('#LightLine')
    call LLTrailingSpaceWarning()
    call LLNeomake()
    call lightline#update()
  endif
endfunction

function! LLTrailingSpaceWarning()
  let l:trailing = search('\s$', 'nw')
  return (l:trailing != 0) ? "… " . trailing : ''
endfunction

function! LLNeomake()
  let l:counts = neomake#statusline#LoclistCounts()
  let l:warnings = get(l:counts, 'W', 0)
  let l:errors = get(l:counts, 'E', 0)

  if l:warnings > 0
    return "\uf00d ".string(l:warnings + l:errors)
  endif

  return ''
endfunction

" ---> CtrlP format

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction


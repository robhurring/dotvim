if exists('g:toggle_conceal')
  finish
end

let g:toggle_conceal = 1
let s:originallevel = &conceallevel

function! s:ToggleConceal(concealing) abort
  if a:concealing
    exec 'set conceallevel='.s:originallevel
  else
    exec 'set conceallevel='.get(g:, 'toggle_conceallevel', 0)
  endif
endfunction

" turn off _all_ concealing nonsense when in insert mode.
augroup ToggleConcealGroup
  autocmd!
  autocmd InsertEnter * call s:ToggleConceal(0)
  autocmd InsertLeave * call s:ToggleConceal(1)
augroup END

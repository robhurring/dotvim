if exists('g:loaded_helpers')
  finish
endif

let g:loaded_helpers = 1

function! g:helpers#GetSelection() range abort
  let l:reg_save = getreg('"')
  let l:regtype_save = getregtype('"')
  normal! ""gvy
  let l:selection = getreg('"')
  call setreg('"', l:reg_save, l:regtype_save)
  return l:selection
endfunction


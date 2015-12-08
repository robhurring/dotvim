if exists('g:loaded_helpers')
  finish
endif

let g:loaded_helpers = 1

function! g:helpers#selection() range abort
  let l:reg_save = getreg('"')
  let l:regtype_save = getregtype('"')
  normal! ""gvy
  let l:selection = getreg('"')
  call setreg('"', l:reg_save, l:regtype_save)
  return l:selection
endfunction

function! g:helpers#fullname(f)
  let f = a:f
  let f = len(f) ? f : expand('%')
  return fnamemodify(f, ':p')
endfunction

function! g:helpers#projectroot(...)
  let current = g:helpers#fullname(a:0 ? a:1 : '')
  let l:markers = ['.git']

  for marker in l:markers
    while 1
      let prev = current
      let current = fnamemodify(current, ':h')
      if isdirectory(current.'/'.marker)
        return current
      endif
      if current ==# prev
        break
      endif
    endwhile
  endfor
  return ''
endfunction

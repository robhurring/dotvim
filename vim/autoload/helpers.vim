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

function! g:helpers#opselection(type) abort
  let regsave = @@
  let selsave = &selection
  let &selection = 'inclusive'

  if a:type =~? 'v'
    silent execute "normal! gvy"
  elseif a:type == 'line'
    silent execute "normal! '[V']y"
  else
    silent execute "normal! `[v`]y"
  endif

  let &selection = selsave
  let l:theselection = @@
  let @@ = regsave

  return l:theselection
endfunction

function! g:helpers#fullname(f)
  let f = a:f
  let f = len(f) ? f : expand('%')
  return fnamemodify(f, ':p')
endfunction

function! g:helpers#projectroot(...)
  let fullname = g:helpers#fullname(a:0 ? a:1 : '')
  let l:markers = ['Gemfile', '.git']

  for marker in l:markers
    let current = fullname
    while 1
      let prev = current
      let current = fnamemodify(current, ':h')
      let current_marker = current.'/'.marker

      if filereadable(current_marker) || isdirectory(current_marker)
        return current
      endif
      if current == prev
        break
      endif
    endwhile
  endfor
  return ''
endfunction

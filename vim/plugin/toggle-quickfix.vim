if exists('g:toggle_quickfix')
  finish
end

let g:toggle_quickfix = 1

function! s:GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! s:ToggleList(bufname, pfx)
  let l:buflist = s:GetBufferList()
  for l:bufnum in map(filter(split(l:buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(l:bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx ==? 'l' && len(getloclist(0)) == 0
    echohl ErrorMsg
    echo 'Location List is Empty.'
    return
  endif
  let l:winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != l:winnr
    wincmd p
  endif
endfunction

command! ToggleLocationList call s:ToggleList('Location List', 'l')
command! ToggleQuickfixList call s:ToggleList('Quickfix List', 'c')

nnoremap <Plug>(toggle-location-list) :ToggleLocationList<CR>
nnoremap <Plug>(toggle-quickfix-list) :ToggleQuickfixList<CR>

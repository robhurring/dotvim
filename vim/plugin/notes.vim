if exists('g:my_notes')
  finish
end
let g:my_notes = 1

" todos, notes, misc stuff
function! s:notes(...)
  let l:notes_query = '(TODO|NOTE|INFO|ERROR|HACK):'
  let l:extra_args = ''

  if a:0 > 0
    let l:extra_args = join(a:000, ' ')
  endif

  call g:grepper#parse_command(1, '-tool ag -query "' . l:notes_query . '" ' . l:extra_args)
endfunction

command! -nargs=* -complete=file Notes call s:notes(<f-args>)

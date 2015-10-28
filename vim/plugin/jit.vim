if exists('g:jit_loaded')
  finish
end

let g:jit_loaded = 1

if !exists('g:jit_command')
  let g:jit_command = 'jit'
end

function! s:JitRun(command, ...) range abort
  if a:0 == 0
    let l:args = g:helpers#GetSelection()
  else
    let l:args = join(a:000, ' ')
  endif

  silent execute ':!' . g:jit_command . ' ' . shellescape(a:command) . ' ' . shellescape(l:args)
endfunction

command! -nargs=* -range Jit call s:JitRun(<f-args>)


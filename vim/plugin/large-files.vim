if exists('g:large_file_handling')
  finish
end

let g:large_file_handling = 1

if !exists('g:large_file_size_mb')
  let g:large_file_size_mb = 10
end

function! <SID>OptimizeLargeFile()
  " no syntax highlighting etc
  set eventignore+=FileType
  " save memory when other file is viewed
  setlocal bufhidden=unload
  " is read-only (write with :w new_filename)
  setlocal buftype=nowrite
  " no undo possible
  setlocal undolevels=-1

  " echo message
  autocmd! VimEnter *  echo 'The file is larger than ' . (g:large_file_size_mb) . ' MB, so some options are changed (see .vimrc for details).'
endfunction

augroup LargeFileGroup
  autocmd!
  autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > (1024 * 1024 * g:large_file_size_mb) || f == -2 | call s:OptimizeLargeFile() | endif
augroup END

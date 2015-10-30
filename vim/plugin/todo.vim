if exists('g:todos_loaded')
  finish
endif

let g:todos_loaded = 1

if !exists('g:todo_file')
  let g:todo_file = expand('~/vim/todos.md')
endif

if !exists('g:todo_done_symbol')
  let g:todo_done_symbol = 'x'
endif

function! s:MakeTodo(val)
  return '[ ] ' . a:val
endfunction

function! s:Strip(val)
  return substitute(a:val,'^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

function! s:AddTodos(messages)
  let l:todoer = string(function('s:MakeTodo')) . '(v:val)'
  let l:todos = map(a:messages, l:todoer)

  call writefile(l:todos, g:todo_file, 'a+')
endfunction

function! s:Todo(bang, ...) range
  let l:todos = []

  if a:bang ==? 1
    let l:stripper = string(function('s:Strip')) . '(v:val)'
    let l:todos = map(getline(a:firstline, a:lastline), l:stripper)
  elseif a:0 > 0
    let l:todos = [join(a:000, ' ')]
  endif

  if l:todos != []
    call s:AddTodos(l:todos)
  else
    execute ':e ' . g:todo_file
  end
endfunction

command! -nargs=* -range -bang Todo <line1>,<line2>call <SID>Todo(<bang>0, <f-args>)

" Yanked from https://github.com/vitalk/vim-simple-todo/blob/master/plugin/simple-todo.vim

" Insert todo
nnoremap <silent> <Plug>(todo-new) i[ ]<space>
inoremap <silent> <Plug>(todo-new) [ ]<space>

inoremap <silent> <Plug>(todo-new-above) <Esc>O[ ]<space>
nnoremap <silent> <Plug>(todo-new-above) O[ ]<space>

inoremap <silent> <Plug>(todo-new-below) <Esc>o[ ]<space>
nnoremap <silent> <Plug>(todo-new-below) o[ ]<space>

" Mark as done
nnoremap <silent> <Plug>(todo-mark-as-done) :execute 's/^\(\s*[-+*]\?\s*\)\[ \]/\1[' . g:todo_done_symbol . ']/'<cr>\|:noh<cr>
      \:silent! call repeat#set("\<Plug>(todo-mark-as-done)")<cr>
vnoremap <silent> <Plug>(todo-mark-as-done) :execute 's/^\(\s*[-+*]\?\s*\)\[ \]/\1[' . g:todo_done_symbol . ']/'<cr>\|:noh<cr>
      \:silent! call repeat#set("\<Plug>(todo-mark-as-done)")<cr>
inoremap <silent> <Plug>(todo-mark-as-done) <Esc>:execute 's/^\(\s*[-+*]\?\s*\)\[ \]/\1[' . g:todo_done_symbol . ']/'<cr>\|:noh<cr>
      \:silent! call repeat#set("\<Plug>(todo-mark-as-done)")<cr>

" Mark as undone
nnoremap <silent> <Plug>(todo-mark-as-undone) :execute 's/^\(\s*[-+*]\?\s*\)\[' . g:todo_done_symbol . ']/\1[ ]/'<cr>\|:noh<cr>
      \:silent! call repeat#set("\<Plug>(todo-mark-as-undone)")<cr>
vnoremap <silent> <Plug>(todo-mark-as-undone) :execute 's/^\(\s*[-+*]\?\s*\)\[' . g:todo_done_symbol . ']/\1[ ]/'<cr>\|:noh<cr>
      \:silent! call repeat#set("\<Plug>(todo-mark-as-undone)")<cr>
inoremap <silent> <Plug>(todo-mark-as-undone) <Esc>:execute 's/^\(\s*[-+*]\?\s*\)\[' . g:todo_done_symbol . ']/\1[ ]/'<cr>\|:noh<cr>
      \:silent! call repeat#set("\<Plug>(todo-mark-as-undone)")<cr>


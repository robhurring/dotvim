if exists('g:jit_loaded')
  finish
end

let g:jit_loaded = 1

if !exists('g:jit_command')
  let g:jit_command = 'jit'
end

function! s:JitRun(subcommand, ...) abort
  let l:jit_command = g:jit_command . ' ' . a:subcommand
  let l:jit_args = ''

  if a:0 > 0
    let l:jit_args = join(a:000, ' ')
  endif

  silent execute ':!' . l:jit_command . ' ' . l:jit_args
endfunction

function! s:JitPrompt(...) abort
  let l:args = ''
  let l:prompt = g:jit_command

  if a:0 > 0
    let l:args = join(a:000, ' ')
    let l:prompt = l:prompt . ' ' . l:args
  endif

  call inputsave()
  let l:input = input(l:prompt . ' ')
  call inputrestore()

  if l:input !=? ''
    call s:JitRun(l:args . ' ' . l:input)
  endif
endfunction

command! -nargs=* Jit call s:JitRun(<f-args>)
command! -nargs=* JitPrompt call s:JitPrompt(<f-args>)

nnoremap <silent> <Plug>(jit-prompt) :JitPrompt<CR>

nnoremap <silent> <Plug>(jit-open-word) :Jit open <cWORD><CR>
nnoremap <silent> <Plug>(jit-open-prompt) :JitPrompt open<CR>

nnoremap <silent> <Plug>(jit-branch-word) :Jit branch <cWORD><CR>
nnoremap <silent> <Plug>(jit-branch-prompt) :JitPrompt branch<CR>

nnoremap <silent> <Plug>(jit-copy-word) :Jit copy <cWORD><CR>
nnoremap <silent> <Plug>(jit-copy-prompt) :JitPrompt copy<CR>

nnoremap <silent> <Plug>(jit-bind-word) :Jit bind <cWORD><CR>
nnoremap <silent> <Plug>(jit-bind-prompt) :JitPrompt bind<CR>

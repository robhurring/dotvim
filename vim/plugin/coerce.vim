if exists('g:coerce_loaded')
  finish
end

let g:coerce_loaded = 1

" from vim-abolish
" https://github.com/tpope/vim-abolish/blob/master/plugin/abolish.vim#L107-L139

function! g:coerce#mixedcase(word)
  return substitute(g:coerce#camelcase(a:word),'^.','\u&','')
endfunction

function! g:coerce#camelcase(word)
  let word = substitute(a:word, '-', '_', 'g')
  if word !~# '_' && word =~# '\l'
    return substitute(word,'^.','\l&','')
  else
    return substitute(word,'\C\(_\)\=\(.\)','\=submatch(1)==""?tolower(submatch(2)) : toupper(submatch(2))','g')
  endif
endfunction

function! g:coerce#snakecase(word)
  let word = substitute(a:word,'::','/','g')
  let word = substitute(word,'\(\u\+\)\(\u\l\)','\1_\2','g')
  let word = substitute(word,'\(\l\|\d\)\(\u\)','\1_\2','g')
  let word = substitute(word,'[.-]','_','g')
  let word = tolower(word)
  return word
endfunction

function! g:coerce#dashcase(word)
  return substitute(g:coerce#snakecase(a:word),'_','-','g')
endfunction

function! g:coerce#dotcase(word)
  return substitute(g:coerce#snakecase(a:word),'_','.','g')
endfunction

function! s:OperatorReplace(type, func)
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:type == 'line'
    silent exe "normal! '[V']y"
  elseif a:type == 'block'
    silent exe "normal! `[\<C-V>`]y"
  else
    silent exe "normal! `[v`]y"
  endif

  call setreg('@@', function(a:func)(@@))
  exe 'normal! gv""p'

  let &selection = sel_save
  let @@ = reg_save
endfunction

function! s:OpMixedCase(type)
  call s:OperatorReplace(a:type, 'coerce#mixedcase')
endfunction

function! s:OpSnakeCase(type)
  call s:OperatorReplace(a:type, 'coerce#snakecase')
endfunction

function! s:OpCamelCase(type)
  call s:OperatorReplace(a:type, 'coerce#camelcase')
endfunction

function! s:OpDashCase(type)
  call s:OperatorReplace(a:type, 'coerce#dashcase')
endfunction

function! s:OpDotCase(type)
  call s:OperatorReplace(a:type, 'coerce#dotcase')
endfunction

nmap <Plug>(op-coerce-mixedcase) :set opfunc=<SID>OpMixedCase<CR>g@
nmap <Plug>(op-coerce-snakecase) :set opfunc=<SID>OpSnakeCase<CR>g@
nmap <Plug>(op-coerce-camelcase) :set opfunc=<SID>OpCamelCase<CR>g@

nnoremap <Plug>(coerce-snakecase) :call helpers#snakecase(<cWORD>)<CR>
nnoremap <Plug>(coerce-mixedcase) :call helpers#mixedcase(<cWORD>)<CR>
nnoremap <Plug>(coerce-camelcase) :call helpers#camelcase(<cWORD>)<CR>
nnoremap <Plug>(coerce-dashcase) :call helpers#dashcase(<cWORD>)<CR>
nnoremap <Plug>(coerce-dotcase) :call helpers#dotcase(<cWORD>)<CR>

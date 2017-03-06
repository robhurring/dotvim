nmap <buffer> <localleader>r <Plug>(go-run)
nmap <buffer> <localleader>b <Plug>(go-build)
nmap <buffer> <localleader>t :GoTest!<CR>
nmap <buffer> <localleader>gd <Plug>(go-doc)
nmap <buffer> <localleader>gv <Plug>(go-doc-vertical)
nmap <buffer> <localleader>gi <Plug>(go-implements)
nmap <buffer> <localleader>i <Plug>(go-info)
nmap <buffer> <localleader>I <Plug>(go-import)

" run go-import from insert mode on previous <cword>
inoremap <buffer> <c-i> <Esc>:execute <C-u>call go#import#SwitchImport(1, '', expand('<cword>'), '')<CR>a

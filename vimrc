" vim:fdm=marker

if !has('nvim')
  set nocompatible
endif
filetype off

let g:mapleader=','
let g:localmapleader=','

inoremap <C-c> <Esc>
inoremap jk <Esc>l
nnoremap ,, , " reset default , behavior

if $TERM =~ '256color'
  set t_Co=256
elseif $TERM =~ '^xterm$'
  set t_Co=256
endif

filetype plugin indent on                  " Do filetype detection and load custom file plugins and indent files
syntax on

" Plugins {{{
call plug#begin('~/.vim/plugged')

" dependencies

Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'mattn/webapi-vim'
Plug 'tmhedberg/matchit'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-dispatch'

" color schemes

Plug 'nanotech/jellybeans.vim'"
Plug 'sheerun/vim-wombat-scheme'

" misc plugins

Plug 'terryma/vim-expand-region'

Plug 'Chiel92/vim-autoformat'
let g:formatdef_rbeautify = '"ruby-beautify ".(&expandtab ? "-s -c ".&shiftwidth : "-t")'

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger       = "<Tab>"
let g:UltiSnipsJumpForwardTrigger  = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
" let g:UltiSnipsListSnippets        = "<C-h>"

Plug 'bling/vim-airline'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_detect_paste = 1
let g:airline_theme = 'bubblegum'

let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

Plug 'bronson/vim-trailing-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'jszakmeister/vim-togglecursor'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'mattn/gist-vim', {'on': 'Gist'}
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1

Plug 'mhinz/vim-signify'
let g:signify_vcs_list = ['git']

Plug 'mkitt/tabline.vim'
Plug 'rizzatti/dash.vim', {'on': 'Dash'}
Plug 'rking/ag.vim'
let g:ag_working_path_mode = 'r'
let g:ackprg = 'ag -f --vimgrep'

Plug 'gabesoft/vim-ags'
let g:ags_agmaxcount = 500

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
let nerdtreeignore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$' ]
let nerdtreehighlightcursorline=1
let nerdtreeshowbookmarks=1
let nerdtreeshowfiles=1

Plug 'scrooloose/syntastic'
let g:syntastic_enable_signs = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:quickfixsigns_classes = ['qfl']

Plug 'szw/vim-tags'
let g:vim_tags_auto_generate = 0
let g:vim_tags_cache_dir = expand('~/.vim/tmp')
let g:vim_tags_directories = ['.git']
let g:vim_tags_main_file = 'tags'
let g:vim_tags_use_language_field = 1
let g:vim_tags_use_vim_dispatch = 1

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/YankRing.vim'
let g:yankring_history_dir = '$HOME/.vim/tmp'
let g:yankring_manual_clipboard_check = 0
let g:yankring_replace_n_pkey = ''
let g:yankring_replace_n_nkey = ''

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMapSpace = 0
let g:AutoPairsMultilineClose = 0

Plug 'wincent/ferret'

" markdown/textile/etc

Plug 'amiorin/vim-textile', {'for': 'textile'}
Plug 'vitalk/vim-simple-todo', {'for': 'markdown'}
let g:simple_todo_map_keys = 0

Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'shime/vim-livedown', {'for': 'markdown'}

" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" let g:instant_markdown_autostart = 0
" let g:instant_markdown_slow = 1

" html/css/js

Plug 'elzr/vim-json', {'for': 'json'}
let g:vim_json_syntax_conceal = 0

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-e>'

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plug 'pangloss/vim-javascript'
let g:used_javascript_libs = 'underscore,angularjs,jquery,angularui,jasmine,react'

Plug 'tpope/vim-jdaddy', {'for': 'json'}
Plug 'tpope/vim-ragtag'

" go

Plug 'fatih/vim-go', {'for': 'go'}
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1
let g:go_dispatch_enabled = 1
let g:go_fmt_command = 'goimports'

" ruby

Plug 'AndrewRadev/splitjoin.vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'janko-m/vim-test'
let test#ruby#rspec#executable = 'auto-bundle-exec rspec'
let test#ruby#rspec#options = {
      \ 'nearest': '--backtrace',
      \ 'file':    '--format documentation',
      \ 'suite':   '',
      \}
if has('nvim')
  let test#strategy = 'neovim'
elseif has('gui_running')
  let test#strategy = 'iterm'
else
  let test#strategy = 'dispatch'
endif

Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" ABRT error: https://github.com/Valloric/YouCompleteMe/issues/8
" Solutions: add this to your ~/.<shell>rc
"   export DYLD_FORCE_FLAT_NAMESPACE=1
" Other: re-compile VIM with the homebrew version of python
" Other: `brew unlink python` and run YCM installer
Plug 'Valloric/YouCompleteMe', {'do': './install.py --gocode-completer' }
let g:ycm_key_list_select_completion   = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:ycm_completion_confirm_key       = '<Enter>'
let g:ycm_min_num_of_chars_for_completion = 3
" let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1

" local plugins
if filereadable(expand('~/.plugins.local.vim'))
  source ~/.plugins.local.vim
endif
call plug#end()
" runtime macros/matchit.vim
" }}} /plugins

" Options {{{
" http://vimdoc.sourceforge.net/htmldoc/quickref.html

set autoindent
set backspace=eol,start,indent                   " Allow backspacing over indent, eol, & start
set backupdir=~/.vim/tmp
set clipboard=unnamed
set colorcolumn=80
set complete-=i
set cursorline
set diffopt=filler,iwhite                        " In diff mode, ignore whitespace changes and align unchanged lines
set directory=~/.vim/swap                        " Directory to use for the swap file
set eol
set expandtab
set exrc                                         " enable per-directory .vimrc files
set guifont=Hack:h15
set hidden                                       " Don't abandon buffers moved to the background
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set list                                         " Display unprintable characters
set listchars=tab:▸\ ,extends:»,precedes:«
set noerrorbells                                 " Disable error bells
set nowrap
set nrformats=                                   " default to decimal
set number
set scrolloff=3                                  " Start scrolling 3 lines before the horizontal window border
set secure                                       " disable unsafe commands in local .vimrc files
set sessionoptions-=help                         " don't restore help windows
set shiftround
set shiftwidth=2
set shortmess+=A                                 " Toggle paste mode while in insert mode with F12
set showcmd
set showmatch
set smartcase
set smartindent
set smarttab
set splitbelow
set splitright
set tabstop=2
set tags+=./tags
set tags+=.git/tags
set undodir=~/.vim/undo
set undofile
set updatecount=100                              " Write swap file to disk every 100 chars
set wildignore+=*/tmp/*,*/log/*,*.zip,*.so,*.swp
set wildmenu                                     " Enhanced completion hints in command line

" use zsh on where available
if executable('zsh')
  set shell=zsh
endif
set shellcmdflag=-lc

" set ruler
if has('mouse')
  set mouse=a
endif

" GUI rules
if has('gui_running')
endif

" fix nvim's <C-h>
if has('nvim')
  nmap <BS> <C-w>h
endif

" viminfo: remember certain things when we exit
" (http://vimdoc.sourceforge.net/htmldoc/usr_21.html)
"   %    : saves and restores the buffer list
"   '100 : marks will be remembered for up to 30 previously edited files
"   /100 : save 100 lines from search history
"   h    : disable hlsearch on start
"   "500 : save up to 500 lines for each register
"   :100 : up to 100 lines of command-line history will be remembered
"   n... : where to save the viminfo files
set viminfo='100,/100,h,\"500,:100,n~/.vim/viminfo
" }}}

" Theme"{{{
try
  colorscheme wombat
catch
endtry
highlight SignColumn cterm=none ctermbg=233
highlight LineNr cterm=none ctermbg=233
highlight Search cterm=none ctermfg=177 ctermbg=238
highlight CursorLine ctermbg=235
" highlight ColorColumn ctermbg=234 guibg=#222222
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929

highlight SignifySignAdd    cterm=bold ctermbg=233 ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=233 ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=233 ctermfg=227
"}}}

" Mappings {{{

" Search settings
nmap <leader>/ :noh<CR>

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" delete into blackhole register by default
nnoremap <leader>d "ad
nnoremap <leader>dd "add
nnoremap <leader>D "aD
nnoremap <leader>p "ap
nnoremap <leader>P "aP

" jump to end after pasting
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]
" nnoremap <silent> P P`]

" fatfingers
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e

" saving
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" buffers / windows
nmap <C-t> <esc>:enew<CR>
nmap <C-x> :bd<cr>

" Emacs-like beginning and end of line.
imap <C-e> <C-o>$
imap <C-a> <C-o>^

" up/down on displayed lines, not real lines. More useful than painful.
nnoremap k gk
nnoremap j gj

" toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" quick fix
nnoremap <leader>co :copen<cr>
nnoremap <leader>cc :cclose<cr>

" saving
nmap <C-s> :w<CR>
vmap <C-s> <Esc><C-s>gv
imap <C-s> <Esc><C-s>

" remap pum selection
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" splits and such
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>

" insert movement
inoremap <C-l> <Right>
inoremap <C-h> <Left>

" text wrapping toggle
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find conflicts
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" swap buffers
nmap <leader>. <C-^>

" Keybindings to native vim features
map <M-[> :tprev<CR>
map <M-]> :tnext<CR>

vnoremap . :normal .<CR>
vnoremap @ :normal! @
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

inoremap ;<cr> <end>;<cr>
" inoremap ,<cr> <end>,<cr>

" re-select pasted text
noremap gV `[v`]

" TIL/todos/etc.
command! Til tabe~/Dropbox/Config/til.md
command! Todo tabe~/Dropbox/Config/todo.md

" vim-test
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>tl :TestLast<CR>

" vim-rspec
" nmap <silent> <Leader>t :w<cr>:call RunNearestSpec()<cr>
" nmap <silent> <Leader>T :w<cr>:call RunCurrentSpecFile()<cr>

" vim-jdaddy
command! JSONPrettyPrint :normal gqaj

" vim-trailing-whitespace
nnoremap <leader>fw :FixWhitespace<cr>

" vim-commentary
map <C-_> gcc<Esc>
imap <C-_> <Esc>gccgi

" vim-unimpaired
imap <C-Up> <Esc>[egi
imap <C-Down> <Esc>]egi
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" line bubbling - without vim-unimpaired
" nnoremap <c-k> :m-2<cr>==
" nnoremap <c-j> :m+<cr>==
" inoremap <c-j> <esc>:m+<cr>==gi
" inoremap <c-k> <esc>:m-2<cr>==gi
" vnoremap <c-j> :m'>+<cr>gv=gv
" vnoremap <c-k> :m-2<cr>gv=gv

" autoformat
map <silent> <leader>r :Autoformat<cr>
" nerdtree
nnoremap <leader>g :NERDTreeToggle<cr>

" yankring
nnoremap <leader>y :YRShow<cr>

" tagbar
nnoremap <leader>b :TagbarToggle<cr>

" airline
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" tabularize
noremap <leader>a= :Tabularize /=<CR>
noremap <leader>a: :Tabularize /^[^:]*:\zs/l0l1<CR>
noremap <leader>a> :Tabularize /=><CR>
noremap <leader>a, :Tabularize /,\zs/l0l1<CR>
noremap <leader>a{ :Tabularize /{<CR>
noremap <leader>a\| :Tabularize /\|<CR>


" }}}1 /Mappings

" Augroups {{{
augroup VimrcGroup
  autocmd!
  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g`\"" | endif

  autocmd BufNewFile,BufRead *.less set filetype=less
  autocmd BufNewFile,BufRead .jsbeautifyrc,.eslintrc,.jshintrc set filetype=json
  autocmd BufNewFile,BufRead *.rss,*.atom set filetype=xml
  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake,*.thor} set filetype=ruby
  autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set filetype=markdown
  autocmd BufRead,BufNewFile *.{zsh,sh,bash} set filetype=sh

  " fix {} completion like endwise
  " autocmd FileType {javascript,sh,zsh,bash} inoremap {<cr> {<cr>}<Esc><S-o>

  " auto-reload vimrc
  autocmd BufWritePost {.vimrc,vimrc} source %

  " change background on insert mode
  " autocmd InsertEnter * hi Normal ctermbg=232 guibg=#000000
  " autocmd InsertLeave * hi Normal ctermbg=234 guibg=#111111

  " omnicomplete stuffs
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#CompleteTags
augroup END

augroup MarkdownGroup
  autocmd!
  autocmd FileType markdown set nofoldenable
  autocmd FileType markdown nmap <Leader>i <Plug>(simple-todo-new)
  autocmd FileType markdown imap <Leader>i <Plug>(simple-todo-new)
  autocmd FileType markdown imap <Leader>I <Plug>(simple-todo-new-start-of-line)
  autocmd FileType markdown nmap <Leader>I <Plug>(simple-todo-new-start-of-line)
  autocmd FileType markdown vmap <Leader>I <Plug>(simple-todo-new-start-of-line)
  autocmd FileType markdown nmap <Leader>o <Plug>(simple-todo-below)
  autocmd FileType markdown imap <Leader>o <Plug>(simple-todo-below)
  autocmd FileType markdown nmap <Leader>O <Plug>(simple-todo-above)
  autocmd FileType markdown imap <Leader>O <Plug>(simple-todo-above)
  autocmd FileType markdown nmap <Leader>x <Plug>(simple-todo-mark-as-done)
  autocmd FileType markdown vmap <Leader>x <Plug>(simple-todo-mark-as-done)
  autocmd FileType markdown imap <Leader>x <Plug>(simple-todo-mark-as-done)
  autocmd FileType markdown nmap <Leader>X <Plug>(simple-todo-mark-as-undone)
  autocmd FileType markdown vmap <Leader>X <Plug>(simple-todo-mark-as-undone)
  autocmd FileType markdown imap <Leader>X <Plug>(simple-todo-mark-as-undone)
augroup END

augroup RubyGroup
  autocmd!
  autocmd FileType ruby,eruby nmap <Leader>tr :call RunCurrentSpecFile()<CR>
  autocmd FileType ruby,eruby nmap <Leader>ts :call RunNearestSpec()<CR>
  autocmd FileType ruby,eruby nmap <Leader>tl :call RunLastSpec()<CR>
  autocmd FileType ruby,eruby nmap <Leader>ta :call RunAllSpecs()<CR>

  autocmd FileType ruby,eruby nmap m ]mzz
  autocmd FileType ruby,eruby nmap M [mzz

  " make ? part of word
  autocmd FileType ruby,eruby setlocal iskeyword+=?
augroup END

augroup GolangGroup
  autocmd!
  autocmd FileType go nmap <Leader>gr :GoRun<cr>
  autocmd FileType go nmap <Leader>gb :GoBuild<cr>
  autocmd FileType go nmap <Leader>gt :GoTest<cr>
  autocmd FileType go nmap <Leader>gd <Plug>(go-doc-vertical)
  autocmd FileType go nmap <Leader>gf <Plug>(go-def-vertical)
augroup END

augroup AirlineGroup
  autocmd!
  function! MyAirline()
    let spc = g:airline_symbols.space
    let g:airline_section_b = airline#section#create(['%<', 'file', spc, 'readonly'])
    let g:airline_section_c = ''
    let g:airline_section_y = airline#section#create(['windowswap', 'linenr', ':%3v'])
    let g:airline_section_z = airline#section#create(['hunks', 'branch'])
  endfunction
  autocmd Vimenter * call MyAirline()
augroup END
" }}} /augroups

" External {{{

" fzf
if executable('fzf')
  set rtp+=~/.fzf

  function! s:buflist()
    redir => ls
    silent ls
    redir END
    return split(ls, '\n')
  endfunction

  function! s:bufopen(e)
    execute 'buffer' matchstr(a:e, '^[ 0-9]*')
  endfunction

  nnoremap <silent> <Leader>l :call fzf#run({
        \   'source':  reverse(<sid>buflist()),
        \   'sink':    function('<sid>bufopen'),
        \   'options': '+m',
        \   'down':    len(<sid>buflist()) + 2
        \ })<CR>

  command! FZFMru call fzf#run({
        \ 'source':  reverse(s:all_files()),
        \ 'sink':    'edit',
        \ 'options': '-m -x +s',
        \ 'down':    '40%' })

  function! s:all_files()
    return extend(
          \ filter(copy(v:oldfiles),
          \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
          \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
  endfunction

  function! s:tags_sink(line)
    let parts = split(a:line, '\t\zs')
    let excmd = matchstr(parts[2:], '^.*\ze;"\t')
    execute 'silent e' parts[1][:-2]
    let [magic, &magic] = [&magic, 0]
    execute excmd
    let &magic = magic
  endfunction

  function! s:tags()
    if empty(tagfiles())
      echohl WarningMsg
      echom 'Preparing tags'
      echohl None
      " call system('~/bin/my-ctags -R')
      TagsGenerate
    endif

    call fzf#run({
          \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
          \            '| grep -v ^!',
          \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
          \ 'down':    '40%',
          \ 'sink':    function('s:tags_sink')})
  endfunction

  command! Tags call s:tags()

  nnoremap <silent> <leader>o :FZF -m<cr>

  " nmap <leader>t :Tags<cr>

  " nnoremap <silent> <Leader>s :call fzf#run({
  "       \   'down': '40%',
  "       \   'sink': 'botright split' })<CR>

  " " Open files in vertical horizontal split
  " nnoremap <silent> <Leader>v :call fzf#run({
  "       \   'right': winwidth('.') / 2,
  "       \   'sink':  'vertical botright split' })<CR>

endif

" ag
if executable('ag')
  set grepprg=ag\ -f\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif

function! <SID>GetSelection() range
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', reg_save, regtype_save)
  return selection
endfunction

" jit
if executable('jit')
  function! Jit(command, ...)
    if a:0 == 0
      let l:args = <SID>GetSelection()
    else
      let l:args = join(a:000, ' ')
    endif

    execute ':!jit '.a:command.' '.l:args
  endfunction

  command! -nargs=* Jit call Jit(<f-args>)
endif

" }}} /external

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


" vim: fdm=marker

let g:mapleader="\<Space>"
let g:maplocalleader=','
inoremap jk <Esc>l

filetype plugin indent on
syntax on

" Plugins {{{
call plug#begin('~/.vim/plugged')

" dependencies

Plug 'tmhedberg/matchit'
Plug 'kana/vim-textobj-user' " dep for: textobj-rubyblock(R)
Plug 'tpope/vim-dispatch'    " dep for: vim-test(O)
Plug 'mattn/webapi-vim'      " dep for: gist(R)
Plug 'Shougo/vimproc.vim'    " dep for: vim-go(O)

" misc plugins

Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'benmills/vimux'
Plug 'jszakmeister/vim-togglecursor'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'henrik/vim-qargs' " Qargs + Qdo
Plug 'michaeljsmith/vim-indent-object'
Plug 'robhurring/changecase.vim'

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = {
      \'types': {
      \  1: ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
      \},
      \'fallback': 'ag %s --files-with-matches --hidden --ignore .git -g ""'
      \}
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git)$'
      \ }

Plug 'haya14busa/incsearch.vim'
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#magic = '\v'

Plug 'robhurring/todo.vim'
let g:todo_file = expand('~/Dropbox/config/todo.md')

Plug 'mhinz/vim-grepper'
let g:grepper = {
      \'open': 1,
      \'jump': 0,
      \'tools': ['ag', 'git', 'grep', 'findstr']
      \}

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger       = '<Tab>'
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips', $HOME.'/.vim/snippets']

Plug 'bling/vim-airline'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_symbols.linenr = ''
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_detect_paste = 1
let g:airline_theme = 'bubblegum'
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let airline#extensions#whitespace#symbol = ''
let airline#extensions#whitespace#trailing_format = '… %s'

Plug 'bronson/vim-trailing-whitespace'
let g:extra_whitespace_ignored_filetypes = []

Plug 'mattn/gist-vim', {'on': 'Gist'}
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1

Plug 'mhinz/vim-signify'
let g:signify_vcs_list = ['git']

Plug 'scrooloose/nerdtree'
let g:NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '^\.git$']
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1

Plug 'benekastah/neomake'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_warning_sign = {'texthl': 'LintWarning'}
let g:neomake_error_sign = {'text': "\u25CF", 'texthl': 'LintError'}

Plug 'ludovicchabant/vim-gutentags'
if executable('ripper-tags')
  let g:gutentags_ctags_executable_ruby = 'ripper-tags'
endif
let g:gutentags_cache_dir = '~/.cache/tags'

Plug 'vim-scripts/YankRing.vim'
let g:yankring_history_dir = '$HOME/.vim/tmp'
" let g:yankring_manual_clipboard_check = 0

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMapSpace = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsShortcutFastWrap = '<M-e>'
let g:AutoPairsShortcutJump = '<M-n>'

" markdown/etc

Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'shime/vim-livedown', {'for': 'markdown'}

" html/css/js

Plug 'tpope/vim-jdaddy', {'for': ['json', 'javascript']}
Plug 'tpope/vim-ragtag'
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim', {'do': 'npm install -g tern'}
let g:tern_show_signature_in_pum = 1

Plug 'elzr/vim-json', {'for': 'json'}
let g:vim_json_syntax_conceal = 0

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-e>'

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" go

Plug 'rhysd/vim-go-impl', {'for': 'go'}
Plug 'fatih/vim-go', {'for': 'go'}
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1
let g:go_dispatch_enabled = 1
let g:go_fmt_command = 'goimports'

" elixir

Plug 'elixir-lang/vim-elixir'

" ruby

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-rails'
Plug 'janko-m/vim-test'
" let test#strategy = 'dispatch'
" let test#ruby#rspec#executable = 'auto-bundle-exec rspec'
let g:test#strategy = 'vimux'
let g:test#ruby#rspec#executable = 'auto-bundle-exec rspec --require=~/.vim/config/rspec_vim_formatter.rb --format VimFormatter --out /tmp/last-spec-failures.out --format progress'

" ABRT error: https://github.com/Valloric/YouCompleteMe/issues/8
" Solutions: add this to your ~/.<shell>rc
"   export DYLD_FORCE_FLAT_NAMESPACE=1
" Other: re-compile VIM with the homebrew version of python
" Other: `brew unlink python` and run YCM installer
Plug 'Valloric/YouCompleteMe', {'do': './install.py --gocode-completer' }
let g:ycm_key_list_select_completion   = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']
let g:ycm_completion_confirm_key       = '<CR>'
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1

" local bundles

if filereadable(expand('~/.vim-plugins.local'))
  source expand('~/.vim-plugins.local')
endif
call plug#end()
" }}} /plugins

" Options {{{
" http://vimdoc.sourceforge.net/htmldoc/quickref.html

set autoindent
set autoread
set backupdir=~/.vim/tmp
set clipboard=unnamed
set colorcolumn=81
set completeopt-=preview
set cursorline
set diffopt=filler,iwhite,vertical               " In diff mode, ignore whitespace changes and align unchanged lines
set expandtab
set foldenable
set foldlevel=99
set guifont=Hack:h15
set guioptions-=r
set hidden                                       " Don't abandon buffers moved to the background
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list                                         " Display unprintable characters
set listchars=tab:▸\ ,extends:»,precedes:«
set noerrorbells                                 " Disable error bells
set nowrap
set number
set scrolloff=3                                  " Start scrolling 3 lines before the horizontal window border
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
set tags+=./tags,./git/tags
set undofile
set updatetime=1000
set wildignore+=*/tmp/*,*/log/*,*.zip,*.so,*.swp,*/undo/*,*/swap/*
set wildmenu                                     " Enhanced completion hints in command line
set mouse=a

" use zsh on where available
if executable('zsh')
  set shell=zsh
endif
set shellcmdflag=-lc

if executable('ag')
  set grepprg=ag\ -f\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif

if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  set viminfo='100,/100,h,\"500,:100
else
  set viminfo='100,/100,h,\"500,:100,n~/.vim/viminfo
endif

" netrw tree view
let g:netrw_liststyle = 3

" }}}

" Theme"{{{
try
  colorscheme wombat
catch
  echom 'Missing color scheme!'
endtry

" Theme overrides
" http://www.colorpicker.com

" neomake highlightings
highlight LintError   cterm=none ctermbg=233 ctermfg=205 guifg=#e5786d guibg=#111111
highlight LintWarning cterm=none ctermbg=233 ctermfg=97  guifg=#9933ff guibg=#111111

" signify plugin highlightings
highlight ExtraWhitespace   cterm=none ctermbg=160 guibg=#aa00ff
highlight SignifySignAdd    cterm=bold ctermbg=233 ctermfg=118 guifg=#95e454 guibg=#111111
highlight SignifySignDelete cterm=bold ctermbg=233 ctermfg=167 guifg=#e5786d guibg=#111111
highlight SignifySignChange cterm=bold ctermbg=233 ctermfg=227 guifg=#d4d987 guibg=#111111
"}}}

" Mappings {{{

" Search settings
nnoremap <silent> <leader>/ :noh<CR>

" swap buffers
nnoremap <leader><leader> <C-^>

" fatfingers
command! Q q " Bind :Q to :q

" buffers / windows
nnoremap <C-t> <esc>:enew<CR>
nnoremap <silent> <C-x> :bd<CR>

nnoremap <Plug>BufferNext :bn\|:call repeat#set("\<Plug>BufferNext")<CR>
nnoremap <Plug>BufferPrev :bp\|:call repeat#set("\<Plug>BufferPrev")<CR>
nmap gn <Plug>BufferNext
nmap gN <Plug>BufferPrev

" up/down on displayed lines, not real lines. More useful than painful.
nnoremap k gk
nnoremap j gj

" toggle folds
nnoremap <silent> \ @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap \ zf

" ctrlp.vim <C-Space>
nnoremap <Plug>QuickOpen :NERDTreeClose\|:CtrlP<.><cr>
nmap <NUL> <Plug>QuickOpen
nmap <C-Space> <Plug>QuickOpen

" jit
nmap <localleader>J <Plug>(jit-prompt)
nmap <localleader>jo <Plug>(jit-open-prompt)
nmap <localleader>jO <Plug>(jit-open-word)

" changecase
nmap grm <Plug>(op-changecase-mixedcase)
nmap grc <Plug>(op-changecase-camelcase)
nmap grs <Plug>(op-changecase-snakecase)
nmap grd <Plug>(op-changecase-dashcase)

" toggle quickfix/location
nmap <leader>l <Plug>(toggle-location-list)
nmap <leader>c <Plug>(toggle-quickfix-list)

" load vim-test failures into quickfix
nnoremap <silent> <leader>sc :lg /tmp/last-spec-failures.out\|lopen<CR>

" saving (keep imap to avoid vim-surround from binding it)
inoremap <C-s> <Esc>:update<CR>
nnoremap <C-s> <Esc>:update<CR>

" splits and such
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" fix nvim's <C-h>
if has('nvim')
  nmap <BS> <C-h>
endif

" insert movement
inoremap <C-l> <Right>
inoremap <C-h> <Left>

" text wrapping toggle
nnoremap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" marks
nnoremap gm m

" repeatng
vmap . :normal .<CR>
vmap @ :normal! @

" searching
command! -nargs=* -complete=file GG Grepper! -tool git -query <args>
command! -nargs=* -complete=file Ag Grepper! -tool ag -query <args>

" grep operators
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

" incsearch.vim
map g/ <Plug>(incsearch-forward)
map g? <Plug>(incsearch-backward)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" re-select pasted text
noremap gV `[v`]

" vim-test
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>T :TestNearest<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>ta :TestSuite<CR>
nnoremap <silent> <F7> :TestLast<CR>
nnoremap <silent> <F8> :TestFile<CR>
nnoremap <silent> <F9> :TestSuite<CR>

" splitjoin
nnoremap gS :SplitjoinSplit<cr>
nnoremap gJ :SplitjoinJoin<cr>

" vim-commentary
map <C-_> gcc<Esc>

" vim-unimpaired
imap <C-Up> <Esc>[egi
imap <C-Down> <Esc>]egi
nmap <C-Up> [e
nmap <C-down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" autoformat / fix-whitespace
nmap <silent> <leader>= :Autoformat ff=unix<cr>
nmap <silent> <F1> :FixWhitespace<cr><leader>=<cr>

" nerdtree
nnoremap <leader>e :NERDTreeToggle<cr>

" yankring
nnoremap <leader>y :YRShow<cr>

" tagbar
nnoremap <leader>b :TagbarToggle<cr>

" airline
nmap <silent> 1 <Plug>AirlineSelectTab1
nmap <silent> 2 <Plug>AirlineSelectTab2
nmap <silent> 3 <Plug>AirlineSelectTab3
nmap <silent> 4 <Plug>AirlineSelectTab4
nmap <silent> 5 <Plug>AirlineSelectTab5

" tabularize
noremap <leader>a= :Tabularize /=<CR>
noremap <leader>a: :Tabularize /^[^:]*:\zs/l0l1<CR>
noremap <leader>a> :Tabularize /=><CR>
noremap <leader>a, :Tabularize /,\zs/l0l1<CR>
noremap <leader>a\| :Tabularize /\|<CR>

" }}}1 /Mappings

" Augroups {{{

augroup VimrcGroup
  autocmd!
  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g`\"" | endif

  autocmd BufNewFile,BufRead .{jsbeautifyrc,eslintrc,jshintrc} set filetype=json
  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake,*.thor} set filetype=ruby

  " enable spelling for md, gitcommit
  autocmd FileType {gitcommit,markdown} setlocal spell complete+=kspell

  " auto-reload vimrc
  autocmd BufWritePost {.vimrc,vimrc} nested source %

  " skeletons
  autocmd BufNewFile *.{bash,zsh} 0read ~/.vim/skeletons/skeleton.zsh

  " linters
  autocmd BufWritePost * Neomake

  " because i can't remember gqaj
  autocmd FileType {json,javascript} command! JSONPrettyPrint :normal gqaj

  " airline
  function! s:MyAirline()
    let l:spc = g:airline_symbols.space
    let g:airline_section_b = airline#section#create(['%<', 'file', l:spc, 'readonly'])
    let g:airline_section_c = ''
    let g:airline_section_y = airline#section#create(['windowswap', 'linenr', ':%-2v'])
    let g:airline_section_z = airline#section#create(['hunks', 'branch'])
  endfunction
  autocmd Vimenter * call <SID>MyAirline()
augroup END

augroup MarkdownGroup
  autocmd!
  autocmd FileType markdown setlocal nofoldenable
  autocmd FileType markdown imap <buffer> <localleader>i <Plug>(todo-new)
  autocmd FileType markdown nmap <buffer> <localleader>i <Plug>(todo-new)
  autocmd FileType markdown imap <buffer> <localleader>I <Plug>(todo-new-below)
  autocmd FileType markdown nmap <buffer> <localleader>I <Plug>(todo-new-below)
  autocmd FileType markdown nmap <buffer> <localleader>x <Plug>(todo-mark-as-done)
  autocmd FileType markdown vmap <buffer> <localleader>x <Plug>(todo-mark-as-done)
  autocmd FileType markdown nmap <buffer> <localleader>X <Plug>(todo-mark-as-undone)
  autocmd FileType markdown vmap <buffer> <localleader>X <Plug>(todo-mark-as-undone)
augroup END

augroup RubyGroup
  autocmd!
  autocmd FileType ruby,eruby nmap <buffer> m ]mzz
  autocmd FileType ruby,eruby nmap <buffer> M [mzz

  " include ruby stuff as words
  autocmd FileType ruby,eruby setlocal iskeyword+=?,!

  " align examples as you type in cucumber
  autocmd FileType cucumber inoremap <buffer> <silent> <Bar> <Bar><Esc>:call <SID>AlignPipes()<CR>a

  function! s:AlignPipes()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
      let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
      let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
      Tabularize/|/l1
      normal! 0
      call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
  endfunction
augroup END

augroup GolangGroup
  autocmd!
  autocmd FileType go nmap <buffer> <localleader>gr :GoRun<cr>
  autocmd FileType go nmap <buffer> <localleader>gb :GoBuild<cr>
  autocmd FileType go nmap <buffer> <localleader>gt :GoTest<cr>
  autocmd FileType go nmap <buffer> <localleader>gd <Plug>(go-doc-vertical)
  autocmd FileType go nmap <buffer> <localleader>gf <Plug>(go-def-vertical)
augroup END

" }}} /augroups

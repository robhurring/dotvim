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
Plug 'tpope/vim-dispatch'    " dep for: vim-test(O)
Plug 'mattn/webapi-vim'      " dep for: gist(R)
Plug 'Shougo/vimproc.vim'    " dep for: vim-go(O)

" misc plugins
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'benmills/vimux'
Plug 'jszakmeister/vim-togglecursor'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'henrik/vim-qargs' " Qargs + Qdo
Plug 'michaeljsmith/vim-indent-object'

" let g:my_statusline = 'lightline'
Plug 'itchyny/lightline.vim'
let g:my_statusline = 'lightline'

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_multiple_files = 'ijr'
let g:ctrlp_user_command = ['ag %s --files-with-matches --hidden -g ""']
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git)|node_modules|bower_components|plugged$'
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

Plug 'bronson/vim-trailing-whitespace'
let g:extra_whitespace_ignored_filetypes = []

Plug 'mattn/gist-vim', {'on': 'Gist'}
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1

Plug 'scrooloose/nerdtree'
let g:NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '^\.git$']
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1

Plug 'benekastah/neomake'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop', 'reek']
let g:neomake_warning_sign = {'text': "\u25CF", 'texthl': 'LintWarning'}
let g:neomake_error_sign = {'text': "\u25CF", 'texthl': 'LintError'}

Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_define_advanced_commands = 1
let g:gutentags_cache_dir = '~/.cache/tags'
" NOTE: this fails from the res/ctags.options file since ripper-tags
"       doesn't allow the --options flag
if executable('ripper-tags')
  let g:gutentags_ctags_executable_ruby = 'ripper-tags'
endif

Plug 'vim-scripts/YankRing.vim'
let g:yankring_history_dir = '$HOME/.vim/tmp'

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMapSpace = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsShortcutFastWrap = '<M-e>'
let g:AutoPairsShortcutJump = '<M-n>'

" languages
let g:vim_json_syntax_conceal = 0
Plug 'sheerun/vim-polyglot'
Plug 'elzr/vim-json' " can remove if/when polyglot fixes this conceal issue

" misc polyglot config
let g:jsx_ext_required = 0
let g:vim_json_syntax_conceal = 0

" markdown/etc
let g:markdown_fenced_languages = ['javascript', 'ruby', 'sh', 'yaml', 'html', 'vim', 'json']
Plug 'shime/vim-livedown', {'for': 'markdown'}

" html/css/js
Plug 'tpope/vim-jdaddy', {'for': ['json', 'javascript']}
Plug 'tpope/vim-ragtag'
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-e>'

" go
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'rhysd/vim-go-impl', {'for': 'go'}
let g:formatdef_goimports = '"goimports"'
let g:formatters_go = ['goimports', 'gofmt_2'] " dep: vim-autoformat
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_dispatch_enabled = 1
let g:go_fmt_autosave = 0 " use vim-autoformat instead
let g:go_fmt_command = 'goimports'

" ruby vim-ruby from polyglot
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-rails'
Plug 'janko-m/vim-test'
let g:test#strategy = 'vimux'
let g:test#ruby#rspec#executable = 'auto-bundle-exec rspec --require=~/.vim/config/rspec_vim_formatter.rb --format VimFormatter --out /tmp/last-spec-failures.out --format progress'
let g:test#ruby#cucumber#executable = 'auto-bundle-exec cucumber --backtrace -r features'

Plug 'Valloric/YouCompleteMe', {'do': './install.py --gocode-completer --tern-completer' }
let g:ycm_key_list_select_completion   = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']
let g:ycm_completion_confirm_key       = '<CR>'
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_show_diagnostics_ui = 0 " hopefully speed YCM up a bit

" local bundles
if filereadable(expand('~/.vim-plugins.local'))
  source expand('~/.vim-plugins.local')
endif
call plug#end()
" }}} /plugins

" Options {{{
" http://vimdoc.sourceforge.net/htmldoc/quickref.html

set t_ut= " see: http://sunaku.github.io/vim-256color-bce.html
set autoindent
set autoread
set backupdir=~/.vim/tmp
set backspace=indent,eol,start
set clipboard=unnamed
set colorcolumn=81
set completeopt-=preview
set concealcursor=nc
set conceallevel=1
set cursorline
set diffopt=filler,iwhite,vertical                                 " In diff mode, ignore whitespace changes and align unchanged lines
set directory=~/.vim/swap
set expandtab
set foldenable
set foldlevel=99
set guifont=Hack:h15
set guioptions-=r
set hidden                                                         " Don't abandon buffers moved to the background
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set list                                                           " Display unprintable characters
set listchars=tab:-\ ,nbsp:∙,extends:»,precedes:«
set mouse=a
set nowrap
set number
set scrolloff=3                                                    " Start scrolling 3 lines before the horizontal window border
set sessionoptions-=help                                           " don't restore help windows
set shiftround
set shiftwidth=2
set shortmess+=A                                                   " Toggle paste mode while in insert mode with F12
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
set undodir=~/.vim/undo
set updatetime=750
set wildignore+=*/tmp/*,*/log/*,*.zip,*.so,*.swp,*/undo/*,*/swap/*
set wildmenu                                                       " Enhanced completion hints in command line

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
  execute 'set colorcolumn=' . join(range(81,200), ',')
  set background=dark
  colorscheme jellybeans
catch
  echom 'Missing color scheme!'
endtry

" syntax debugging
map <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Theme overrides
" http://www.colorpicker.com

" fix awful red colorcolumns in certain themes
" highlight ColorColumn guibg=#222222 ctermbg=235

" neomake highlightings
highlight LintError   ctermfg=205 guifg=#e5786d
highlight link LintWarning LineNr

" highlight trailing white space (via conceal)
highlight ExtraWhitespace   ctermfg=196 ctermbg=197 guibg=none guifg=#FF0080
highlight Conceal           ctermfg=196 ctermbg=197 guibg=none guifg=#FF0080
"}}}

" Mappings {{{

" make Y behave like D
nnoremap Y y$

" buffers / windows
nnoremap <silent> <C-x> :bd<CR>
nnoremap <leader><leader> :ls<CR>:b<SPACE>
nnoremap <tab><tab> :b#<CR>

" up/down on displayed lines, not real lines.
nnoremap k gk
nnoremap j gj

" toggle folds
nnoremap <silent> \ @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap \ zf

" ctrlp.vim <C-Space>
nnoremap <Plug>QuickOpen :NERDTreeClose\|:CtrlP<.><cr>
nmap <NUL> <Plug>QuickOpen
nmap <C-Space> <Plug>QuickOpen

" thyme / pomodoro
if has('nvim') && executable('thyme')
  nnoremap <silent> <localleader>ts :call jobstart('thyme --daemon')<CR>
  nnoremap <silent> <localleader>tx :call jobstart('thyme --stop')<CR>
endif

" toggle quickfix/location
nmap <leader>l <Plug>(toggle-only-location-list)
nmap <leader>c <Plug>(toggle-only-quickfix-list)

" cd to buffer's project root directory
nmap <silent> <localleader>cd :execute 'cd '.helpers#projectroot()<CR>

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

" text wrapping toggle
nnoremap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" repeatng
vmap . :normal .<CR>
vmap @ :normal! @

" search settings
nnoremap <silent> <leader>/ :noh<CR>

" searching
command! -nargs=* -complete=file Ag Grepper -tool ag -query <args>

" operator pending: grep operators
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

" incsearch.vim
map g/ <Plug>(incsearch-forward)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)

" re-select pasted text
noremap gV `[v`]

" paste without ruining your register
xnoremap <leader>p "_dP

" vim-test
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>T :TestNearest<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>ta :TestSuite<CR>

" load vim-test failures into quickfix
nnoremap <silent> <leader>sc :cg /tmp/last-spec-failures.out\|copen<CR>

" splitjoin
nnoremap gS :SplitjoinSplit<cr>
nnoremap gJ :SplitjoinJoin<cr>

" vim-commentary <C-/>
map <C-_> gcc<Esc>

" yankring
nmap <Leader>y :YRShow<CR>

" vim-unimpaired
imap <C-Up> <Esc>[egi
imap <C-Down> <Esc>]egi
nmap <C-Up> [e
nmap <C-down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" autoformat / fix-whitespace
nmap <silent> <leader>= :Autoformat<CR>
nmap <silent> <F1> :FixWhitespace<CR>

" nerdtree
nnoremap <leader>e :NERDTreeToggle<cr>

" tagbar
nnoremap <leader>b :TagbarToggle<cr>

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
  autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  " kick-off conceal extra whitespace
  autocmd BufRead,InsertLeave * syntax match ExtraWhitespace '\s\+$' containedin=ALL conceal cchar=∙

  " odd extensions
  autocmd BufNewFile,BufRead {*.ejs} set filetype=html
  autocmd BufNewFile,BufRead {*.js.erb} set filetype=javascript
  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake,*.thor} set filetype=ruby

  autocmd FileType ruby,eruby setlocal iskeyword+=?,!

  " whitespace language tweaks
  autocmd FileType python,go setlocal nolist tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab

  " enable spelling for md, gitcommit
  autocmd FileType {gitcommit,markdown} setlocal complete+=kspell

  " auto-reload vimrc
  autocmd BufWritePost {.vimrc,vimrc} nested source %

  " linters -- set b:skip_linters to run manually
  autocmd BufWritePost * if !exists('b:skip_linters') | Neomake | endif
augroup END

" }}} /augroups

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif


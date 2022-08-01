" vim: fdm=marker

let s:local_plugins = expand('~/.vim-plugins.local')
let s:local_rc = expand('~/.vimrc.local')

let g:mapleader="\<Space>"
let g:maplocalleader=','
inoremap jk <Esc>l

filetype plugin indent on
syntax on

" Plugins {{{
call plug#begin('~/.vim/plugged')

" dependencies
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-dispatch'    " dep for: vim-test(O), vim-go(O)
let g:dispatch_no_maps = 1

" misc plugins
Plug 'nanotech/jellybeans.vim'
let g:jellybeans_use_term_italics = 1
let g:indent_guides_auto_colors = 1
let g:jellybeans_use_lowcolor_black = 1

Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax' " puml dep
Plug 'tyru/open-browser.vim' " plantuml dep

Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

Plug 'vim-scripts/ReplaceWithRegister'
Plug 'Chiel92/vim-autoformat'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'benmills/vimux'                   " dep for: vim-test
Plug 'AndrewRadev/splitjoin.vim'
Plug 'itchyny/lightline.vim'

" registers
Plug 'junegunn/vim-peekaboo'
let g:peekaboo_delay = 0
let g:peekaboo_compact = 1
let g:peekaboo_window = "bel bo 10new"

" fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'scrooloose/nerdtree'
let g:NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '^\.git$']
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMapSpace = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsShortcutFastWrap = '<M-e>'
let g:AutoPairsShortcutJump = '<M-n>'

" languages
" Plug 'doums/darcula'
" Plug 'sheerun/vim-polyglot'
" let g:vim_markdown_conceal = 0
" let g:vim_markdown_conceal_code_blocks = 0
" let g:vim_markdown_auto_insert_bullets = 0
" let g:vim_markdown_new_list_item_indent = 0
" let g:jsx_ext_required = 0

" terraform
" Plug 'hashivim/vim-terraform'

" markdown/etc
let g:vim_markdown_fenced_languages = ['javascript', 'ruby', 'sh', 'yaml', 'html', 'vim', 'json']
Plug 'davinche/godown-vim', {'for': 'markdown'}

" html/css/js
Plug 'tpope/vim-jdaddy', {'for': ['json', 'javascript']}
Plug 'tpope/vim-ragtag'
Plug 'mattn/emmet-vim'

" ruby vim-ruby from polyglot
Plug 'tpope/vim-bundler'  " used for appending gem tags to `tagfiles()`
Plug 'tpope/vim-cucumber'
Plug 'janko-m/vim-test'
let g:test#filename_modifier = ':p'
let g:test#strategy = 'vimux'
let g:test#ruby#rspec#executable = 'auto-bundle-exec rspec --require=~/.vim/config/rspec_vim_formatter.rb --format VimFormatter --out ~/.vim/tmp/quickfix.out --format progress'
let g:test#ruby#cucumber#executable = 'auto-bundle-exec cucumber --backtrace -r features'

Plug 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips', $HOME.'/.vim/snippets']
let g:UltiSnipsExpandTrigger      = '<Tab>'
let g:UltiSnipsListSnippets       = '<C-l>'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'chrisbra/Colorizer'

" colorschemes
Plug 'doums/darcula'

" wiki
Plug 'vimwiki/vimwiki'
let g:vimwiki_url_maxsave=0
let g:vimwiki_conceallevel=0
let g:vimwiki_conceal_onechar_markers=0
let g:vimwiki_list = [{'path': '~/.config/vimwiki/',
      \ 'syntax': 'markdown', 'ext': '.md'}]

" local bundles
if filereadable(s:local_plugins)
  exec 'source ' . s:local_plugins
endif
call plug#end()
" }}} /plugins

" Lua {{{

lua << EOF
-- IDE-like: lsp, cmp
require'ide'
require 'highlighting'
EOF

" }}}

" Options {{{
" NOTE: some are unnecessary in neovim, but needed for vim compatibility
" http://vimdoc.sourceforge.net/htmldoc/quickref.html

set t_ut= " see: http://sunaku.github.io/vim-256color-bce.html

set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=~/.vim/tmp
set breakat=\ ^I*-+;,/?\(\[\{ " fix syntax
set breakindent
set breakindentopt=shift:2
set clipboard=unnamed
set colorcolumn=101
set completeopt-=preview
set concealcursor=nc
set conceallevel=2
set cursorline
set diffopt=filler,iwhite,vertical
set directory=~/.local/share/nvim/swap
set expandtab
set foldlevel=1
set foldmethod=syntax
set foldnestmax=10
set formatoptions+=j
"set guifont=Hasklig-Regular:h15
set guioptions-=r
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set list
set listchars=tab:-\ ,nbsp:∙,extends:»,precedes:«
set mouse=a
set nofoldenable
set nowrap
set number
set scrolloff=3
set sessionoptions-=help
set shiftround
set shiftwidth=2
set shortmess+=A
set showbreak=↪\
set showmatch
set sidescroll=1
set sidescrolloff=3
set smartcase
set smartindent
set smarttab
set splitbelow
set splitright
set ttimeout
set ttimeoutlen=100
set tabstop=2
set tags+=./tags,./git/tags
set undodir=~/.local/share/nvim/undo
set undofile
" set updatetime=750
set updatetime=4000
set virtualedit=block
set wildignore+=*.pyc,*.class,*.cache,*.min.*
set wildignore+=*.tar.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=*/min/*,*/vendor/*,*/node_modules/*,*/bower_components/*
set wildignore+=*/tmp/*,*/log/*,*.zip,*.so,*.swp,*.bak,*/undo/*,*/swap/*
set wildignore+=tags,cscope.*
set wildmenu

" neovim specific options
if has('nvim')
  set shada='100,/100,h,\"500,:100
  set inccommand=split
else
  set viminfo='100,/100,h,\"500,:100,n~/.vim/viminfo
end

" SEE: https://gist.github.com/XVilka/8346728
" NOTE: not working with vim/tmux currently
if has('termguicolors')
  set termguicolors
end

if has('gui_running')
  " set ballooneval
  " set macligatures
endif

" use zsh on where available
" NOTE: causes considerable lag
" if executable('zsh')
"   set shell=zsh
" endif
" set shellcmdflag=-lc

if executable('ag')
  set grepprg=ag\ -f\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif

" SEE: https://github.com/BurntSushi/ripgrep
if executable('rg')
  set grepprg=rg\ -L\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif

" netrw tree view
let g:netrw_liststyle = 3

" telescope
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" }}}

" Theme"{{{
try
  execute 'set colorcolumn=' . join(range(101,200), ',')
  set background=dark
  let g:jellybeans_overrides = {
        \ 'ColorColumn': { 'guibg': '191919', 'ctermbg': 'none' },
        \ 'SignColumn': { 'guibg': '151515', 'ctermbg': 'none' },
        \ 'CursorLine': { 'guibg': '1c1c1c', 'ctermbg': 'none' }
        \ }

  colorscheme darcula
catch
  echom 'Missing color scheme!'
endtry

" syntax debugging
" map <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"       \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
"       \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Theme overrides
" http://www.colorpicker.com

" highlight trailing white space (via conceal)
highlight ExtraWhitespace   ctermfg=196 ctermbg=197 guibg=NONE guifg=#FF0080
highlight Conceal           ctermfg=196 ctermbg=197 guibg=NONE guifg=#FF0080

" NERDTree highlighting
highlight Directory ctermfg=142 ctermbg=190 guibg=NONE guifg=#BBB529

" floating windows
" highlight NormalFloat ctermbg=190 guibg=#222222 guifg=#d6d6d6
highlight link VistaFloat NormalFloat

" LSP
highlight LspDiagnosticsUnderlineError ctermfg=196 ctermbg=197 guibg=NONE guifg=#FF0080
highlight LspDiagnosticsUnderlineHint ctermfg=196 ctermbg=197 guibg=NONE guifg=#FF0080
highlight LspDiagnosticsUnderlineInfo ctermfg=196 ctermbg=197 guibg=NONE guifg=#FF0080
highlight LspDiagnosticsUnderlineWarning ctermfg=196 ctermbg=197 guibg=NONE guifg=#FF0080

highlight LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
highlight LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
highlight LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow

highlight DiagnosticSignError ctermfg=196 ctermbg=197 guibg=NONE guifg=#FF0080
highlight DiagnosticSignWarn ctermfg=196 ctermbg=197 guibg=NONE guifg=#FF0080
highlight DiagnosticSignInfo ctermfg=196 ctermbg=197 guibg=NONE guifg=#FF0080
highlight DiagnosticSignHint ctermfg=196 ctermbg=197 guibg=NONE guifg=#FF0080
highlight DiagnosticLineNrError guibg=#FF0000 guifg=#FF0000 gui=bold
highlight DiagnosticLineNrWarn guibg=#FF0000 guifg=#FF0000 gui=bold
highlight DiagnosticLineNrInfo guibg=NONE guifg=#0000FF gui=bold
highlight DiagnosticLineNrHint guibg=#FF0000 guifg=#0000FF gui=bold

highlight LspCodeLens ctermfg=196 ctermbg=197 guibg=NONE guifg=#FF0000
highlight LspReferenceText ctermfg=196 ctermbg=197 guibg=NONE guifg=#FF0000
highlight LspReferenceRead ctermfg=196 ctermbg=197 guibg=NONE guifg=#FF0000
highlight LspReferenceWrite ctermfg=196 ctermbg=197 guibg=NONE guifg=#FF0000
highlight DocumentHighlight ctermfg=196 ctermbg=197 guibg=NONE guifg=#FF0000

" sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
" sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
" sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
" sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
"}}}

" Mappings {{{

" make Y behave like D
nnoremap Y y$

" horizontal moves
nmap <Right> 10zl
nmap <Left> 10zh
nnoremap gL L
nnoremap gH H
nnoremap L zL
nnoremap H zH

" PUM navigation
inoremap <silent><expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
cmap <C-j> <C-n>
cmap <C-k> <C-p>

" yank current file + line
nnoremap <silent> <F5> :let @*=expand("%").":".line(".")\|echom "Copied"<CR>

" don't move cursor for *
nnoremap * *``

" buffers / windows
nnoremap <silent> <C-x> :bunload<CR>
nnoremap <silent> <C-q> :bdelete<CR>
nnoremap <leader><leader> :Telescope buffers<CR>
nnoremap <silent> <localleader><localleader> :b#<CR>

" up/down on displayed lines, not real lines. (except when using counts)
noremap gk k
noremap gj j
noremap <expr> k (v:count > 1 ? "m'" . v:count . 'k': 'gk')
noremap <expr> j (v:count > 1 ? "m'" . v:count . 'j': 'gj')

" toggle folds
nnoremap <silent> \ @=(foldlevel('.')?'za':"\\")<CR>
vnoremap \ zf

" finder mappings
" nnoremap <expr> <Plug>ProjectFiles (len(system('git rev-parse')) ? ':NERDTreeClose\|:Files' : ':NERDTreeClose\|:GFiles --exclude-standard --others --cached')."\<cr>"
nnoremap <expr> <Plug>ProjectFiles (len(system('git rev-parse')) ? ':NERDTreeClose\|:Telescope find_files' : ':NERDTreeClose\|:Telescope git_files')."\<cr>"
nmap <C-Space> <Plug>ProjectFiles
nmap <C-@> <C-Space>
nmap <C-t> <C-Space>

" toggle quickfix/location
" SEE: plugins/toggle-quickfix.vim
nmap <silent> <leader>l <Plug>(toggle-only-location-list)
nmap <silent> <leader>c <Plug>(toggle-only-quickfix-list)
nmap <silent><nowait> <leader>q <Plug>(toggle-only-quickfix-list)

" cd to buffer's project root directory
" SEE: autoload/helpers.vim
nmap <silent> <localleader>cd :execute 'cd '.helpers#projectroot()<CR>

" saving (keep imap to avoid vim-surround from binding it)
inoremap <C-s> <Esc>:update<CR>
nnoremap <C-s> <Esc>:update<CR>
cmap w!! w !sudo tee > /dev/null %

" splits and such
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" repeatng
vnoremap . :normal .<CR>
vnoremap @ :normal! @

" search/replace settings
nnoremap <silent> <leader>/ :noh<CR>

nnoremap <localleader>/ :%s/\<<c-r><c-w>\>//Ic<left><left><left>
vnoremap <localleader>/ "zy:%s/<C-r>z//gc<left><left><left>
vnoremap // "zy/<C-r>=escape(@z,'/\.*$^~[]()')<CR><CR>N
nnoremap // /<C-r>/

" search/replace similar to sublime (use `.` to quickly repeat, `n` to skip)
" Credit: http://www.kevinli.co/posts/2017-01-19-multiple-cursors-in-500-bytes-of-vimscript
let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"

nnoremap cn *``cgn
nnoremap cN *``cgN
vnoremap <expr> cn g:mc . "``cgn"
vnoremap <expr> cN g:mc . "``cgN"

" search/replace macros
function! SetupCR()
  nnoremap <Enter> :nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z
endfunction

nnoremap cq :call SetupCR()<CR>*``qz
nnoremap cQ :call SetupCR()<CR>#``qz
vnoremap <expr> cq ":\<C-u>call SetupCR()\<CR>" . "gv" . g:mc . "``qz"
vnoremap <expr> cQ ":\<C-u>call SetupCR()\<CR>" . "gv" . substitute(g:mc, '/', '?', 'g') . "``qz"

" searching
command! -nargs=* -complete=file Ag Grepper -tool ag -query <args>
" command! Todo Grepper -noprompt -tool git -grepprg git grep -nIi '\(TODO\|FIXME|HACK\):'
command! Todo Rg (TODO|FIXME|HACK)

if executable('rg')
  command! -nargs=* -complete=file Ag Grepper -tool rg -query <args>
endif

" operator pending: grep operators
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

" re-select pasted text
noremap gv `[v`]

" don't move cursor when joining
nnoremap J mzJ`z

" yanks
xnoremap <leader>p "0p
xnoremap <leader>P "0P
" nmap <Leader>y :Clap yanks<CR>

" vim-test
nnoremap <silent> <leader>t :TestFile<CR>
nnoremap <silent> <leader>T :TestNearest<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>ta :TestSuite<CR>

" vimux
" run command under cursor in vimux
nnoremap <localleader>vr yy:call VimuxRunCommand(@")<CR>

" load vim-test failures into quickfix
nnoremap <silent> <leader>sc :cg ~/.vim/tmp/quickfix.out\|copen<CR>

" splitjoin
nnoremap gS :SplitjoinSplit<cr>
nnoremap gJ :SplitjoinJoin<cr>

" vim-fugitive
nnoremap <localleader>ga :Git blame<CR>
nnoremap <localleader>gs :G<CR>

" vim-commentary <C-/>
map <C-_> gcc<Esc>

" vim-unimpaired / line bubbling
imap <C-Up> <Esc>[egi
imap <C-Down> <Esc>]egi
nmap <C-Up> [e
nmap <C-down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" formatting / fix-whitespace
nmap <silent> <leader>= :Autoformat<CR>
" nmap <silent> <F1> :RemoveTrailingSpaces<CR>

" nerdtree
nnoremap <leader>e :NERDTreeToggle<cr>
nnoremap <leader>E :NERDTreeFind<cr>

" tagbar
nnoremap <localleader>t :Vista!!<cr>

" }}}1 /Mappings

" Augroups {{{

augroup VimrcGroup
  autocmd!

  " pickup where you left off
  autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  " kick-off conceal extra whitespace
  autocmd BufRead,InsertLeave * syntax match ExtraWhitespace '\s\+$' containedin=ALL conceal cchar=∙
  autocmd BufReadPost * setlocal conceallevel=2 " some plugins are changing this so no visible whitespace

  " odd file extensions
  autocmd BufNewFile,BufRead {*.ejs}    set filetype=html
  autocmd BufNewFile,BufRead {*.js.erb} set filetype=javascript
  autocmd BufRead,BufNewFile {Procfile} set filetype=yaml

  " <C-X>= for #{}
  autocmd FileType yaml,eruby inoremap <buffer> <C-X>= <%=  %><Esc>hhi
  autocmd FileType ruby       inoremap <buffer> <C-X>= #{}<Esc>i
  autocmd FileType javascript inoremap <buffer> <C-X>= ${}<Esc>i
  autocmd FileType ruby,eruby setlocal iskeyword+=?,!

  " wrap markdown
  autocmd FileType markdown setlocal wrap

  " auto-reload vimrc
  autocmd BufWritePost {.vimrc,vimrc,.vimrc.local,init.vim} nested source %

  " fix awful red colorcolumns in certain themes
  " autocmd ColorScheme * highlight ColorColumn guibg=#222222 ctermbg=235

  " auto-mark some common files
  autocmd BufLeave {.vimrc,vimrc,init.vim} normal mV
  autocmd BufLeave .zshrc normal mZ
  autocmd BufLeave .zshenv normal mE
  autocmd BufLeave {.ideavimrc,ideavimrc} normal mI
  autocmd BufLeave {.gitconfig,git/config} normal mG
  autocmd BufLeave .taskrc normal mT

  autocmd BufLeave .editorconfig EditorConfigReload

  autocmd FileType terraform setlocal commentstring=#\ %s
augroup END

" }}} /augroups

if filereadable(s:local_rc)
  exec 'source ' . s:local_rc
endif


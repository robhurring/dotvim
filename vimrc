set nocompatible               " be iMproved
filetype off                   " required!

call plug#begin('~/.vim/plugged')
if filereadable(expand("~/.bundles.vim"))
  source ~/.bundles.vim
endif
call plug#end()

filetype on
let mapleader=','
let localmapleader=','

" Display options
syntax on
set cursorline
set showcmd
set number
set list                       " Display unprintable characters
set listchars=tab:▸\ ,extends:»,precedes:«
set shell=zsh\ -lc

if $TERM =~ '256color'
  set t_Co=256
elseif $TERM =~ '^xterm$'
  set t_Co=256
endif

" Misc
filetype plugin indent on       " Do filetype detection and load custom file plugins and indent files
set hidden                      " Don't abandon buffers moved to the background
set wildmenu                    " Enhanced completion hints in command line
set backspace=eol,start,indent  " Allow backspacing over indent, eol, & start
" set complete=.,w,b,u,U,t,i,d    " Do lots of scanning on tab completion
set complete-=i
set updatecount=100             " Write swap file to disk every 100 chars
set directory=~/.vim/swap       " Directory to use for the swap file
set diffopt=filler,iwhite       " In diff mode, ignore whitespace changes and align unchanged lines
set scrolloff=3                 " Start scrolling 3 lines before the horizontal window border
set noerrorbells                " Disable error bells
set shortmess+=A                " Toggle paste mode while in insert mode with F12
set eol
set guifont=Hack:h15
set undofile
set clipboard=unnamed
set undodir=~/.vim/undo
set laststatus=2
if has('mouse')
  set mouse=a
end 

" delete into blackhole register
nnoremap x "_x
nnoremap D "_D
nnoremap d "_d
vnoremap d "_d
nnoremap <leader>d "*d
nnoremap <leader>dd "*dd
nnoremap <leader>D "*D
vnoremap <leader>d "*d

" up/down on displayed lines, not real lines. More useful than painful.
nnoremap k gk
nnoremap j gj

" Indentation and tabbing
set autoindent smartindent
set smarttab
set tabstop=2
set expandtab
set shiftwidth=2
set shiftround
set ruler

" Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
nmap <leader>/ :set hlsearch! hlsearch?<CR>

" CTags
set tags+=.git/tags
set tags+=./tags

" uppper/lower word
" nmap <leader>u mQviwU`Q
" nmap <leader>l mQviwu`Q
" nmap <leader>U mQgewvU`Q
" nmap <leader>L mQgewvu`Q

" Some helpers to edit mode
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" splits and such
set splitbelow
set splitright
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>

" text wrapping toggle
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find conflicts
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

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

" Keybindings to native vim features
map <M-[> :tprev<CR>
map <M-]> :tnext<CR>
inoremap <C-c> <Esc>

vnoremap . :normal .<CR>
vnoremap @ :normal! @
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

inoremap ;<cr> <end>;<cr>
inoremap .<cr> <end>.

if has("autocmd")
  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g`\"" | endif

  autocmd BufWritePost {.vimrc,vimcr} source %

  autocmd BufNewFile,BufRead *.less set filetype=less
  autocmd BufNewFile,BufRead .jsbeautifyrc,.eslintrc,.jshintrc set filetype=json
  autocmd BufNewFile,BufRead *.rss,*.atom set filetype=xml
  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake,*.thor} set filetype=ruby
  autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set filetype=markdown

  " change background on insert mode
  autocmd InsertEnter * hi Normal ctermbg=232 guibg=#000000
  autocmd InsertLeave * hi Normal ctermbg=234 guibg=#111111
endif

" http://vimcasts.org/episodes/tidying-whitespace/
function! StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

if executable('fzf')
  set rtp+=~/.fzf

  nnoremap <silent> <leader><leader> :FZF -m<cr>
  nnoremap <silent> <Leader>s :call fzf#run({
        \   'down': '40%',
        \   'sink': 'botright split' })<CR>

  " Open files in vertical horizontal split
  nnoremap <silent> <Leader>v :call fzf#run({
        \   'right': winwidth('.') / 2,
        \   'sink':  'vertical botright split' })<CR>
end

" change cursor shapes
let &t_SI .= "\<Esc>[6 q"
let &t_EI .= "\<Esc>[2 q"

"""""""""""""""""""""
" Plugins
"""""""""""""""""""""

colorscheme jellybeans

" neocomplete
let g:acp_enableatstartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

" git-gutter
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
" nmap ]h <Plug>GitGutterNextHunk
" nmap [h <Plug>GitGutterPrevHunk
" nmap <Leader>ha <Plug>GitGutterStageHunk
" nmap <Leader>hu <Plug>GitGutterRevertHunk

" vim-jsx
let g:jsx_ext_required = 0

let g:jellybeans_use_lowcolor_black = 0

" Utilsnips
let g:UltiSnipsExpandTrigger       = "<Tab>"
let g:UltiSnipsListSnippets        = "<C-h>"

" map ruby block movement
nmap m ]m
nmap M [m

" comment
map <C-_> gcc
imap <C-_> <Esc>gccA

" bubbling lines vim-exchange
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

map <silent> <leader>r :Autoformat<cr>
let g:formatdef_rbeautify = '"ruby-beautify ".(&expandtab ? "-s -c ".&shiftwidth : "-t")'

nnoremap <leader>g :NERDTreeToggle<cr>
let nerdtreeignore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$' ]
let nerdtreehighlightcursorline=1
let nerdtreeshowbookmarks=1
let nerdtreeshowfiles=1

nnoremap <leader>y :YRShow<cr>
let g:yankring_history_dir = '$HOME/.vim/tmp'
let g:yankring_manual_clipboard_check = 0

" bubbling lines
nnoremap <leader>b :TagbarToggle<cr>

map <Leader>l :MBEToggle<cr>
let g:miniBufExplorerMoreThanOne = 10000
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplSplitBelow=1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplVSplit = 20

" syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_signs=1
" let g:syntastic_mode_map =  'mode': 'active',
      \ 'active_filetypes': [],
      \;`q`

let g:quickfixsigns_classes=['qfl', 'vcsdiff', 'breakpoints']


" Airline
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_symbols.space = "\ua0"

nnoremap <leader>. :CtrlPTag<cr>
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/log/*,*.zip,*.so,*.swp
let g:ctrlp_open_new_file = 'h'
let g:ctrlp_open_multiple_files = 'h'
"let g:ctrlp_custom_ignore = '\.o\|\.so'
"let g:ctrlp_user_command = 'find %s -type f'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

noremap <leader>a= :Tabularize /=<CR>
noremap <leader>a: :Tabularize /^[^:]*:\zs/l0l1<CR>
noremap <leader>a> :Tabularize /=><CR>
noremap <leader>a, :Tabularize /,\zs/l0l1<CR>
noremap <leader>a{ :Tabularize /{<CR>
noremap <leader>a\| :Tabularize /\|<CR>

" emmet
let g:user_emmet_leader_key='<C-e>'

" matchit
runtime macros/matchit.vim

let g:vimrubocop_config = $HOME.'/.rubocop.yml'

" gundo
nnoremap <leader>u :GundoToggle<cr>

" multi cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" js lib syntax plugin
let g:used_javascript_libs = 'underscore,angularjs,jquery,angularui,jasmine,react'

" jshint
let g:syntastic_javascript_jshint_args = '--config='.$HOME.'/.jshintrc'
"let g:syntastic_debug = 3

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


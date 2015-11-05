" vim: fdm=marker

if !has('nvim')
  set nocompatible
endif
filetype off

let g:mapleader="\<Space>"
let g:maplocalleader=','

inoremap <C-c> <Esc>
inoremap jk <Esc>l
" nnoremap ,, ,

if $TERM =~? '256color'
  set t_Co=256
elseif $TERM =~? '^xterm$'
  set t_Co=256
endif

filetype plugin indent on                  " Do filetype detection and load custom file plugins and indent files
syntax on

" Plugins {{{
call plug#begin('~/.vim/plugged')

" dependencies

Plug 'tmhedberg/matchit'
Plug 'kana/vim-textobj-user' " dep for: textobj-rubyblock(R)
Plug 'tpope/vim-dispatch'    " dep for: vim-test(O)
Plug 'mattn/webapi-vim'      " dep for: gist(R)
Plug 'Shougo/vimproc.vim'    " dep for: vim-go(O)

" color schemes

Plug 'sheerun/vim-wombat-scheme'

" misc plugins

Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'terryma/vim-expand-region'
Plug 'benmills/vimux'
Plug 'jszakmeister/vim-togglecursor'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'FZF'

Plug 'robhurring/todo.vim'
let g:todo_file = expand('~/Dropbox/config/todo.md')

Plug 'mhinz/vim-grepper'
let g:grepper = {}
let g:grepper.open = 1

Plug 'Chiel92/vim-autoformat'
let g:formatdef_rbeautify = '"ruby-beautify ".(&expandtab ? "-s -c ".&shiftwidth : "-t")'

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger       = '<Tab>'
let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips', $HOME.'/.vim/snippets']

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
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

Plug 'bronson/vim-trailing-whitespace'
let g:extra_whitespace_ignored_filetypes = []

Plug 'mattn/gist-vim', {'on': 'Gist'}
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1

Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

Plug 'mhinz/vim-signify'
let g:signify_vcs_list = ['git']

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
let g:NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeBookmarksFile = '~/.vim/bookmarks'
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize = 30
let g:NERDTreeMinimalUI = 1

Plug 'benekastah/neomake'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_enabled_makers = ['mri', 'rubocop']
let g:neomake_open_list = 0
let g:neomake_warning_sign = {
      \ 'texthl': 'LintWarning',
      \ }
let g:neomake_error_sign = {
      \ 'text': "\u25CF",
      \ 'texthl': 'LintError',
      \ }
" simple rspec runner for neomake
let g:neomake_ruby_rspec_maker = {
      \ 'exe': 'rspec',
      \ 'args': ['--require=~/.vim/config/rspec_vim_formatter.rb', '--format=VimFormatter'],
      \ 'errorformat': '%E%f:%l:\ %m'
      \ }

Plug 'szw/vim-tags'
let g:vim_tags_auto_generate = 0
let g:vim_tags_cache_dir = expand('~/.vim/tmp')
let g:vim_tags_ignore_files = ['.gitignore']
let g:vim_tags_ignore_file_comment_pattern = '^[#"]'
let g:vim_tags_directories = ['.git']
let g:vim_tags_main_file = 'tags'
let g:vim_tags_use_language_field = 1
let g:vim_tags_use_vim_dispatch = 1

Plug 'vim-scripts/YankRing.vim'
let g:yankring_history_dir = '$HOME/.vim/tmp'
let g:yankring_manual_clipboard_check = 0
let g:yankring_replace_n_pkey = ''
let g:yankring_replace_n_nkey = ''

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMapSpace = 0
let g:AutoPairsMultilineClose = 1
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsShortcutFastWrap = '<M-e>'
let g:AutoPairsShortcutJump = '<M-n>'

" markdown/etc

Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'shime/vim-livedown', {'for': 'markdown'}

" html/css/js

Plug 'tpope/vim-jdaddy', {'for': 'json'}
Plug 'tpope/vim-ragtag'

Plug 'elzr/vim-json', {'for': 'json'}
let g:vim_json_syntax_conceal = 0

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-e>'

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plug 'pangloss/vim-javascript'
let g:used_javascript_libs = 'underscore,angularjs,jquery,angularui,jasmine,react'

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

" elixir

Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}

" ruby

Plug 'AndrewRadev/splitjoin.vim'
Plug 'rhysd/vim-textobj-ruby'

Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

Plug 'janko-m/vim-test'
" let test#strategy = 'dispatch'
" let test#ruby#rspec#executable = 'auto-bundle-exec rspec'
let g:test#strategy = 'vimux'
let g:test#ruby#rspec#executable = 'auto-bundle-exec rspec --require=~/.vim/config/rspec_vim_formatter.rb --format VimFormatter --out /tmp/quickfix.out --format progress'

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
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1

" local bundles

if filereadable(expand('~/.vim-plugins.local'))
  source expand('~/.vim-plugins.local')
endif
call plug#end()
runtime macros/matchit.vim

" }}} /plugins

" Options {{{
" http://vimdoc.sourceforge.net/htmldoc/quickref.html

" set autochdir


set autoindent
set autoread
set backupdir=~/.vim/tmp
set clipboard=unnamed
set colorcolumn=81
set cursorline
set diffopt=filler,iwhite,vertical               " In diff mode, ignore whitespace changes and align unchanged lines
set expandtab
set exrc                                         " enable per-directory .vimrc files
set guifont=Hack:h15
set hidden                                       " Don't abandon buffers moved to the background
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list                                         " Display unprintable characters
set listchars=tab:▸\ ,extends:»,precedes:«
set noerrorbells                                 " Disable error bells
set nofoldenable
set nowrap
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
set undofile
set updatetime=1000
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
if has('nvim')
  set viminfo='100,/100,h,\"500,:100
else
  set viminfo='100,/100,h,\"500,:100,n~/.vim/viminfo
endif

let g:netrw_liststyle=3

" }}}

" Theme"{{{
try
  colorscheme wombat
catch
endtry

" Wombat overrides
" http://www.colorpicker.com

highlight SignColumn    cterm=none ctermbg=233 guibg=#111111
highlight LineNr        cterm=none ctermbg=233 guibg=#111111
highlight CursorLineNr  cterm=none ctermbg=233 guifg=#d4d987 guibg=#111111
highlight Search        cterm=none ctermfg=177 ctermbg=238   guifg=#cd7ffa guibg=#3a3a3a gui=underline
highlight Todo          cterm=none ctermfg=207 ctermbg=none  guifg=#e158e8 guibg=#5b415c
highlight ColorColumn   cterm=none ctermbg=234 guibg=#292929

" custom highlightings
highlight LintError   cterm=none ctermbg=233 ctermfg=205 guifg=#e5786d guibg=#111111
highlight LintWarning cterm=none ctermbg=233 ctermfg=97  guifg=#9933ff guibg=#111111

" plugin highlightings
highlight ExtraWhitespace   cterm=none ctermbg=160 guibg=#aa00ff
highlight SignifySignAdd    cterm=bold ctermbg=233 ctermfg=118 guifg=#95e454 guibg=#111111
highlight SignifySignDelete cterm=bold ctermbg=233 ctermfg=167 guifg=#e5786d guibg=#111111
highlight SignifySignChange cterm=bold ctermbg=233 ctermfg=227 guifg=#d4d987 guibg=#111111
"}}}

" Mappings {{{

" Leader mappings
nnoremap <Leader>w :w<CR>

" Search settings
nmap <silent> <leader>/ :noh<CR>

" swap buffers
nmap <leader><leader> <C-^>

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

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
nnoremap <silent> \ @=(foldlevel('.')?'za':"\<Space>")<CR>

" fzf.vim
nnoremap <silent> <leader>o :FZFFiles<cr>

" jit
vnoremap <silent> <localleader>jo :Jit open<CR>
nnoremap <silent> <localleader>jo :Jit open <cWORD><CR>

" toggle quickfix/location
function! s:GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! <SID>ToggleList(bufname, pfx)
  let l:buflist = s:GetBufferList()
  for l:bufnum in map(filter(split(l:buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(l:bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx ==? 'l' && len(getloclist(0)) == 0
    echohl ErrorMsg
    echo 'Location List is Empty.'
    return
  endif
  let l:winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != l:winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader>l :call <SID>ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>c :call <SID>ToggleList("Quickfix List", 'c')<CR>
nnoremap <silent> <leader>sc :cg /tmp/quickfix.out\|copen<CR>

" saving (keep imap to avoid vim-surround from binding it)
inoremap <C-s> <Esc>:update<CR>
nnoremap <C-s> <Esc>:update<CR>

" remap pum selection
" inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

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

" Keybindings to native vim features
map <M-[> :tprev<CR>
map <M-]> :tnext<CR>

" repeatng
vnoremap . :normal .<CR>
vnoremap @ :normal! @
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" line-endings
inoremap ;<cr> <end>;<cr>

" searching
command! -nargs=* -complete=file GG Grepper! -tool git -query <args>
command! -nargs=* -complete=file Ag Grepper! -tool ag -query <args>
nmap <C-f> :FZFAg<CR>

" re-select pasted text
noremap gV `[v`]

" todos, notes, misc stuff
function! s:notes(...)
  let l:notes_query = '(TODO|NOTE|INFO|ERROR|HACK):'
  let l:extra_args = ''

  if a:0 > 0
    let l:extra_args = join(a:000, ' ')
  endif

  call grepper#parse_command(1, '-tool ag -query "' . l:notes_query . '" ' . l:extra_args)
endfunction
command! -nargs=* -complete=file Notes call s:notes(<f-args>)

" vim-test
nmap <silent> <Leader>t :TestFile<CR>
nmap <silent> <Leader>T :TestNearest<CR>
nmap <silent> <Leader>tl :TestLast<CR>
nmap <silent> <Leader>ta :TestSuite<CR>

nmap <silent> <F7> :TestLast<CR>
nmap <silent> <F8> :TestFile<CR>
nmap <silent> <F9> :TestSuite<CR>

" vim-jdaddy
command! JSONPrettyPrint :normal gqaj

" vim-trailing-whitespace
nnoremap <leader>fw :FixWhitespace<cr>

" splitjoin
nmap gS :SplitjoinSplit<cr>
nmap gJ :SplitjoinJoin<cr>

" vim-commentary
map <C-_> gcc<Esc>
" imap <C-_> <Esc>gccgi

" vim-ragtag open tag
imap <C-_> <C-x>=

" vimux
map <Leader>vc :VimuxCloseRunner<CR>

" vim-unimpaired
imap <C-Up> <Esc>[egi
imap <C-Down> <Esc>]egi
nmap <C-Up> [e
nmap <C-down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" autoformat
map <silent> <leader>= :Autoformat ff=unix<cr>
map <silent> <F1> :FixWhitespace<cr><leader>=<cr>

" nerdtree
nnoremap <leader>e :NERDTreeToggle<cr>

" yankring
nnoremap <leader>y :YRShow<cr>

" tagbar
nnoremap <leader>b :TagbarToggle<cr>

" airline
nmap 1 <Plug>AirlineSelectTab1
nmap 2 <Plug>AirlineSelectTab2
nmap 3 <Plug>AirlineSelectTab3
nmap 4 <Plug>AirlineSelectTab4
nmap 5 <Plug>AirlineSelectTab5
nmap 6 <Plug>AirlineSelectTab6
nmap 7 <Plug>AirlineSelectTab7
nmap 8 <Plug>AirlineSelectTab8
nmap 9 <Plug>AirlineSelectTab9

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

  autocmd BufNewFile,BufRead *.less set filetype=less
  autocmd BufNewFile,BufRead .jsbeautifyrc,.eslintrc,.jshintrc set filetype=json
  autocmd BufNewFile,BufRead *.rss,*.atom set filetype=xml
  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake,*.thor} set filetype=ruby
  autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set filetype=markdown
  autocmd BufRead,BufNewFile *.{zsh,sh,bash} set filetype=sh

  " auto-reload vimrc
  autocmd BufWritePost {.vimrc,vimrc} source %

  " omnicomplete stuffs
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#CompleteTags

  " skeletons
  autocmd BufNewFile *_spec.rb    0read ~/.vim/skeletons/skeleton_spec.rb
  autocmd BufNewFile *.sh         0read ~/.vim/skeletons/skeleton.sh
  autocmd BufNewFile *.{bash,zsh} 0read ~/.vim/skeletons/skeleton.zsh

  " linters
  autocmd BufWritePost * Neomake

  " quickfix gutter signs
  " SEE: https://github.com/dhruvasagar/vim-markify
  " NOTE: clean this up, and put it somewhere better
  let s:sign_ids = {}
  let s:sign_text = "\uE0B1"
  let s:sign_texthl = 'LintError'

  execute 'sign define QuickfixError text='.s:sign_text.' texthl=' . s:sign_texthl

  function! s:ClearSigns()
    for l:sign_id in keys(s:sign_ids)
      exec 'sign unplace ' . l:sign_id
      call remove(s:sign_ids, l:sign_id)
    endfor
  endfunction

  function! s:PlaceSigns(items)
    for l:item in a:items
      if l:item.bufnr == 0 || l:item.lnum == 0
        continue
      endif

      let l:id = l:item.bufnr . l:item.lnum

      if has_key(s:sign_ids, l:id)
        return
      endif

      let s:sign_ids[l:id] = l:item

      let l:sign_name = 'QuickfixError'
      " if l:item.type ==? 'E'
      "   let l:sign_name = 'QuickfixError'
      " elseif l:item.type ==? 'W'
      "   let l:sign_name = 'QuickfixWarning'
      " else
      "   let l:sign_name = 'QuickfixInfo'
      " endif

      execute 'sign place ' . l:id . ' line=' . l:item.lnum . ' name=' . l:sign_name .
            \ ' buffer=' .  l:item.bufnr
    endfor
  endfunction

  function! s:PlaceQuickfixSigns()
    let [items, qflist]  = [[], getqflist()]
    if !empty(qflist)
      let items = qflist
    endif
    call s:PlaceSigns(items)
  endfunction

  autocmd QuickFixCmdPost * call s:ClearSigns() | call s:PlaceQuickfixSigns()
augroup END

augroup MarkdownGroup
  autocmd!
  autocmd FileType markdown set nofoldenable

  autocmd FileType markdown nmap <buffer> <localleader>i <Plug>(todo-new)
  autocmd FileType markdown nmap <buffer> <localleader>I <Plug>(todo-new-below)
  autocmd FileType markdown imap <buffer> <localleader>i <Plug>(todo-new)
  autocmd FileType markdown imap <buffer> <localleader>I <Plug>(todo-new-below)

  autocmd FileType markdown nmap <buffer> <localleader>x <Plug>(todo-mark-as-done)
  autocmd FileType markdown nmap <buffer> <localleader>X <Plug>(todo-mark-as-undone)
  autocmd FileType markdown vmap <buffer> <localleader>x <Plug>(todo-mark-as-done)
  autocmd FileType markdown vmap <buffer> <localleader>X <Plug>(todo-mark-as-undone)
augroup END

augroup RubyGroup
  autocmd!
  autocmd FileType ruby,eruby nmap <buffer> m ]mzz
  autocmd FileType ruby,eruby nmap <buffer> M [mzz

  " make ? part of word
  autocmd FileType ruby,eruby setlocal iskeyword+=?

  " align examples as you type in cucumber
  autocmd FileType cucumber inoremap <buffer> <silent> <Bar> <Bar><Esc>:call <SID>align_cucumber()<CR>a

  function! s:align_cucumber()
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

augroup AirlineGroup
  autocmd!
  function! MyAirline()
    let l:spc = g:airline_symbols.space
    let g:airline_section_b = airline#section#create(['%<', 'file', l:spc, 'readonly'])
    let g:airline_section_c = ''
    let g:airline_section_y = airline#section#create(['windowswap', 'linenr', ':%3v'])
    let g:airline_section_z = airline#section#create(['hunks', 'branch'])
  endfunction
  autocmd Vimenter * call MyAirline()
augroup END

" }}} /augroups

" External {{{

" golint support
set runtimepath+=$GOPATH/src/github.com/golang/lint/misc/vim

" ag
if executable('ag')
  set grepprg=ag\ -f\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif

" }}} /external

if filereadable(expand('~/.vimrc.local'))
  source expand('~/.vimrc.local')
endif


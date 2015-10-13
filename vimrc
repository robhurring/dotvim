" vim:fdm=marker

if !has('nvim')
  set nocompatible
endif
filetype off

call plug#begin('~/.vim/plugged')
source ~/.vim/plugins.vim

if filereadable(expand('~/.plugins.local.vim'))
  source ~/.plugins.local.vim
endif
call plug#end()

let mapleader=','
let localmapleader=','

inoremap <C-c> <Esc>
inoremap jk <Esc>l
nnoremap ,, , " reset default , behavior

if $TERM =~ '256color'
  set t_Co=256
elseif $TERM =~ '^xterm$'
  set t_Co=256
endif

" Options {{{
" http://vimdoc.sourceforge.net/htmldoc/quickref.html
filetype plugin indent on                  " Do filetype detection and load custom file plugins and indent files
syntax on

set autoindent
set backspace=eol,start,indent                   " Allow backspacing over indent, eol, & start
set backupdir=~/.vim/tmp
set clipboard=unnamed
set colorcolumn=80
set complete-=i
set cursorline
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

" Mappings
" change column marker
" highlight ColorColumn ctermbg=234 guibg=#222222
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929

" Search settings
nmap <leader>/ :set hlsearch! hlsearch?<CR>

" delete into blackhole register by default
nnoremap x "_x
nnoremap D "_D
nnoremap d "_d
vnoremap d "_d
nnoremap dd "_dd
" vnoremap dd "_dd
nnoremap <leader>d "*d
nnoremap <leader>dd "*dd
nnoremap <leader>D "*D

" fatfingers
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e

" saving
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" windows and such
map <C-t> <esc>:tabnew<CR>
map <C-x> :bd<cr>

" Emacs-like beginning and end of line.
imap <C-e> <C-o>$
imap <C-a> <C-o>^

" up/down on displayed lines, not real lines. More useful than painful.
nnoremap k gk
nnoremap j gj

" toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" quick fix
nnoremap <leader>co :Copen<cr>
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

augroup DefaultGroup
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

  " fix {} completion like endwise
  " autocmd FileType {javascript,sh,zsh,bash} inoremap {<cr> {<cr>}<Esc><S-o>

  " auto-reload vimrc
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC

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

" FZF {{{
if executable('fzf')
  set rtp+=~/.fzf

  nnoremap <silent> <Space><Space> :FZF -m<cr>
  nnoremap <silent> <Leader>s :call fzf#run({
        \   'down': '40%',
        \   'sink': 'botright split' })<CR>

  " Open files in vertical horizontal split
  nnoremap <silent> <Leader>v :call fzf#run({
        \   'right': winwidth('.') / 2,
        \   'sink':  'vertical botright split' })<CR>

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
endif
" }}}

" Plugins {{{1

" if FZF
nmap <leader>t :Tags<cr>

" rspec
function! <SID>SmartRunSpec()
  if exists("s:last_spec")
    call RunLastSpec()
  else
    call RunNearestSpec()
  end
endfunction

let g:rspec_command = 'Dispatch rspec --drb {spec}'
let g:rspec_runner = 'os_x_iterm2'
nmap <silent> <Leader>t :w<cr>:call RunNearestSpec()<cr>
nmap <silent> <Leader>T :w<cr>:call RunCurrentSpecFile()<cr>

" Colors
try
  colorscheme wombat
catch
endtry
highlight clear SignColumn
" let g:jellybeans_use_lowcolor_black = 0

" easy-pair
let g:AutoPairsMapSpace = 0

" vim-tags
let g:vim_tags_auto_generate = 0
let g:vim_tags_cache_dir = expand('~/.vim/tmp')
let g:vim_tags_directories = ['.git']
let g:vim_tags_main_file = 'tags'
let g:vim_tags_use_language_field = 1
let g:vim_tags_use_vim_dispatch = 1

" gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1

" ag
let g:ag_working_path_mode = 'r'

" sessions
let g:session_directory = '~/.vim/sessions'
let g:session_extension = '.session'
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" markdown preview
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1

" Signify
let g:signify_vcs_list = ['git']
highlight SignifySignAdd    cterm=bold ctermbg=none  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=none  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=none  ctermfg=227

" Fix trailing whitespace
nnoremap <leader>fw :FixWhitespace<cr>

" JSON
let g:vim_json_syntax_conceal = 0

" neocomplete / deoplete
" if has('nvim')
"   let g:deoplete#enable_at_startup = 1
"   let g:deocomplete#enable_smart_case = 1
"   let g:deoplete#auto_completion_start_length = 3
" else
"   let g:acp_enableatstartup = 0
"   let g:neocomplete#enable_at_startup = 1
"   let g:neocomplete#enable_smart_case = 1
"   let g:neocomplete#sources#syntax#min_keyword_length = 3
" endif

" vim-jsx
let g:jsx_ext_required = 0

" YCM
let g:ycm_key_list_select_completion   = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:ycm_completion_confirm_key       = '<Enter>'
let g:ycm_min_num_of_chars_for_completion = 3
" let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1

" Utilsnips
let g:UltiSnipsExpandTrigger       = "<Tab>"
let g:UltiSnipsJumpForwardTrigger  = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
" let g:UltiSnipsListSnippets        = "<C-h>"

" comment
map <C-_> gcc<Esc>
imap <C-_> <Esc>gccgi

" bubbling lines vim-exchang
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" autoformat
map <silent> <leader>r :Autoformat<cr>
let g:formatdef_rbeautify = '"ruby-beautify ".(&expandtab ? "-s -c ".&shiftwidth : "-t")'

" nerdtree
nnoremap <leader>g :NERDTreeToggle<cr>
let nerdtreeignore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$' ]
let nerdtreehighlightcursorline=1
let nerdtreeshowbookmarks=1
let nerdtreeshowfiles=1

" yankring
nnoremap <leader>y :YRShow<cr>
let g:yankring_history_dir = '$HOME/.vim/tmp'
let g:yankring_manual_clipboard_check = 0
let g:yankring_replace_n_pkey = ''
let g:yankring_replace_n_nkey = ''

" bubbling lines
nnoremap <leader>b :TagbarToggle<cr>

" syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:quickfixsigns_classes = ['qfl']

" airline {{{2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#hunks#enabled = 0

let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_detect_paste = 1
let g:airline_theme = 'bubblegum'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

function! MyAirline()
  let spc = g:airline_symbols.space
  let g:airline_section_b = airline#section#create(['%<', 'file', spc, 'readonly'])
  let g:airline_section_c = ''
  let g:airline_section_y = airline#section#create(['windowswap', 'linenr', ':%3v'])
  let g:airline_section_z = airline#section#create(['hunks', 'branch'])
endfunction
autocmd Vimenter * call MyAirline()
" }}}

" tabularize
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

" gundo
" nnoremap <leader>u :GundoToggle<cr>

" multi cursor
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'

" js lib syntax plugin
let g:used_javascript_libs = 'underscore,angularjs,jquery,angularui,jasmine,react'

" go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1
let g:go_dispatch_enabled = 1

" }}}1 //Plugins

" Plugin Autocmd Groups

" augroup TagsGroup
"   autocmd!
"   autocmd BufWritePost *.{rb,js,jsx,es6,py,go} TagsGenerate
" augroup END

augroup RubyGroup
  autocmd!
  autocmd FileType ruby,eruby nmap <Leader>tr :call RunCurrentSpecFile()<CR>
  autocmd FileType ruby,eruby nmap <Leader>ts :call RunNearestSpec()<CR>
  autocmd FileType ruby,eruby nmap <Leader>tl :call RunLastSpec()<CR>
  autocmd FileType ruby,eruby nmap <Leader>ta :call RunAllSpecs()<CR>

  autocmd FileType ruby,eruby nmap m ]m
  autocmd FileType ruby,eruby nmap M [m

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

" }}

" External

" ag
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


" dependencies
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-dispatch'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tmhedberg/matchit'
Plug 'kana/vim-textobj-user'
Plug 'xolox/vim-misc'                   " used for vim-sessions

" color schemes
Plug 'nanotech/jellybeans.vim'
Plug 'sheerun/vim-wombat-scheme'

" core plugins
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'vim-scripts/YankRing.vim'
Plug 'Townk/vim-autoclose'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'edkolev/promptline.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'mkitt/tabline.vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mhinz/vim-signify'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'xolox/vim-session'
Plug 'rizzatti/dash.vim', {'on': 'Dash'}
Plug 'bling/vim-airline'
Plug 'mattn/gist-vim', {'on': 'Gist'}
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'jszakmeister/vim-togglecursor'
Plug 'thoughtbot/vim-rspec', {'for': 'ruby'}
Plug 'szw/vim-tags'

" ABRT error: https://github.com/Valloric/YouCompleteMe/issues/8
" Solutions: add this to your ~/.<shell>rc
"   export DYLD_FORCE_FLAT_NAMESPACE=1
" Other: re-compile VIM with the homebrew version of python
" Other: `brew unlink python` and run YCM installer
Plug 'Valloric/YouCompleteMe', {'do': './install.py' }

" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/neosnippet.vim'

" Plug 'xolox/vim-easytags', {'on': 'UpdateTags'}
" Plug 'kien/ctrlp.vim'
" Plug 'itchyny/lightline.vim'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'ervandew/supertab'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer' }
" Plug 'Blackrush/vim-gocode'
" Plug 'malithsen/trello-vim'
" Plug 'honza/vim-snippets'
" Plug 'Lokaltog/vim-easymotion'
" Plug 'erniebrodeur/ruby-beautify'
" Plug 'wookiehangover/jshint.vim'
" Plug 'tpope/vim-dispatch'
" Plug 'Lokaltog/vim-powerline'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'kchmck/vim-coffee-script'

""""""""""""""""""
" NeoVIM Plugins
""""""""""""""""""

" run :UpdateRemotePlugins in nvim to enable it
" Plug 'Shougo/deoplete.nvim'


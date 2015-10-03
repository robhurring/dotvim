" dependencies
Plug 'mattn/webapi-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tmhedberg/matchit'
Plug 'kana/vim-textobj-user'

" color schemes
Plug 'nanotech/jellybeans.vim'

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
Plug 'kien/ctrlp.vim'
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'fholgado/minibufexpl.vim', {'on': 'MBEToggle'}
Plug 'vim-scripts/YankRing.vim'
Plug 'Townk/vim-autoclose'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'ngmy/vim-rubocop'
Plug 'Chiel92/vim-autoformat'

Plug 'ecomba/vim-ruby-refactoring'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'bronson/vim-trailing-whitespace'

Plug 'Shougo/unite.vim'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neocomplete.vim'

" Plug 'terryma/vim-multiple-cursors'
" Plug 'ervandew/supertab'
" Plug 'tommcdo/vim-exchange'
" Plug 'airblade/vim-gitgutter'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer' }
" Plug 'christoomey/vim-titlecase'
" Plug 'quentindecock/vim-cucumber-align-pipes'
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

if filereadable(expand('~/.plugins.local.vim'))
  source ~/.plugins.local.vim
endif


" vim:fdm=marker

" dependencies {{{
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'mattn/webapi-vim'
Plug 'tmhedberg/matchit'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-dispatch'
"}}}

" color schemes {{{
Plug 'nanotech/jellybeans.vim'"
Plug 'sheerun/vim-wombat-scheme'
"}}}

" misc plugins
Plug 'Chiel92/vim-autoformat'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'jszakmeister/vim-togglecursor'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'mattn/gist-vim', {'on': 'Gist'}
Plug 'mhinz/vim-signify'
Plug 'mkitt/tabline.vim'
Plug 'plasticboy/vim-markdown'
Plug 'rizzatti/dash.vim', {'on': 'Dash'}
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/syntastic'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'szw/vim-tags'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/YankRing.vim'
Plug 'jiangmiao/auto-pairs'

" html/css/js
Plug 'elzr/vim-json'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" go
Plug 'fatih/vim-go', {'for': 'go'}

" ruby
Plug 'ecomba/vim-ruby-refactoring'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'thoughtbot/vim-rspec', {'for': 'ruby'}
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" ABRT error: https://github.com/Valloric/YouCompleteMe/issues/8
" Solutions: add this to your ~/.<shell>rc
"   export DYLD_FORCE_FLAT_NAMESPACE=1
" Other: re-compile VIM with the homebrew version of python
" Other: `brew unlink python` and run YCM installer
Plug 'Valloric/YouCompleteMe', {'do': './install.py --gocode-completer' }


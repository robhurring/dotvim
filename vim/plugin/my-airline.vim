" NOTE: Assuming we are using airline

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
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ }

augroup StatuslineGroup
  autocmd!

  " airline
  function! s:MyAirline()
    let l:spc = g:airline_symbols.space
    let g:airline_section_b = airline#section#create(['%<', '%{pathshorten(fnamemodify(getcwd(), ":~:."))}'])
    let g:airline_section_c = airline#section#create(['file', l:spc, 'readonly'])
    let g:airline_section_y = airline#section#create(['windowswap', 'linenr', ':%-2v'])
    let g:airline_section_z = airline#section#create(['hunks', 'branch'])
  endfunction
  autocmd Vimenter * call <SID>MyAirline()
augroup END

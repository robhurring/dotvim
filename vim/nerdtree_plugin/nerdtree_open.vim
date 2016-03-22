if exists("g:loaded_nerdtree_plugin_open")
    finish
endif
let g:loaded_nerdtree_plugin_open = 1
let g:nerdtree_open_cmd = 'open'

call NERDTreeAddKeyMap({
      \ 'scope': 'FileNode',
      \ 'key': 'O',
      \ 'callback': 'NERDTreeOpenExternal',
      \ 'quickhelpText': 'Open externally'
      \ })

function! NERDTreeOpenExternal(node)
  let path = g:NERDTreeFileNode.GetSelected().path.str({'escape': 1})
  echom "Opening " . path
  exec 'silent !' . g:nerdtree_open_cmd . ' ' . path
endfunction

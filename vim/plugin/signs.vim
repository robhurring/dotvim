" if exists('g:signs_loaded')
"   finish
" end

" let g:signs_loaded = 1

" quickfix gutter signs
" SEE: https://github.com/dhruvasagar/vim-markify
" NOTE: clean this up, and put it somewhere better
" let s:sign_ids = {}
" let s:sign_text = "\uE0B1"
" let s:sign_texthl = 'LintError'

" execute 'sign define QuickfixError text='.s:sign_text.' texthl=' . s:sign_texthl

" function! s:ClearSigns()
"   for l:sign_id in keys(s:sign_ids)
"     exec 'sign unplace ' . l:sign_id
"     call remove(s:sign_ids, l:sign_id)
"   endfor
" endfunction

" function! s:PlaceSigns(items)
"   for l:item in a:items
"     if l:item.bufnr == 0 || l:item.lnum == 0
"       continue
"     endif

"     let l:id = l:item.bufnr . l:item.lnum

"     if has_key(s:sign_ids, l:id)
"       return
"     endif

"     let s:sign_ids[l:id] = l:item

"     let l:sign_name = 'QuickfixError'
"     " if l:item.type ==? 'E'
"     "   let l:sign_name = 'QuickfixError'
"     " elseif l:item.type ==? 'W'
"     "   let l:sign_name = 'QuickfixWarning'
"     " else
"     "   let l:sign_name = 'QuickfixInfo'
"     " endif

"     execute 'sign place ' . l:id . ' line=' . l:item.lnum . ' name=' . l:sign_name .
"           \ ' buffer=' .  l:item.bufnr
"   endfor
" endfunction

" function! s:PlaceQuickfixSigns()
"   let [items, qflist]  = [[], getqflist()]
"   if !empty(qflist)
"     let items = qflist
"   endif
"   call s:PlaceSigns(items)
" endfunction


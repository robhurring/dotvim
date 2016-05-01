" custom projects for gutentags/ctags
if (exists('g:loaded_gutentags') || &cp)
  " greenhouse
  call add(g:gutentags_project_info, {'type': 'greenhouse', 'file': 'sakura/sakura.gemspec'})
  let g:gutentags_ctags_executable_greenhouse = 'ctags --exclude=*public/*.js,*vendor/*.js'
endif

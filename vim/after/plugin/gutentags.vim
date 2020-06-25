" custom projects for gutentags/ctags
if (exists('g:loaded_gutentags') || &cp)
  " reset all project infos
  let g:gutentags_project_info = []

  " default after customs so they are first-hit
  call add(g:gutentags_project_info, {'type': 'python', 'file': 'setup.py'})
  call add(g:gutentags_project_info, {'type': 'ruby', 'file': 'Gemfile'})
endif

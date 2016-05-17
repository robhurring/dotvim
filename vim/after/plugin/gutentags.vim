" custom projects for gutentags/ctags
if (exists('g:loaded_gutentags') || &cp)
  " reset all project infos
  let g:gutentags_project_info = []

  " desk
  call add(g:gutentags_project_info, {'type': 'desk', 'file': 'Gemfile_rails40'})
  let g:gutentags_ctags_executable_desk = 'ctags --languages=-js,-javascript,-coffee'

  " default after customs so they are first-hit
  call add(g:gutentags_project_info, {'type': 'python', 'file': 'setup.py'})
  call add(g:gutentags_project_info, {'type': 'ruby', 'file': 'Gemfile'})
endif

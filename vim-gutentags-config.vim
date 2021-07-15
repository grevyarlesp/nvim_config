" {{{ ctags and vista.vim
set tags=./tags;
let g:gutentags_ctags_exclude = [
  \'node_modules', '_build', 'build', 'CMakeFiles', '.mypy_cache', 'venv',
  \'*.md', '*.tex', '*.css', '*.html', '*.json', '*.xml', '*.xmls', '*.ui']

" Guttentags will exclude files from wildignore settings
let g:gutentags_ctags_exclude_wildignore = 1

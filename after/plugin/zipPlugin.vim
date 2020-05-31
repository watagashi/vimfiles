scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 ff=unix fenc=utf-8:

if !exists('g:zipPlugin_ext')
  finish
endif

" Remove '*.ja' from default
let g:zipPlugin_ext = substitute(g:zipPlugin_ext, '\*\.ja,', '', '')

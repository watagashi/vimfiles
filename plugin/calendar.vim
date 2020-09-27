scriptencoding utf-8 " vim:set ts=8 sts=2 sw=2 tw=0 ff=unix fenc=utf-8:

" calendar.vim
" http://www.vim.org/scripts/script.php?script_id=52
if !exists('g:calendar_diary')
  if exists('$APPDATA') && isdirectory(expand('$APPDATA/diary'))
    let g:calendar_diary = expand('$APPDATA/diary')
  elseif isdirectory(expand('~/Documents/diary'))
    let g:calendar_diary = '~/Documents/diary'
  elseif isdirectory(expand('~/Dropbox/Dillinger/diary'))
    let g:calendar_diary = '~/Dropbox/Dillinger/diary'
  endif
endif

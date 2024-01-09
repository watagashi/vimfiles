scriptencoding utf-8 " vim:set ts=8 sts=2 sw=2 tw=0 ff=unix fenc=utf-8:

" calendar.vim
" http://www.vim.org/scripts/script.php?script_id=52
command! -nargs=0 NewDiary exec 'cd ' . g:calendar_diary | exec strftime('f %Y/%m/%d.md')

if !exists('g:calendar_diary')
  if exists('$APPDATA') && isdirectory(expand('$APPDATA/diary'))
    command! -nargs=0 NewDiary exec 'Hgcd' | exec 'Hg cp ' . expand('%') . strftime(' %Y/%m/%d.md') | exec strftime('e %Y/%m/%d.md')
    let g:calendar_diary = expand('$APPDATA/diary')
  elseif exists('$OneDrive') && isdirectory(expand('$OneDrive/Documents/diary'))
    let g:calendar_diary = expand('$OneDrive/Documents/diary')
  elseif isdirectory(expand('~/Documents/diary'))
    let g:calendar_diary = '~/Documents/diary'
  elseif isdirectory(expand('~/Dropbox/Dillinger/diary'))
    let g:calendar_diary = '~/Dropbox/Dillinger/diary'
  endif
endif

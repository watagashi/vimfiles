scriptencoding utf-8
" vim: set ts=4 sw=4 et ff=unix fenc=utf-8:

if !has('win32') || !isdirectory($SystemDrive . '\PPA_SPR\RamDrive')
    finish
endif

set nowritebackup noundofile

scriptencoding cp932
" twada

" Only do this when not done yet for this buffer
"if exists("b:did_ftplugin")
"  finish
"endif
"let b:did_ftplugin = 1

setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
if exists('&colorcolumn')
	setlocal colorcolumn=-10
endif

" Abbreviations
abbreviate ÇÊÇÎÇµÇ≠Ç® ÇÊÇÎÇµÇ≠Ç®äËÇ¢Ç¢ÇΩÇµÇ‹Ç∑ÅB

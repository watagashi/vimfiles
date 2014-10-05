if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufNewFile,BufRead *.cls
	\ if getline(1) =~ '^VERSION 1.0 CLASS' |
	\   setf vb |
	\ endif
  au! BufNewFile,BufRead *.vbe		setf vb
  au! BufNewFile,BufRead *.log		setf log
  au! BufNewFile,BufRead *.inc		set filetype=aspvbs
  au! BufNewFile,BufRead /var/adm/messages,/var/adm/messages.*[0-9]  setf messages
  " Why not exist $VIMRUNTIME/syntax/pc.vim ?
  au! BufNewFile,BufRead *.sc,*.pc	setf esqlc
  " http://www.vim.org/scripts/script.php?script_id=1327
  au! BufNewFile,BufRead *.ps1		setf ps1
  au! BufNewFile,BufRead *.ddl		setf sql
  au! BufNewFile,BufRead *.tss		setf javascript
  silent! execute "so ". expand("<sfile>:p:h") . "/repos/vim-creole/ftdetect/creole.vim"
augroup END
" vim:set sw=2:

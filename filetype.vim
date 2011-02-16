if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufNewFile,BufRead *.vbe		setf vb
  au! BufNewFile,BufRead *.log		setf log
  au! BufNewFile,BufRead *.inc		set filetype=aspvbs
  au! BufNewFile,BufRead /var/adm/messages,/var/adm/messages.*[0-9]  setf messages
  " Why not exist $VIMRUNTIME/syntax/pc.vim ?
  au! BufNewFile,BufRead *.sc,*.pc	setf esqlc
augroup END
" vim:set sw=2:

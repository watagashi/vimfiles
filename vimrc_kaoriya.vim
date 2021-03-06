scriptencoding utf-8 " vim:set ts=8 sts=2 sw=2 tw=0 ff=unix fenc=utf-8:

" Mainly for MacVim without KaoriYa
" !git clone https://github.com/koron/vim-kaoriya.git ~/.vim/vim-kaoriya

if has('kaoriya')
  finish
endif

let s:vimfiles = isdirectory(expand('~/vimfiles'))
      \ ? expand('~/vimfiles') : expand('~/.vim')
let s:kaoriyavimdirectory = s:vimfiles . '/vim-kaoriya/kaoriya/vim'

if !filereadable(s:kaoriyavimdirectory . '/vimrc')
  echomsg 'vim-kaoriya not found.'
  finish
endif

let s:vim = $VIM
let $VIM = s:kaoriyavimdirectory
execute 'silent! source ' . $VIM . '/vimrc'
let $VIM = s:vim
unlet s:vim

" Enforces the character encoding used by Vim internally to UTF-8.
" Because vim-kaoriya/kaoriya/vim/switches/catalog/utf-8.vim
" is not working well.
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,euc-jisx0213,euc-jp,cp932

set ambiwidth=double
if has('osxdarwin')
  set printmbfont=r:HiraMinProN-W3,b:HiraMinProN-W6
endif

" Reset &term
if has('unix') && !has('gui_running')
  set term=$TERM
endif

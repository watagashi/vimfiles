scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 ff=unix fenc=utf-8:

let s:vimfiles = isdirectory(expand('~/vimfiles'))
      \ ? expand('~/vimfiles') : expand('~/.vim')

" Mainly for MacVim without KaoriYa
" !git clone https://github.com/koron/vim-kaoriya.git ~/.vim/vim-kaoriya
if !has('kaoriya') && filereadable(s:vimfiles . '/vim-kaoriya/kaoriya/vim/vimrc')
  let s:vim = $VIM
  let $VIM = s:vimfiles . '/vim-kaoriya/kaoriya/vim'
  execute 'source ' . $VIM . '/vimrc'
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
endif

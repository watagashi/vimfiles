scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 ff=unix fenc=utf-8:

let s:vimfiles = isdirectory(expand('~/vimfiles'))
      \ ? expand('~/vimfiles') : expand('~/.vim')

" Mainly for MacVim without KaoriYa
" !git clone https://github.com/koron/vim-kaoriya.git ~/.vim/vim-kaoriya
if !has('kaoriya') && filereadable(s:vimfiles . '/vim-kaoriya/kaoriya/vim/gvimrc')
  let s:vim = $VIM
  let $VIM = s:vimfiles . '/vim-kaoriya/kaoriya/vim'
  execute 'source ' . $VIM . '/gvimrc'
  let $VIM = s:vim
  unlet s:vim
  if has('gui_macvim')
    set guifont=Osaka-Mono:h14
    set noimdisable
  endif
endif

scriptencoding utf-8

" vim:set ts=8 sts=2 sw=2 tw=0 ff=unix fenc=utf-8:

source <sfile>_kaoriya.vim

silent! colorscheme gruvbox
if !exists('g:colors_name') || g:colors_name!='gruvbox'
    colorscheme desert
endif
if has( 'gui_gtk2' )
  set guifont=Monospace\ 12
elseif has('gui_win32')
  set guifont=Consolas:h12 guifontwide=UD_デジタル_教科書体_N-R:h12 " guifontwide=BIZ_UDGothic:h12
endif

set background=dark

"set nomousefocus
"set linespace=2
"set clipboard=unnamed

set guioptions+=a	" Kaoriya 版 Vim 6.1.267 の gvimrc からなくなった
"nnoremap gV "*p
"vnoremap gC "*y
"vnoremap gX "*c

if has( 'win32' )
  command! -bar Fonts set guifont=MS_Gothic:h9:cSHIFTJIS
  command! -bar Fontl set guifont=MS_Gothic:h12:cSHIFTJIS
  "command! -bar Scrl set columns=136 lines=48
  "command! -bar Scrs set columns=80 lines=25
  "command! -bar ND set columns=80 lines=25 guifont=MS_Gothic:h12:cSHIFTJIS
  "command! -bar HD set guifont=MS_Gothic:h9:cSHIFTJIS columns=136 lines=48

  " Vim technique bible 1-9 (pp.39)
  " let g:IMState = 0
  " autocmd InsertEnter * let &iminsert = g:IMState
  " autocmd InsertLeave * let g:IMState = &iminsert|set iminsert=0 imsearch=0
endif

" Vim technique bible 2-15
if has('clientserver')
  runtime macros/editexisting.vim
endif

"colorscheme evening
" Vim 6.0ap から highlight clear で
" $VIM/gvimrc の highlight CursorIM が無効になるので
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  " inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
  " または
  autocmd InsertLeave * set iminsert=0
endif

"MenuLang v:lang

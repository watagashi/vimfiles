" vim-markdown only
" [plasticboy/vim-markdown: Markdown Vim Mode](https://github.com/plasticboy/vim-markdown)
if b:current_syntax != "mkd"
  finish
endif

" [junegunn/vim-emoji: Emoji in Vim](https://github.com/junegunn/vim-emoji)
syn match Emoji ":\w\+:"
syn region mkdListItemLine start="^\s*\%([-*+]\|\d\+\.\)\s\+" end="$" oneline contains=@mkdNonListItem,mkdListItem,@Spell,Emoji
syn region mkdNonListItemBlock start="\(\%^\(\s*\([-*+]\|\d\+\.\)\s\+\)\@!\|\n\(\_^\_$\|\s\{4,}[^ ]\|\t+[^\t]\)\@!\)" end="^\(\s*\([-*+]\|\d\+\.\)\s\+\)\@=" contains=@mkdNonListItem,@Spell,Emoji
hi def link Emoji Special

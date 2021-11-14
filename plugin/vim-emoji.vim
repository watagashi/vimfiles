scriptencoding utf-8 " vim:set ts=8 sts=2 sw=2 tw=0 ff=unix fenc=utf-8:

" junegunn/vim-emoji: Emoji in Vim https://github.com/junegunn/vim-emoji
set completefunc=emoji#complete
command! -range Emoji <line1>,<line2>s/:\([0-9A-Za-z_+-]\+\):/\=emoji#for(submatch(1), submatch(0))/g | nohlsearch

scriptencoding utf-8 " vim:set ts=8 sts=2 sw=2 tw=0 ff=unix fenc=utf-8:

" Tabular
command! -range TextileTabularize <line1>,<line2>Tabularize /|\([^.|]*\.\)\=\(\s\|$\)

scriptencoding utf-8 " vim:set ts=8 sts=2 sw=2 tw=0 ff=unix fenc=utf-8:

" NeoFormat
let g:neoformat_enabled_javascript = ['prettier', 'js-beautify']
let g:neoformat_javascript_prettier = {
    \       'exe': 'prettier',
    \       'args': ['--single-quote', '--stdin'],
    \       'stdin': 1
    \   }
let g:neoformat_enabled_json = ['prettier']
let g:neoformat_json_prettier = {
    \       'exe': 'prettier',
    \       'args': ['--stdin-filepath in.json'],
    \       'stdin': 1
    \   }
let g:neoformat_enabled_markdown = ['prettier']
let g:neoformat_markdown_prettier = {
    \       'exe': 'prettier',
    \       'args': ['--tab-width 4', '--stdin-filepath in.md'],
    \       'stdin': 1
    \   }

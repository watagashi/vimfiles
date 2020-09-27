scriptencoding utf-8 " vim:set ts=8 sts=2 sw=2 tw=0 ff=unix fenc=utf-8:

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0 " recomemnded 1, default 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = {
"    \ "mode": "active",
"    \ "passive_filetypes": ["markdown"] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_markdown_checkers = ['textlint']
let g:syntastic_markdown_textlint_exec = 'npx'
let g:syntastic_markdown_textlint_exe = 'npx remark'
"if filereadable("~/dotfiles/.mdlrc")
"    let g:syntastic_markdown_mdl_args="-c ~/dotfiles/.mdlrc"
"endif

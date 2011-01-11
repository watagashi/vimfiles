" vim: set ts=4 sw=4 et ff=unix:
if $HOME=='' && has('win32')
  let $HOME=$USERPROFILE
endif

" vim: set ts=4 sw=4 et:
set directory=$TEMP
"set backupdir=$TEMP
set nobackup
set tags=$VIM/tags,./tags;/,tags
set dictionary=$VIMRUNTIME/GENE.TXT
set formatoptions-=M
set formatoptions+=nBr
set scrolloff=1
set listchars+=tab:>-
set path+=./**,**
set diffopt+=iwhite
set printoptions+=formfeed:y
if (version == 703 && has("patch72")) || version > 703
    set wildignorecase
endif
"set cscopetag
"if &shell =~? "cmd"
"	set shell=$comspec\ /E:ON\ /F:ON
"endif
"source $VIMRUNTIME/macros/jcode.vim

if has("autocmd")
	autocmd FileType text setlocal textwidth=78 expandtab tabstop=4 shiftwidth=4
endif

command! -bar -nargs=0 Nodiff setlocal diff< scrollbind< wrap< foldmethod< foldcolumn& cursorbind< | norm zE
command! -bar -nargs=0 PrintFileInfo echo strftime( '%c' ,getftime( expand( '%' ) ) ) . " " . getfsize( expand( '%' ) ) . " Bytes"
command! -bar -nargs=0 Izon runtime macros/izon.vim
command! -bar -nargs=0 Vime execute 'source ~/vimfiles/macros/vime2.vim'
command! -bar -nargs=0 Rlog new | setlocal bt=nofile noswf ft=rcslog | execute '0r! rlog #' | 1
command! -bar -nargs=? -range=% Extab let et_save=&et | setl et | <line1>,<line2>ret! <args> | let &et=et_save | unlet et_save

" RFC 3676 (obsoletes 2646) Quoting style
command! -bar -nargs=0 -range Unquote silent! <line1>,<line2>s/^\(\(> \=\)*\)> \=/\1/ | nohl | norm ``
"command! -bar -nargs=0 -range Quote <line1>,<line2>s/^\(\(> \=\)*\)/\1> / | silent! <line1>,<line2>s/^>*\zs> \ze>/>/g | nohl
command! -bar -nargs=0 -range Quote <line1>,<line2>s/^/> / | silent! <line1>,<line2>s/^> >/>>/ | nohl | norm ``
command! -bar -nargs=0 -range=% Requote silent! <line1>,<line2>s/^> >/>>/ | nohl | norm ``
command! -bar -nargs=0 Dquote .,/^-- $/-2del | nohl
command! -bar -nargs=0 -range Htmlencode silent! <line1>,<line2>s/&/\&amp;/g | <line1>,<line2>s/</\&lt;/g | silent! <line1>,<line2>s/>/\&gt;/g | silent! <line1>,<line2>s/"/\&quot;/g | nohl | norm ``

command! -bar -nargs=1 Settabs setl ts=<args> sw=<args>

command! -bar -nargs=0 Fold setl fdm=syntax fdc=12
command! -bar -nargs=0 NoFold setl fdm& fdc&
command! -bar -nargs=0 Cfold syntax region	cBlock	start="{" end="}" transparent fold | Fold

command! -bar -nargs=0 Ypath let @*=expand('%:p')
if has('win32')
    if exists('$JAVA_HOME')
        execute 'command! -bar -nargs=? -range=% Jn2a <line1>,<line2>!"' . $JAVA_HOME . '\bin\native2ascii.exe" <args>'
    else
        execute 'command! -bar -nargs=? -range=% Jn2a <line1>,<line2>!"' . $ProgramFiles . '\java\jdk1.6.0_23\bin\native2ascii.exe" <args>'
    endif
endif

"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz
"nnoremap g* g*zz
"nnoremap g# g#zz
"nnoremap gd gdzz
"nnoremap gD gDzz
"nnoremap 1gd 1gdzz
"nnoremap 1gD 1gDzz

inoremap <F2> =strftime("%c")
nnoremap QQ gqgq
let g:format_join_spaces=1

let g:autodate_keyword_pre='\cLast Modified\s*:\s*'
let g:html_use_css = 1

" File Explorer
let g:explDetailedList=1
let g:explDateFormat="%x %X"
let g:netrw_fastbrowse=2

" vcscommand
" http://www.vim.org/scripts/script.php?script_id=90
if v:version < 700
    let g:VCSCommandDisableAll = 1
endif
let g:CVSCommandDiffOpt='bBu'
let g:VCSCommandCVSDiffOpt='bBu'
if has('win32') 
    let $PATH=$PATH . ';' . $ProgramFiles . '\Git\bin'
endif
let $HGENCODING=&encoding
command! -bar -nargs=1 Setenc set enc=<args> | let $HGENCODING='<args>'

" GetScript
let g:GetLatestVimScripts_wget='curl'

" ChangeLog
" let g:changelog_timeformat='%c'
let g:changelog_username=$username

if has('win32') && has('multi_lang') && v:lang == 'ja' && &encoding != 'cp932'
    set encoding=cp932
    "set fileencoding=cp932
endif

" zen-coding
" http://www.vim.org/scripts/script.php?script_id=2981
let g:user_zen_settings = {'lang':'ja'}

" TwitVim
" http://www.vim.org/scripts/script.php?script_id=2204
let twitvim_count = 100
if has('win32')
    let twitvim_browser_cmd = $ProgramFiles . '\Opera\opera.exe'
endif

" skk
" http://www.vim.org/scripts/script.php?script_id=3118
if filereadable( expand( "~/vimfiles/dict/SKK-JISYO.L" ) )
    let g:skk_large_jisyo = "~/vimfiles/dict/SKK-JISYO.L"
endif
let g:skk_show_annotation=1
let g:skk_egg_like_newline=1

" diffchanges.vim
" http://www.vim.org/scripts/script.php?script_id=2158
let g:diffchanges_patch_cmd = 'diff -ubB'

colorscheme desert

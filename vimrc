scriptencoding utf-8

" vim: set ts=4 sw=4 et ff=unix fenc=utf-8:
if $HOME=='' && has('win32')
  let $HOME=$USERPROFILE
endif
if filereadable( expand( "~/vimfiles/bundle/vim-pathogen/autoload/pathogen.vim" ) )
    source ~/vimfiles/bundle/vim-pathogen/autoload/pathogen.vim
    execute pathogen#infect()
endif
if $TERM == 'cygwin'
    set term=builtin_pcansi
    set encoding=cp932
endif

" vim: set ts=4 sw=4 et:
if exists("$TEMP")
    set directory=$TEMP
    set undodir=$TEMP
elseif exists("$TMPDIR")
    set directory=$TMPDIR
    set undodir=$TMPDIR
endif
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
set visualbell
set updatetime=2000
set cryptmethod=blowfish2
"set cscopetag
"if &shell =~? "cmd"
"	set shell=$comspec\ /E:ON\ /F:ON
"endif
"source $VIMRUNTIME/macros/jcode.vim

" See
"   :help color-xterm
if &term =~ "xterm" && &t_Co<2
    if has("terminfo")
      set t_Co=16
      set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
      set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
    else
      set t_Co=16
      set t_Sf=[3%dm
      set t_Sb=[4%dm
    endif
    syntax on
    set hlsearch
endif

if has("autocmd")
	autocmd FileType text setlocal textwidth=78 expandtab tabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead .{jshint,eslint,jscs,jsbeautify}rc setf json
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

" Quoting reply on Outlook 2016 for Mac
command! -bar -nargs=0 Aquote 1,5s/^ \n-- $/\r-- / | /^[^>].*> を書き込みました:/+2,$Quote | execute "normal 3\<c-o>"

command! -bar -nargs=1 Settabs setl ts=<args> sw=<args> et

command! -bar -nargs=0 Fold setl fdm=syntax fdc=12
command! -bar -nargs=0 NoFold setl fdm& fdc&
command! -bar -nargs=0 Cfold syntax region	cBlock	start="{" end="}" transparent fold | Fold

command! -bar -nargs=0 Ypath let @*=expand('%:p')
if has('win32')
    if exists('$JAVA_HOME')
        execute 'command! -bar -nargs=? -range=% Jn2a <line1>,<line2>!"' . $JAVA_HOME . '\bin\native2ascii.exe" <args>'
    else
        execute 'command! -bar -nargs=? -range=% Jn2a <line1>,<line2>!"' . $ProgramFiles . '\java\jdk1.6.0_24\bin\native2ascii.exe" <args>'
    endif
endif

command! -bar -range=% Diffnodate <line1>,<line2>s/^\(--- \|+++ \)\f\+\zs.\+//

command! -bar -nargs=1 G1log r!git log --oneline --reverse <args>.. | perl -pe 's/^[0-9a-f]+ /* /'

" Vim technique bible 3-14
nnoremap * *N
nnoremap # #N
" Vim technique bible 4-1
command! OpenTempFile :edit `=tempname()`
cnoremap <expr> <C-X>dt strftime('%Y%m%d')
cnoremap <expr> <C-X>ts strftime('%Y%m%d%H%M')
" Vim technique bible 4-16
nnoremap <ESC><ESC> :nohlsearch<CR>
" Vim technique bible 5-10
vnoremap < <gv
vnoremap > >gv

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
" msysGit
if executable($ProgramFiles . '\Git\bin\git.exe')
    let g:VCSCommandGitExec= $ProgramFiles . '\Git\bin\git.exe'
endif
" TortoiseHg for Windows
if executable($ProgramFiles . '\TortoiseHg\hg.exe') && executable($ProgramFiles . '\TortoiseHg\bin\hg.cmd')
    let g:VCSCommandHGExec= $ProgramFiles . '\TortoiseHg\hg.exe'
endif
let $HGENCODING=&encoding
command! -bar -nargs=1 Setenc set enc=<args> | let $HGENCODING='<args>'

" GetScript
let g:GetLatestVimScripts_wget='curl'

" ChangeLog
" let g:changelog_timeformat='%c'
let g:changelog_username=$username

" zen-coding
" http://www.vim.org/scripts/script.php?script_id=2981
let g:user_zen_settings = {'lang':'ja'}

" TwitVim
" http://www.vim.org/scripts/script.php?script_id=2204
let g:twitvim_count = 100
if has('win32')
    if executable($ProgramFiles . '\Opera\opera.exe')
        let g:twitvim_browser_cmd = $ProgramFiles . '\Opera\opera.exe'
    elseif executable($ProgramFiles . '\Mozilla Firefox\firefox.exe')
        let g:twitvim_browser_cmd = $ProgramFiles . '\Mozilla Firefox\firefox.exe'
    else
        let g:twitvim_browser_cmd = $ProgramFiles . '\Internet Explorer\iexplore.exe'
    endif
endif

" skk
" http://www.vim.org/scripts/script.php?script_id=3118
if filereadable( expand( "~/vimfiles/dict/SKK-JISYO.L" ) )
    let g:skk_large_jisyo = "~/vimfiles/dict/SKK-JISYO.L"
endif
" if filereadable("//VBOXSVR/twada/.skk-jisyo")
"    let g:skk_jisyo = "//VBOXSVR/twada/.skk-jisyo"
"endif
let g:skk_show_annotation=1
let g:skk_egg_like_newline=1

" diffchanges.vim
" http://www.vim.org/scripts/script.php?script_id=2158
let g:diffchanges_patch_cmd = 'diff -ubB'

" taglist.vim
" http://www.vim.org/scripts/script.php?script_id=273
let g:tlist_esqlc_settings = 'c;d:macro;g:enum;s:struct;u:union;t:typedef;' .
                           \ 'v:variable;f:function'

" autofmt
" http://www.vim.org/scripts/script.php?script_id=1939
set formatexpr=autofmt#compat#formatexpr()

" calendar.vim
" http://www.vim.org/scripts/script.php?script_id=52
if !exists("g:calendar_diary")
    if isdirectory(expand("~/Dropbox/Dillinger/diary"))
        let g:calendar_diary = "~/Dropbox/Dillinger/diary"
    elseif isdirectory(expand("~/Documents/diary"))
        let g:calendar_diary = "~/Documents/diary"
    endif
endif

" previm
let g:previm_enable_realtime = 1

" https://github.com/othree/javascript-libraries-syntax.vim
autocmd BufReadPre *.js     let b:javascript_lib_use_angularjs = 1
autocmd BufReadPre *.htm    let b:javascript_lib_use_angularjs = 1
autocmd BufReadPre *.html   let b:javascript_lib_use_angularjs = 1
autocmd BufReadPre *.js     let b:javascript_lib_use_angularui = 1
autocmd BufReadPre *.htm    let b:javascript_lib_use_angularui = 1
autocmd BufReadPre *.html   let b:javascript_lib_use_angularui = 1
autocmd BufReadPre *.js     let b:javascript_lib_use_angularuirouter = 1
autocmd BufReadPre *.htm    let b:javascript_lib_use_angularuirouter = 1
autocmd BufReadPre *.html   let b:javascript_lib_use_angularuirouter = 1
autocmd BufReadPre *.js     let b:javascript_lib_use_jasmine = 1
autocmd BufReadPre *.js     let b:javascript_lib_use_chai = 1

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0 " recomemnded 1, default 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_typescript_checkers = ["tslint"]
if filereadable("~/dotfiles/.mdlrc")
    let g:syntastic_markdown_mdl_args="-c ~/dotfiles/.mdlrc"
endif

" set vim-airline
let g:airline_theme='light'

if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
    \	if &omnifunc == "" |
    \		setlocal omnifunc=syntaxcomplete#Complete |
    \	endif
endif

" Gitv
let g:Gitv_OpenHorizontal='auto'

" agit
let g:agit_ignore_spaces=0

" EditorConfig
if has('python')
    let g:EditorConfig_core_mode='python_external'
endif
if has('win32')
    let g:EditorConfig_exclude_patterns = ['[^\x01-\x7e]']
endif

" Tabular
command! -range TextileTabularize <line1>,<line2>Tabularize /|\([^.|]*\.\)\=\(\s\|$\)

" junegunn/vim-emoji: Emoji in Vim https://github.com/junegunn/vim-emoji
set completefunc=emoji#complete
command! -range Emoji <line1>,<line2>s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g

" NeoComplete
let g:neocomplete#enable_at_startup = 1

colorscheme desert

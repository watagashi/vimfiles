scriptencoding utf-8

" vim: set ts=4 sw=4 et ff=unix fenc=utf-8:

let s:vimfiles = isdirectory(expand('~/vimfiles'))
            \ ? expand('~/vimfiles') : expand('~/.vim')

source <sfile>_kaoriya.vim

if has('win32')
    if $HOME=='' && has('win32')
        let $HOME=$USERPROFILE
    endif
    let s:pg = $ProgramFiles
endif

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let s:plugvim = s:vimfiles . '/autoload/plug.vim'
if empty(glob(s:plugvim))
    execute 'silent !curl -fLo ' . s:plugvim . ' --create-dirs '
                \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if !empty(glob(s:plugvim))
    let g:plug_threads = 8

    call plug#begin(s:vimfiles . '/plugged')

    Plug 'Chiel92/vim-autoformat'
    Plug 'jason0x43/vim-js-indent'
    Plug 'PProvost/vim-ps1'
    Plug 'Quramy/tsuquyomi'
    Plug 'Shougo/neocomplete.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'Shougo/neosnippet.vim'
    Plug 'burnettk/vim-angular'
    Plug 'chrisbra/csv.vim'
    Plug 'chrisbra/unicode.vim'
    Plug 'cohama/agit.vim'
    Plug 'digitaltoad/vim-jade'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'elzr/vim-json'
    Plug 'embear/vim-localvimrc'
    " Plug 'gabrielelana/vim-markdown'
    Plug 'gko/vim-coloresque'
    Plug 'godlygeek/tabular'
    Plug 'gregsexton/gitv'
    Plug 'jelera/vim-javascript-syntax'
    Plug 'jmcantrell/vim-diffchanges'
    Plug 'jparise/vim-graphql'
    Plug 'junegunn/vim-emoji'
    Plug 'junegunn/vader.vim'
    Plug 'kannokanno/previm'
    Plug 'kchmck/vim-coffee-script'
    Plug 'leafgarland/typescript-vim'
    Plug 'ludovicchabant/vim-lawrencium'
    Plug 'mattn/calendar-vim'
    Plug 'mattn/emmet-vim'
    Plug 'mhinz/vim-signify'
    Plug 'nathanaelkane/vim-indent-guides'
    if (has('patch-8.1.1719'))
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
    endif
    Plug 'plasticboy/vim-markdown'
    Plug 'rhysd/git-messenger.vim'
    Plug 'rkitover/vimpager'
    Plug 'sbdchd/neoformat'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-rhubarb'
    " Plug 'ternjs/tern_for_vim', { 'do': 'yarn --no-progress \|\| npm i' }
    Plug 'timcharper/textile.vim'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-fugitive'
    " Plug 'tpope/vim-markdown'
    Plug 'tyru/open-browser.vim'
    Plug 'tyru/skkdict.vim/'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    if !has('kaoriya')
        Plug 'vim-jp/vimdoc-ja'
    endif
    Plug 'prettier/vim-prettier'
    Plug 'vim-scripts/SyntaxComplete'
    Plug 'vim-scripts/Tail-Bundle'
    " Plug 'vim-syntastic/syntastic'
    Plug 'twitvim/twitvim'
    Plug 'vim-scripts/loremipsum'
    Plug 'vim-scripts/taglist.vim'
    Plug 'vim-scripts/vcscommand.vim'
    Plug 'w0rp/ale'
    Plug 'wavded/vim-stylus'

    " skk
    " if filereadable("//VBOXSVR/twada/.skk-jisyo")
    "    let g:skk_jisyo = "//VBOXSVR/twada/.skk-jisyo"
    " else
    if filereadable(s:vimfiles . '/dict/SKK-JISYO.L') && !isdirectory($APPDATA . '/CorvusSKK')
        Plug 'tyru/skk.vim/'
        if !exists('g:skk_large_jisyo')
            let g:skk_large_jisyo = s:vimfiles . '/dict/SKK-JISYO.L'
        endif
        let g:skk_show_annotation=1
        let g:skk_egg_like_newline=1
    endif

    call plug#end()

    command! -bar -nargs=0 PlugUp PlugUpgrade | PlugUpdate

elseif filereadable(s:vimfiles . '/bundle/vim-pathogen/autoload/pathogen.vim')
    execute 'source ' . s:vimfiles . '/bundle/vim-pathogen/autoload/pathogen.vim'
    execute pathogen#infect()
    set sessionoptions-=options
endif

if $TERM == 'cygwin'
    set term=builtin_pcansi
    set encoding=cp932
endif

if exists('$TEMP')
    set directory=$TEMP
    set undodir=$TEMP
elseif exists('$TMPDIR')
    set directory=$TMPDIR
    set undodir=$TMPDIR
elseif exists('$TMP')
    set directory=$TMP
    set undodir=$TMP
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
if (v:version == 703 && has('patch72')) || v:version > 703
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
"
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" See
"   :help color-xterm
if &term =~ 'xterm' && &t_Co<2
    if has('terminfo')
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
"

" Countermeasure of failure when deciphering file
if has('win32')
    " TODO
    " set fileencodings....
else
    set fileencodings-=latin1
endif

if has('autocmd')
    autocmd FileType text setlocal textwidth=78 expandtab tabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead .{textlint,jshint,eslint,jscs,jsbeautify}rc setf json
endif

command! -bar -nargs=0 Nodiff setlocal diff< scrollbind< wrap< foldmethod< foldcolumn& cursorbind< | norm zE
command! -bar -nargs=0 PrintFileInfo echo strftime( '%c' ,getftime( expand( '%' ) ) ) . " " . getfsize( expand( '%' ) ) . " Bytes"
command! -bar -nargs=0 Izon runtime macros/izon.vim
command! -bar -nargs=0 Dakuten runtime macros/kanasoundmark.vim
command! -bar -nargs=0 Vime execute 'source ' . s:vimfiles . '/macros/vime2.vim'
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
command! -bar -nargs=0 Aquote silent! 1,5s/^ \n-- $/\r-- / | /^[^>].*> を書き込みました:/+2,$Quote | execute "normal 3\<c-o>"

command! -bar -nargs=1 Settabs setl ts=<args> sw=<args> et

command! -bar -nargs=0 Fold setl fdm=syntax fdc=12
command! -bar -nargs=0 NoFold setl fdm& fdc&
command! -bar -nargs=0 Cfold syntax region	cBlock	start="{" end="}" transparent fold | Fold

command! -bar -nargs=0 Ypath let @*=expand('%:p')
if has('win32')
    if exists('$JAVA_HOME')
        execute 'command! -bar -nargs=? -range=% Jn2a <line1>,<line2>!"' . $JAVA_HOME . '\bin\native2ascii.exe" <args>'
    else
        execute 'command! -bar -nargs=? -range=% Jn2a <line1>,<line2>!"' . s:pg . '\java\jdk1.6.0_24\bin\native2ascii.exe" <args>'
    endif
endif

command! -bar -range=% Diffnodate <line1>,<line2>s/^\(--- \|+++ \)\f\+\zs.\+//

command! -bar -nargs=1 G1log r!git log --oneline --reverse <args>.. | perl -pe 's/^[0-9a-f]+ /* /'

" URL optimizer for Amazon.co.jp
command! -range Samz <line1>,<line2>s/\(https\=:\/\/www\.amazon\.co\.jp\)\%(\/.*\)\=\(\/dp\/\w\+\)\%(\/\S\+\)\=\%(?\S\+\)\=/\1\2

command! -nargs=? SudoW w !sudo tee % > /dev/null

" Vim technique bible 3-14
nnoremap * *N
nnoremap # #N
" Vim technique bible 4-1
command! OpenTempFile :edit `=tempname()`
cnoremap <expr> <C-T>d strftime('%Y%m%d')
cnoremap <expr> <C-T>t strftime('%Y%m%d%H%M')
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

inoremap <F2> <C-R>=strftime("%c")<CR>
inoremap <S-F2> <C-R>=strftime('%Y%m%d%H%M')<CR>
nnoremap QQ gqgq
let g:format_join_spaces=1

let g:autodate_keyword_pre='\cLast Modified\s*:\s*'
let g:html_use_css = 1

" File Explorer
let g:explDetailedList=1
let g:explDateFormat='%x %X'
let g:netrw_fastbrowse=2

" vcscommand
" http://www.vim.org/scripts/script.php?script_id=90
if v:version < 700
    let g:VCSCommandDisableAll = 1
endif
let g:CVSCommandDiffOpt='bBu'
let g:VCSCommandCVSDiffOpt='bBu'
if has('win32')
    " msysGit
    if executable(s:pg . '\Git\bin\git.exe')
        let g:VCSCommandGitExec= s:pg . '\Git\bin\git.exe'
    endif
    " TortoiseHg for Windows
    if executable(s:pg . '\TortoiseHg\hg.exe')
        let g:VCSCommandHGExec= s:pg . '\TortoiseHg\hg.exe'
    endif
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
"     let g:twitvim_enable_python = !empty(globpath(substitute($PATH, '\\\=;', ',', 'g'), 'python.exe', 0, 1))
" elseif has('unix')
"     let g:twitvim_enable_python = !empty(globpath(substitute($PATH, ':', ',', 'g'), 'python', 0, 1))
elseif has('macunix')
    let g:twitvim_enable_python = 1
endif
if exists('$HTTP_PROXY')
    let s:proxy_url_pattern =
                \ '^\%(\([^:]*\):\/\/\)\='
                \ . '\%(\([^:@]*\)\(:[^@]*\)\=@\)\='
                \ . '\([^:]*\)\%(:\(\d*\)\)\=/\=$'
    let g:twitvim_proxy = substitute($HTTP_PROXY,
                \ s:proxy_url_pattern, '\4:\5', '')
    let s:proxy_login = substitute($HTTP_PROXY,
                \ s:proxy_url_pattern, '\2', '')
    let s:proxy_pass = substitute($HTTP_PROXY,
                \ s:proxy_url_pattern, '\3', '')
    let g:twitvim_proxy_login = substitute(s:proxy_login . s:proxy_pass,
                \ '%40', '@', 'g')
endif
if has('win32')
    let g:twitvim_browser_cmd = s:pg . '\Vivaldi\Application\vivaldi.exe'
    if !executable(g:twitvim_browser_cmd)
        let g:twitvim_browser_cmd = s:pg . '\Opera\opera.exe'
    endif
    if !executable(g:twitvim_browser_cmd)
        let g:twitvim_browser_cmd = s:pg . '\Mozilla Firefox\firefox.exe'
    endif
    if !executable(g:twitvim_browser_cmd)
        let g:twitvim_browser_cmd = s:pg . '\Internet Explorer\iexplore.exe'
    endif
elseif has('macunix')
    let twitvim_browser_cmd = 'open'
endif

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

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
if !exists('g:calendar_diary')
    if isdirectory(expand('~/Documents/diary'))
        let g:calendar_diary = '~/Documents/diary'
    elseif isdirectory(expand('~/Dropbox/Dillinger/diary'))
        let g:calendar_diary = '~/Dropbox/Dillinger/diary'
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
autocmd BufReadPre *.ts     let b:javascript_lib_use_jasmine = 1
autocmd BufReadPre *.js     let b:javascript_lib_use_chai = 1

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

" set vim-airline
let g:airline_theme='light'

if has('autocmd') && exists('+omnifunc')
autocmd Filetype *
    \	if &omnifunc == "" |
    \		setlocal omnifunc=syntaxcomplete#Complete |
    \	endif
endif

" Gitv
let g:Gitv_OpenHorizontal='auto'

" agit
" let g:agit_ignore_spaces=0

" EditorConfig
if has('win32')
    let g:EditorConfig_exclude_patterns = ['[^\x01-\x7e]']
endif

" Tabular
command! -range TextileTabularize <line1>,<line2>Tabularize /|\([^.|]*\.\)\=\(\s\|$\)

" junegunn/vim-emoji: Emoji in Vim https://github.com/junegunn/vim-emoji
set completefunc=emoji#complete
command! -range Emoji <line1>,<line2>s/:\([0-9A-Za-z_+-]\+\):/\=emoji#for(submatch(1), submatch(0))/g

" NeoComplete
"let g:neocomplete#enable_at_startup = 1

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

" vim-json
let g:vim_json_syntax_conceal = 0
"
" ale
" let g:ale_lint_on_enter = 0
let g:ale_completion_enabled = 1
let g:ale_completion_delay = 500

if (has('patch-8.1.1719'))
    source <sfile>_coc.vim
endif

colorscheme desert

scriptencoding utf-8 " vim:set ts=8 sts=2 sw=2 tw=0 ff=unix fenc=utf-8:

" vcscommand
" http://www.vim.org/scripts/script.php?script_id=90
if v:version < 700
    let g:VCSCommandDisableAll = 1
endif
let g:CVSCommandDiffOpt='bBu'
let g:VCSCommandCVSDiffOpt='bBu'
if has('win32')
    " msysGit
    if executable($ProgramFiles .. '\Git\bin\git.exe')
        let g:VCSCommandGitExec= $ProgramFiles .. '\Git\bin\git.exe'
    endif
    " TortoiseHg for Windows
    if executable($ProgramFiles .. '\TortoiseHg\hg.exe')
        let g:VCSCommandHGExec= $ProgramFiles .. '\TortoiseHg\hg.exe'
    endif
endif
let $HGENCODING=&encoding
command! -bar -nargs=1 Setenc set enc=<args> | let $HGENCODING='<args>'

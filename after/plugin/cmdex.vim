" vim: set ts=4 sw=4 et:
"
" Windows 環境で数値から始まるディレクトリ名への対応
" ルートディレクトリへの対応

if !exists('+shellslash')
    finish
endif

if &ssl
    cnoremap <C-X> <C-R>=<SID>GetBufferDirectory()<CR>/
else
    cnoremap <C-X> <C-R>=<SID>GetBufferDirectory()<CR>\
endif

function! s:GetBufferDirectory()
    let path = expand('%:p:h')
    let path = ReplaceMagicToNoMagic(path)
    let cwd = getcwd()
    let cwd = ReplaceMagicToNoMagic(cwd)
    if match(path, cwd) != 0 || match(path, '\\\\') == 0 || match(path, '//') == 0
        let path = ReplaceNoMagicToMagic(path)
        return path
        return path
    elseif strlen(path) > strlen(cwd)
        let path = ReplaceNoMagicToMagic(path)
        let cwd = ReplaceNoMagicToMagic(cwd)
        if !&ssl && match(cwd, '\\$') == strlen(cwd) - 1 " root directory
            return strpart(path, strlen(cwd) - 1)
        elseif &ssl && match(cwd, '/$') == strlen(cwd) - 1 " root directory
            return strpart(path, strlen(cwd) - 1)
        endif
        return strpart(path, strlen(cwd) + 1)
    else
        return '.'
    endif
endfunction

function ReplaceMagicToNoMagic(exp)
    let result = a:exp
    if !&ssl
        let result = substitute(result, '\\', '/', 'g')
    endif
    let result = substitute(result, '\~', '\\\~', 'g')
    return result
endfunction

function ReplaceNoMagicToMagic(exp)
    let result = a:exp
    let result = substitute(result, '\\\~', '~', 'g')
    if !&ssl
        let result = substitute(result, '/', '\\', 'g')
    endif
    return result
endfunction


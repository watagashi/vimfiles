scriptencoding utf-8 " vim:set ts=8 sts=2 sw=2 tw=0 ff=unix fenc=utf-8:

" TwitVim
" http://www.vim.org/scripts/script.php?script_id=2204
let g:twitvim_count = 100
if has('win32')
"   let g:twitvim_enable_python = !empty(globpath(substitute($PATH, '\\\=;', ',', 'g'), 'python.exe', 0, 1))
" elseif has('unix')
"   let g:twitvim_enable_python = !empty(globpath(substitute($PATH, ':', ',', 'g'), 'python', 0, 1))
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
  let g:twitvim_browser_cmd = $ProgramFiles .. '\Vivaldi\Application\vivaldi.exe'
  if !executable(g:twitvim_browser_cmd)
    let g:twitvim_browser_cmd = $ProgramFiles .. '\Opera\opera.exe'
  endif
  if !executable(g:twitvim_browser_cmd)
    let g:twitvim_browser_cmd = $ProgramFiles .. '\Mozilla Firefox\firefox.exe'
  endif
  if !executable(g:twitvim_browser_cmd)
    let g:twitvim_browser_cmd = $ProgramFiles .. '\Internet Explorer\iexplore.exe'
  endif
elseif has('macunix')
  let twitvim_browser_cmd = 'open'
endif

scriptencoding utf-8 " vim:set ts=8 sts=2 sw=2 tw=0 ff=unix fenc=utf-8:

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

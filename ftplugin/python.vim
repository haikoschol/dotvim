setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal smarttab
setlocal expandtab
setlocal nosmartindent

function! RunDjangoAppTests()
    let module_name = split(expand('%'), '/')[0]
    execute(":wa")
    execute(":!clear && echo Running tests in " . module_name . " && python manage.py test " . module_name)
endfunction

function! RunPylint()
   let basecmd = "pylint -f parseable -r n "
   let path = expand('%')
   if path =~ "tests.py$"
       let basecmd = basecmd . " -d C0103 -d C0301 -d R0902 -d R0903 -d R0904 "
   endif
   let cmd = basecmd . path . " | egrep -v \"Class '\\w+' has no 'objects' member\""
   execute(":wa")
   execute(":!clear && " . cmd)
endfunction

" run current file with python
nmap <C-r> :w<CR>:!clear && /usr/bin/env python %<CR>

" run tests in django app of current file
nmap <C-t> :call RunDjangoAppTests()<CR>

" run current file through pylint
nmap <f4> :call RunPylint()<CR>


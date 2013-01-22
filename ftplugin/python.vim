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

" run current file with python
nmap <C-r> :w<CR>:!clear && python %<CR>

" run tests in django app of current file
nmap <C-t> :call RunDjangoAppTests()<CR>

" run current file through pylint
nmap <f4> :wa<CR>:!clear && pylint %<CR>


setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal smarttab
setlocal expandtab
setlocal nosmartindent

" run current file with python
nmap <C-r> :w<CR>:!clear && python %<CR>

" run python unit tests
nmap <C-t> <leader>t


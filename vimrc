set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" original repos on github
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'fatih/vim-go'

" vim-scripts repos
Bundle 'python.vim'
Bundle 'YankRing.vim'

filetype plugin indent on

if has('gui_running')
    set guicursor=a:blinkon0
    set guioptions-=T
    set gfn=Consolas:h14
endif

if has('statusline')
    set laststatus=2
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
  
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

set relativenumber
set showcmd
set backspace=indent,eol,start 
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.pyc,node_modules/*
set whichwrap=b,s,h,l,<,>,[,]
set scrolljump=5
set scrolloff=5
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set wrap
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set encoding=utf-8
set noswapfile
set nobackup
set nowritebackup
set mouse=a
syntax on
scriptencoding utf-8
set background=light
color Tomorrow

" mappings
let mapleader = ','
nnoremap ; :
nmap <silent> <leader>/ :nohlsearch<CR>
cmap cwd lcd %:p:h

" make json readable
noremap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>

" toggle absolute and relative line numbers
noremap <leader>ln :call NumberToggle()<cr>

" replace the current selection with the output of running it through python
vnoremap <f5> :!python<CR>

" filetypes
au BufRead,BufNewFile *.coffee  set ft=coffee
au BufRead,BufNewFile *.{twig}  set ft=htmljinja
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile *.json set ft=javascript
au FileType rst setl textwidth=80
au FileType make setl noexpandtab
au FileType html setl shiftwidth=2 softtabstop=2 tabstop=2 expandtab
au FileType ruby setl shiftwidth=2 softtabstop=2 tabstop=2 expandtab
au FileType eruby setl shiftwidth=2 softtabstop=2 tabstop=2 expandtab
au FileType javascript setl shiftwidth=2 softtabstop=2 shiftwidth=2 tabstop=2 expandtab
au FileType coffee setl shiftwidth=2 softtabstop=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType go autocmd BufWritePre <buffer> Fmt

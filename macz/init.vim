syntax on
filetype plugin indent on

set background=dark
set termguicolors
colorscheme vim

augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight LineNr guifg=#808080
    autocmd ColorScheme * highlight CursorLineNr gui=bold guifg=#ffffff guibg=#000000
augroup END

highlight LineNr guifg=#808080
highlight CursorLineNr gui=bold guifg=#ffffff guibg=#000000

set number
set showmatch

set tabstop=4
set shiftwidth=4
set expandtab
set cindent

set laststatus=2
set statusline=%f\ %y\ %m\ %=%l:%c
set statusline+=\ [%{searchcount().current}/%{searchcount().total}]
nnoremap <silent> <CR> :nohlsearch<CR><CR>

set hlsearch
set incsearch

set cursorline
set cursorlineopt=number
"set guicursor=n-v-c-i-r:block
"set guicursor=n-v-c:block,i:block-blinkon200,r:block
set guicursor=n-v-c:block,i:block-blinkon200-blinkoff150-blinkwait150,r:block
"highlight LineNr ctermfg=Grey
"highlight CursorLineNr cterm=bold ctermfg=White ctermbg=Black

function! SetCursorColor(color)
    call chansend(v:stderr, "\033]12;" . a:color . "\007")
endfunction

augroup CursorColor
    autocmd!
    autocmd VimEnter * call SetCursorColor("white")
    autocmd InsertEnter * call SetCursorColor("gray")
    autocmd InsertLeave * call SetCursorColor("white")
augroup END

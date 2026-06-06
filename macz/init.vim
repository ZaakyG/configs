syntax on
filetype plugin indent on

" Run automatic mode select
autocmd VimEnter * call SetBackgroundFromOS()

"set background=dark
set termguicolors
colorscheme default

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
set guicursor=n-v-c:block,i:block-blinkon200-blinkoff150-blinkwait150,r:block

function! SetCursorColor(color)
    call chansend(v:stderr, "\033]12;" . a:color . "\007")
endfunction

augroup CursorColor
    autocmd!
    autocmd VimEnter * call SetCursorColor("white")
    autocmd InsertEnter * call SetCursorColor("gray")
    autocmd InsertLeave * call SetCursorColor("white")
augroup END

function! SetBackgroundFromOS()
    let l:mode = system("defaults read -g AppleInterfaceStyle 2>/dev/null")
    if l:mode =~? "Dark"
        set background=dark
    else
        set background=light
    endif
endfunction

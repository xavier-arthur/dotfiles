" (minimal)
"     _   __         _    ___
"    / | / /__  ____| |  / (_)___ ___
"   /  |/ / _ \/ __ \ | / / / __ `__ \
"  / /|  /  __/ /_/ / |/ / / / / / / /
" /_/ |_/\___/\____/|___/_/_/ /_/ /_/

    ".VimPlug autosetup
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    call plug#begin('~/.config/nvim/plugged')

        Plug 'tpope/vim-commentary'
        Plug 'sheerun/vim-polyglot'

    call plug#end()

    " Tweaks
    filetype plugin on
    filetype indent on
    set foldmethod=indent
    set foldlevel=99
    set autoindent
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set textwidth=80
    set relativenumber
    set number
    set ruler
    set nohlsearch

    " Maps and remaps
    noremap <C-p> ^
    vnoremap <C-p> ^
    inoremap {{ {<Cr>}<Esc>ko
    let mapleader = ','
    noremap <Leader>wq :wq<Cr>
    noremap <Leader>wa :wa<Cr>
    noremap <Leader>qq :q!<Cr>
    noremap <Leader>qa :qa!<Cr>
    noremap <Leader>ww :w<Cr>
    noremap <Leader>j A<Cr><Esc>
    noremap <Leader>k I<Cr><Esc>
    noremap <Leader>gg :vimgrep  %<Left><Left>
    noremap <Leader>n :cnext<Cr>
    noremap <Leader>lt :tabnew<Cr>:e ~/
    noremap <Leader>tn :tabnew<Space>
    noremap <Leader>sc :silent<Space>!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd BufWritePre * %s/\s\+$//e
    vnoremap " "-c""<Esc>"-Pe
    let g:indentLine_setColors = 1

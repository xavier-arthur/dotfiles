"     _   __         _    ___
"    / | / /__  ____| |  / (_)___ ___
"   /  |/ / _ \/ __ \ | / / / __ `__ \
"  / /|  /  __/ /_/ / |/ / / / / / / /
" /_/ |_/\___/\____/|___/_/_/ /_/ /_/

    ".VimPlug autosetup
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        au! VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    call plug#begin('~/.config/nvim/plugged')

        Plug 'dracula/vim', { 'as': 'dracula' }
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'Yggdroot/indentLine'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-surround'
        Plug 'uiiaoo/java-syntax.vim'
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
        Plug 'neoclide/coc.nvim'
        Plug 'Shougo/echodoc.vim'
        Plug 'tpope/vim-commentary'
        Plug 'sheerun/vim-polyglot'
        Plug 'ryanoasis/vim-devicons'
        Plug 'junegunn/vim-easy-align'
        Plug 'mcchrish/nnn.vim'

    call plug#end()

    " Tweaks
    set spelllang=pt
    " set spell
    " setlocal spell
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
    set hidden

    " Maps and remaps
    cnoreabbrev date r !date<Cr>
    noremap <C-p> ^
    vnoremap <C-p> ^
    " copy from system clipboard
    vnoremap <C-c> "+y
    " paste from system clipboard
    map <C-b> "+p
    " quick brackets
    inoremap {{ {<Cr>}<Esc>ko

    " remaps control + backspace to C-w, this may change depending on the
    " terminal emulator
    inoremap  <C-w>

    vnoremap "" "-c""<Esc>"-Pe

    let mapleader = ','
    noremap <Leader>wq :wq<Cr>
    " &-> saves and quit current buffer

    noremap <Leader>ss :set spell<Cr>
    " &-> enables spellcheck

    noremap <Leader>n :Np<Cr>
    " &-> opens nnn

    noremap <Leader>wa :wa<Cr>
    " &-> saves all buffers

    noremap <Leader>qq :q!<Cr>
    " &-> quits current buffer

    noremap <Leader>qa :qa!<Cr>
    " &-> quits all buffers without saving

    noremap <Leader>ww :w<Cr>
    " &-> saves current buffer

    noremap <Leader>j A<Cr><Esc>
    " &-> adds a blank line below

    noremap <Leader>k I<Cr><Esc>k
    " &-> adds a blank line above

    noremap <Leader>gg :vimgrep  %<Left><Left>
    " &-> vimgreps

    noremap <Leader>n :cnext<Cr>
    " &-> next error, generally used for vimgrep

    noremap <Leader>lt :tabnew<Cr>:e ~/
    " &-> opens a new blank buffer with ~/

    noremap <Leader>tn :tabnew<Space>
    " &-> opens a new blank buffer

    noremap <Leader>sc :silent<Space>!
    " &-> runs silently shell command (buffer cannot bet modfied whilist)

    " General autocommands
    au! VimEnter setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    au! BufWrite * %s/\s\+$//e

    " colorscheme
    syntax on
    set termguicolors

    colorscheme dracula
    augroup dracula_customization
    au!
        let g:dracula_italic = 1
        let g:dracula_bold = 1
        let g:dracula_underline = 1
        let g:dracula_undercurl = 1
    augroup end
    let g:airline_powerline_fonts = 1

    " Indent-line
    let g:indentLine_setColors = 1

    " ulti-snippets
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-x>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    " EchoDoc
    let g:echodoc#enable_at_startup = 1
    " &-> lauch echodoc at startup

    let g:echodoc#type = 'floating'
    highlight link EchoDocFloat Pmenu
    " &-> uses neovim's float mode

    " LaTeX general
    augroup tex
        au! FileType tex inoremap \bb \textbf{
        au! FileType tex nmap #! :w<Cr><Esc>:!clear<Cr><Esc>:!xelatex %<Cr>
    augroup END

    " Java general
    augroup java
        au! FileType java nmap #! i
        \class replace<CR>{<CR>public static void
        \ main(String[] args)<CR>{<CR><CR>}<CR>}<Esc>gg/replace<CR>cw
    augroup END

    " Python general
    augroup python
        au! FileType python nmap #! i#!/usr/bin/env python3<Enter><Enter><Esc>cc
        au! FileType python nmap ## :w<Cr> :!clear && pylint %<Cr>
        au! VimLeave *.py :!chmod +x %
    augroup END

    " Scripts general
    augroup sh
        au! FileType sh nmap #! i#!/bin/sh<Cr><Cr><Esc>
        au! FileType sh nmap ## :w<Cr> :!clear && shellcheck %<Cr>
        au! VimLeave *.sh :!chmod +x %
    augroup END

    " Rust general
    augroup rs
        au! FileType rust nmap ## :!cargo run<Cr>
    augroup END

    " Markdown general
    augroup md
        au! FileType markdown nmap <Leader>n /\[.*\]<Cr>
        au! FileType markdown nmap <Leader>p ?\[.*\]<Cr>
        au! FileType markdown nmap <Leader>c a ✔<Esc>
        au! FileType markdown nmap <Leader>x a ✖<Esc>
        au! FileType markdown cnoreabbrev cbox s/$/\ [ \]
    augroup END

    " COCK.nvim
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " HTML
    augroup HTML
        au! FileType html nmap ## :silent !xdg-open %<Cr>
    augroup END

    " easy allign
    nmap ga <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)

    " nnn
    let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

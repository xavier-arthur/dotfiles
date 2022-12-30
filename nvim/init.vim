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

		" snippets
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'

        Plug 'neoclide/coc.nvim'
        Plug 'tpope/vim-commentary'
        Plug 'sheerun/vim-polyglot'
        Plug 'junegunn/vim-easy-align'
        Plug 'preservim/nerdtree'
        Plug 'joshdick/onedark.vim'
        Plug 'mhinz/vim-startify'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'dandavison/delta'
        " Plug 'uiiaoo/java-syntax.vim'
        " Plug 'ryanoasis/vim-devicons'
        " Plug 'Shougo/echodoc.vim'
        " Plug 'mcchrish/nnn.vim'
        " Plug 'nvim-lua/plenary.nvim'
        " Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
        " Plug 'jayli/vim-easycomplete'

    call plug#end()

    " Tweaks
    set spelllang=pt
    " set spell
    " setlocal spell
    filetype plugin on
    filetype indent on
    set smartcase
    set ignorecase
    set foldmethod=indent
    set foldlevel=99
    set autoindent
    " set expandtab
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

    " noremap <Leader>n :Np<Cr>
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

    colorscheme onedark
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

    " EchoDoc
    " let g:echodoc#enable_at_startup = 1
    " &-> lauch echodoc at startup

    " let g:echodoc#type = 'floating'
    " highlight link EchoDocFloat Pmenu
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
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

	" Use <c-space> to trigger completion
	if has('nvim')
	  inoremap <silent><expr> <c-space> coc#refresh()
	else
	  inoremap <silent><expr> <c-@> coc#refresh()
	endif

    " HTML
    augroup HTML
        au! FileType html nmap ## :silent !xdg-open %<Cr>
    augroup END

    " easy allign
    nmap ga <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)

    " FZF
    " nmap <C-p> :GFiles<Cr>
	nnoremap <silent> <C-p> :if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) == winnr() <Bar> wincmd p <Bar> endif <Bar> GFiles<CR>

    " nerdtree
	" tree width
    let NERDTreeWinSize = 25

	" auto open nerdtree
    autocmd VimEnter * NERDTree | wincmd p

    noremap <Leader>n :NERDTree<Cr>

    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
    autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

    " Close the tab if NERDTree is the only window remaining in it.
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

    " startify
    let g:startify_custom_header = [
        \ '   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆                                                                          ' ,
        \ '    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦                                                                       ' ,
        \ '          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄                                                                     ' ,
        \ '           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄                                                                    ' ,
        \ '          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀                                                                   ' ,
        \ '   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄   _____  _   _  _____  _              _                          ' ,
        \ '  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   |  ___|| | | ||_   _|| |            (_)                         ' ,
        \ ' ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  | |__  | | | |  | |  | |     __   __ _  _ __ ___                ' ,
        \ ' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ |  __| | | | |  | |  | |     \ \ / /| || |_ \ _ \               ' ,
        \ '      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     | |___ \ \_/ / _| |_ | |____ _\ V / | || | | | | |              ' ,
        \ '       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     \____/  \___/  \___/ \_____/(_)\_/  |_||_| |_| |_|              ' ,
        \ ]
    if has('nvim')
      autocmd TabNewEntered * Startify
    else
      autocmd BufWinEnter *
            \ if !exists('t:startify_new_tab')
            \     && empty(expand('%'))
            \     && empty(&l:buftype)
            \     && &l:modifiable |
            \   let t:startify_new_tab = 1 |
            \   Startify |
            \ endif
    endif

	" ultisnips
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-x>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

	if has('nvim-0.4.0') || has('patch-8.2.0750')
	  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	endif

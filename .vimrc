if version >= 700

"------ Meta ------"

" clear all autocommands! (this comment must be on its own line)
autocmd!

set nocompatible                " break away from old vi compatibility
set fileformats=unix,dos,mac    " support all three newline formats
set viminfo=                    " don't use or save viminfo files

"------ Console UI & Text display ------"

set cmdheight=1                 " explicitly set the height of the command line
set showcmd                     " Show (partial) command in status line.
set number                      " yay line numbers
set ruler                       " show current position at bottom
set noerrorbells                " don't whine
set visualbell t_vb=            " and don't make faces
set lazyredraw                  " don't redraw while in macros
set scrolloff=5                 " keep at least 5 lines around the cursor
set wrap                        " soft wrap long lines
set list                        " show invisible characters
set listchars=tab:>·,trail:·    " but only show tabs and trailing whitespace
set report=0                    " report back on all changes
set shortmess=atI               " shorten messages and don't show intro
set wildmenu                    " turn on wild menu :e <Tab>
set wildmode=list:longest       " set wildmenu to list choice
if has('syntax')
    syntax on
    " Remember that rxvt-unicode has 88 colors by default; enable this only if
    " you are using the 256-color patch
    if &term == 'rxvt-unicode'
        set t_Co=256
    endif

    if &t_Co == 256
        colorscheme xoria256
    else
        colorscheme guardian
    endif
endif

"------ Text editing and searching behavior ------"

set hlsearch                  " turn off highlighting for searched expressions
set incsearch                   " highlight as we search however
set matchtime=5                 " blink matching chars for .x seconds
set mouse=a                     " try to use a mouse in the console (wimp!)
set ignorecase                  " set case insensitivity
set smartcase                   " unless there's a capital letter
set completeopt=menu,longest,preview " more autocomplete <Ctrl>-P options
set nostartofline               " leave my cursor position alone!
set backspace=2                 " equiv to :set backspace=indent,eol,start
set textwidth=80                " we like 80 columns
set showmatch                   " show matching brackets
set formatoptions=tcrql         " t - autowrap to textwidth
                                " c - autowrap comments to textwidth
                                " r - autoinsert comment leader with <Enter>
                                " q - allow formatting of comments with :gq
                                " l - don't format already long lines

"------ Indents and tabs ------"

set autoindent                  " set the cursor at same indent as line above
set smartindent                 " try to be smart about indenting (C-style)
set expandtab                   " expand <Tab>s with spaces; death to tabs!
set shiftwidth=4                " spaces for each step of (auto)indent
set softtabstop=4               " set virtual tab stop (compat for 8-wide tabs)
set tabstop=8                   " for proper display of files with tabs
set shiftround                  " always round indents to multiple of shiftwidth
set copyindent                  " use existing indents for new indents
set preserveindent              " save as much indent structure as possible
filetype plugin indent on       " load filetype plugins and indent settings

"------ Key bindings ------"

" Remap broken meta-keys that send ^[
for n in range(97,122) " ASCII a-z
    let c = nr2char(n)
    exec "set <M-". c .">=\e". c
    exec "map  \e". c ." <M-". c .">"
    exec "map! \e". c ." <M-". c .">"
endfor

""" Emacs keybindings
" first move the window command because we'll be taking it over
noremap <C-x> <C-w>
" Movement left/right
noremap! <C-b> <Left>
noremap! <C-f> <Right>
" word left/right
noremap  <M-b> b
noremap! <M-b> <C-o>b
noremap  <M-f> w
noremap! <M-f> <C-o>w
" line start/end
noremap  <C-a> ^
noremap! <C-a> <Esc>I
noremap  <C-e> $
noremap! <C-e> <Esc>A
" Rubout word / line and enter insert mode
noremap  <C-w> i<C-w>
noremap  <C-u> i<C-u>
" Forward delete char / word / line and enter insert mode
noremap! <C-d> <C-o>x
noremap  <M-d> dw
noremap! <M-d> <C-o>dw
noremap  <C-k> Da
noremap! <C-k> <C-o>D
" Undo / Redo and enter normal mode
noremap  <C-_> u
noremap! <C-_> <C-o>u<Esc><Right>
noremap! <C-r> <C-o><C-r><Esc>

" Remap <C-space> to word completion
noremap! <Nul> <C-n>

" OS X paste (pretty poor implementation)
if has('mac')
    noremap  âˆš :r!pbpaste<CR>
    noremap! âˆš <Esc>âˆš
endif

""" screen.vim REPL: http://github.com/ervandew/vimfiles
" send paragraph to parallel process
vmap <C-c><C-c> :ScreenSend<CR>
nmap <C-c><C-c> mCvip<C-c><C-c>`C
imap <C-c><C-c> <Esc><C-c><C-c><Right>
" set shell region height
let g:ScreenShellHeight = 12


"------ Filetypes ------"

" Vimscript
autocmd FileType vim setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" Shell
autocmd FileType sh setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" Lisp
autocmd Filetype lisp,scheme setlocal equalprg=~/.vim/bin/lispindent.lisp expandtab shiftwidth=2 tabstop=8 softtabstop=2

" Ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" PHP
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" X?HTML & XML
autocmd FileType html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" CSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" JavaScript
" autocmd BufRead,BufNewFile *.json setfiletype javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let javascript_enable_domhtmlcss=1

"------ END VIM-500 ------"

endif " version >= 500

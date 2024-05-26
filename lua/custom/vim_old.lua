vim.cmd([[

let s:hidden_all = 0

function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=3
        set showcmd
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>

nnoremap <Enter> i<Enter><Esc>
nnoremap qq :bdelete<CR>

" Move the current line up using Alt + Up Arrow
nnoremap <A-Up> :m-2<CR>==
inoremap <A-Up> <Esc>:m-2<CR>==gi

" Move the current line down using Alt + Down Arrow
nnoremap <A-Down> :m+<CR>==
inoremap <A-Down> <Esc>:m+<CR>==gi

" Move selected text block up with Alt + Up Arrow
xmap <M-Up> :move '<-2<CR>gv=gv

" Move selected text block down with Alt + Down Arrow
xmap <M-Down> :move '>+<CR>gv=gv


set list
set listchars=tab:\ \ ⸗,trail:·,extends:>,precedes:<,space:·
:hi SpecialKey ctermfg=darkgray guifg=gray70

"set fillchars=eob:\ ,fold:\ ,vert:\│
"set fillchars+=vert:\ 

set clipboard=unnamedplus
set clipboard+=unnamed
set hidden

augroup remember_folds
  autocmd!
  autocmd BufWinLeave ?* silent! mkview
  autocmd BufWinEnter ?* silent! loadview
augroup END

set number
set relativenumber
set shiftwidth=2
set tabstop=2
" set expandtab
set nobackup
set shm+=I " Disable greetings

" Turn syntax highlighting on.
syntax on " Enable type file detection. Vim will be able to try to detect the type of file in use.  filetype on " Enable plugins and load plugin for the detected file type.  filetype plugin on " Load an indent file for the detected file type.  filetype indent on " Add numbers to each line on the left-hand side.  set number " Highlight cursor line underneath the cursor horizontally.  "set cursorline " Highlight cursor line underneath the cursor vertically.  " set cursorcolumn " Set shift width to 4 spaces.  set shiftwidth=2 " Set tab width to 4 columns.  set tabstop=2

" Use space characters instead of tabs.
" set expandtab

" Do not save backup files.
" set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

set nowrap

" Show partial command you type in the last line of the screen.
"set showcmd

" Show the mode you are on the last line.
"set showmode

" Show matching words during a search.
"set showmatch

" Use highlighting when doing a search.
"set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest


]])

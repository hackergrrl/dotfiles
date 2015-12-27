" Initialization ----------------------------------------------------------- {{{

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Airline
" (https://github.com/bling/vim-airline)
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

" Atom is pretty rad.
colorscheme atom-dark-256

" Use a light theme for markdown editting in gvim.
augroup light_markdown_theme
  au!
  if has('gui_running')
    au FileType markdown colorscheme cake16
  else
    au FileType markdown colorscheme badwolf
  endif
augroup END

" }}} 
" General ------------------------------------------------------------------ {{{
set nocompatible
syntax on
set laststatus=2
set autoindent
set autowrite
set autoread
set nu
set tabstop=2
set shiftwidth=2
set shiftround
set ttyfast
set lazyredraw
set expandtab
set hlsearch
set incsearch
set encoding=utf-8
set undofile
"set relativenumber   " cool, but slows down the terminal too much =(
set bs=2
set nojoinspaces
filetype plugin on
set colorcolumn=100

" 100ms delay (or: let's me hit O and not need to wait around)
set ttimeoutlen=100

let mapleader = "-"
let maplocalleader = "_"

" Backups
set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/
set backup
set noswapfile

" }}}
" Handy mappings ----------------------------------------------------------- {{{

nnoremap ; :
nnoremap ;; ;
nnoremap <Leader>n :set nu!<CR>
nnoremap <Leader>l :noh<CR>

" TODO: What I'd *really* like is a nice hotkey that pasted my system
" clipboard nicely.
nnoremap <Leader>p :set paste!<CR>

" who even uses substitute?
nnoremap s <esc>:w<cr>

" jk for escape. none of that system-wide capslock crap.
inoremap jk <esc>
inoremap <esc> <nop>

map <tab> %

" Center screen when searching
nnoremap n nzz
nnoremap N Nzz

" Have */# highlight matches, but not move the cursor.
nnoremap * *<C-o>
nnoremap # #<C-o>

" let's be a little emacs-like insert mode
inoremap <C-a> <esc>0i
inoremap <C-e> <esc>$i

" Fixes Y to be like D.
nnoremap Y y$

" Format paragraph. I never use register q.
nnoremap qq gqip

" Pipe the output of a command into a new buffer.
nnoremap \| :tabnew \| 0r !

" Write as sudo. (Thanks, Losh!)
cnoremap w!! w !sudo tee % >/dev/null

nnoremap <CR> o<ESC>k

" Buffer navigation shortcuts.
nnoremap <C-k> :bprev<CR>
nnoremap <C-j> :bnext<CR>
nnoremap <Leader>d :bdel<CR>

" Better history scrolling.
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Easier splits.
nnoremap <C-w>\| :vsplit<CR>
nnoremap <C-w>- :split<CR>

" vimrc management
nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>evg :e ${MYVIMRC}_google<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" }}}
" Filetype auto groups ----------------------------------------------------- {{{

" vimscript
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" Perform spell checking when composing mail or markdown.
augroup spell_check
  au!
  autocmd FileType mail setlocal spell
  autocmd FileType mail setlocal textwidth=72
  autocmd FileType markdown setlocal spell

  " Ignore URLs
  autocmd FileType markdown syn match UrlNoSpell "\w\+:\/\/[^[:space:]]\+" contains=@NoSpell
  autocmd FileType mail syn match UrlNoSpell "\w\+:\/\/[^[:space:]]\+" contains=@NoSpell
augroup END

" Markdown.
augroup markdown
  au!
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd FileType markdown nnoremap <LocalLeader>u yypVr-j
  autocmd FileType markdown nnoremap <LocalLeader>U yypVr=j
  autocmd FileType markdown setlocal textwidth=80
  autocmd FileType markdown nnoremap <Leader>v :w !vmd<CR><CR>
augroup END

" vim-task
augroup tasks
  autocmd FileType task nnoremap <silent> <buffer> <cr> :call Toggle_task_status()<CR><CR>
augroup END

" Use Javascript syntax highlighting for JSON.
augroup javascript
  au!
  autocmd BufNewFile,BufRead *.json set ft=javascript
augroup END

" }}}
" Gvim options ------------------------------------------------------------- {{{
set guioptions-=r
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions-=B
" }}}
" Folds -------------------------------------------------------------------- {{{

set foldmethod=marker
set foldlevelstart=0

" Space to toggle.
nnoremap <space> za
vnoremap <space> za

" Open current fold fully.
nnoremap z0 zcz0

" 'Focus' the current line. (Thanks, Losh!)
nnoremap z<space> zMza

" }}}
" Formatting aides --------------------------------------------------------- {{{

" Removes comment leaders when joining lines.
set formatoptions+=j

" Highlight trailing whitespace.
hi link localWhitespaceError Error
augroup trailing_whitespace
  au!
  au Syntax * syn match localWhitespaceError /\(zs\%#|\s\)\+$/ display
  au Syntax * syn match localWhitespaceError / \+\ze\t/ display
  au Syntax * syn match localWhitespaceError /\%>100v.\+/ display
augroup END

" Highlight trailing whitespace.
" XXX: Wait, what? Again?
highlight ExtraWhitespace ctermbg=red guibg=red
augroup trailing_whitespace2
  au!
  au ColorScheme * highlight ExtraWhitespace guibg=red
  au BufEnter * match ExtraWhitespace /\s\+$/
  au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  au InsertLeave * match ExtraWhiteSpace /\s\+$/
augroup END

" Highlight VCS conflict markers.
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}
" Plugin configuration ----------------------------------------------------- {{{

" vim-buffabline
let g:buftabline_separators=1
let g:buftabline_numbers=0
hi! BufTabLineCurrent guibg=#151515 guifg=#ffffff gui=None cterm=None ctermbg=190 ctermfg=17
hi! BufTabLineHidden guibg=#151515 guifg=#ffffff gui=None cterm=None ctermbg=238 ctermfg=15
hi! BufTabLineFill guibg=#151515 guifg=#ffffff gui=None cterm=None ctermbg=234 ctermfg=15

" FZF
set rtp+=~/.fzf
nnoremap <C-p> :FZF<CR>

" }}}

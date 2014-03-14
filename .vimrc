" General goodness.
set nocompatible
syntax on
set laststatus=2
set ai
set nu
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set incsearch
set encoding=utf-8
set undofile
"set relativenumber   " cool, but slows down the terminal too much =(
set bs=2
set nofoldenable
set nojoinspaces
filetype plugin on

let mapleader = "-"

" Perform spell checking when composing mail or markdown.
autocmd FileType mail set spell
autocmd FileType mail set textwidth=0
autocmd FileType markdown set spell

" Hide GUI components in gvim.
set guioptions-=r
set guioptions-=m
set guioptions-=T

" Powerline setup
"set guifont=Ubuntu\ Mono\ 12
"let g:Powerline_symbols='fancy'

" Airline setup
" (https://github.com/bling/vim-airline)
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
let g:airline_powerline_fonts = 1

" vimrc management
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Formatting magicks.
" Thanks Tiziano Santoro!
" src: https://groups.google.com/a/google.com/d/msg/vi-users/MUfs7ZZuzeM/SPGCIwSrnYMJ
set formatoptions+=j

" Pathogen
call pathogen#infect() "('~/.vim/bundle')
call pathogen#helptags()

" Backups
set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/
set backup
"set noswapfile

" Handy key mappings.
command W w
nnoremap ; :
"inoremap jj <ESC>
nnoremap <Leader>p :set paste!<CR>
nnoremap <Leader>n :set nu!<CR>
nnoremap <Leader>l :noh<CR>

" Use Javascript syntax highlighting for JSON.
autocmd BufNewFile,BufRead *.json set ft=javascript

" Syntax highlighting colour preferences.
hi Comment ctermfg=magenta
hi Pmenu ctermfg=white ctermbg=darkmagenta
hi Search ctermbg=green ctermfg=black
hi LineNr ctermfg=grey cterm=bold

" Highlight trailing whitespace.
hi link localWhitespaceError Error
au Syntax * syn match localWhitespaceError /\(zs\%#|\s\)\+$/ display
au Syntax * syn match localWhitespaceError / \+\ze\t/ display
au Syntax * syn match localWhitespaceError /\%>100v.\+/ display

" HACK: Highlight members.
" hi def Member ctermfg=darkmagenta
" au Syntax * syn match Member "\.\zs\w\+\ze[^(]"
" au Syntax * syn match Member "->\zs\w\+\ze[^(]"

" HACK: Highlight function uses/definitions.
" hi def FuncName ctermfg=darkcyan
" au Syntax * syn match FuncName "\zs\w\+\ze("

" My custom .todo syntax highlighting.
au BufRead,BufNewFile *.todo set filetype=todo-lang
au! Syntax todo-lang source $HOME/.vim/todo.vim

" Highlight trailing whitespace.
" XXX: Wait, what? Again?
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red

" XXX: What does this even do?
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Highlight VCS conflict markers.
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Preferred default colour scheme.
colorscheme badwolf
"colorscheme molokai
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

" Buffer shortcuts.
nnoremap <C-k> :bprev<CR>
nnoremap <C-j> :bnext<CR>
nnoremap <Leader>d :bdel<CR>

" Sudo to write
" (Thank you, sjl!)
cnoremap w!! w !sudo tee % >/dev/null

" YCM
"let g:ycm_filetype_blacklist["todo-lang"] = 1
"let g:ycm_filetype_blacklist["mail"] = 1
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'todo-lang': 1,
      \ 'mail': 1,
      \}
let g:ycm_server_idle_suicide_seconds = 0

" HACK: increase CtrlP max files (magicjaaaaaar!)
let g:ctrlp_max_files = 30000
" Ignore Java class files.
let g:ctrlp_custom_ignore = 'magicjar'

" Toggle paste mode.
" TODO: Leader key chord to enter paste mode, paste system clipboard, then exit
"       paste mode.
nnoremap <Leader>p :set paste!<CR>

" Splits
nnoremap <C-w>\| :vsplit<CR>
nnoremap <C-w>- :split<CR>

" Eclim
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimLoggingDisabled = 1

" Show error panel
nnoremap <Leader>e :lopen<CR>

" Highlight characters that go over the line length limit.
" nnoremap <leader>h :call ToggleOverLengthHighlight()<CR>
" let g:overlength_enabled = 0
" highlight OverLength ctermbg=red guibg=#212121

" function! ToggleOverLengthHighlight()
"     if g:overlength_enabled == 0
"         match OverLength /\%99v.*/
"         let g:overlength_enabled = 1
"         echo 'OverLength highlighting turned on'
"     else
"         match
"         let g:overlength_enabled = 0
"         echo 'OverLength highlighting turned off'
"     endif
" endfunction

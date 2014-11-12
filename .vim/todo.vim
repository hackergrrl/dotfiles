" =============================================================================
"
"   Program:   todo - todo list tracking
"   Module:    $RCSfile$
"   Language:  VIM
"   Date:      $Date$
"   Version:   $Revision$
"
" =============================================================================

" Vim syntax file
" Language:     todo
" Author:       Stephen Whitmore <sww@eight45.net>
" Maintainer:   Stephen Whitmore <sww@eight45.net>
" Last Change:  $Date$
" Version:      $Revision$
"
" Licence:      MIT
"
" Originally shamelessly based on the CMake syntax file.

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore
syn region todoItem start="\s\[ \]" end="$" contains=todoItem2,ldap
syn region todoItem2 start="\[" end="\]" contained
syn region todoItemDone start="\s\[\*\]" end="$" contains=todoItemDone2,ldap
syn region todoItemDone2 start="\[" end="\]" contained

syn region subTodoItem start="\s\s\+\[ \]" end="$" contains=subTodoItem2,ldap
syn region subTodoItem2 start="\[" end="\]" contained
syn region subTodoItemDone start="\s\s\+\[\*\]" end="$" contains=subTodoItemDone2,ldap
syn region subTodoItemDone2 start="\[" end="\]" contained

syn region bugItem start="\s*{ }" end="$" contains=bugItem2,ldap
syn region bugItem2 start="{" end="}" contained
syn region bugItemDone start="\s*{\*}" end="$" contains=bugItemDone2,ldap
syn region bugItemDone2 start="{" end="}" contained

syn region blockItem start="\s*< >" end="$" contains=blockItem2,ldap
syn region blockItem2 start="<" end=">" contained
syn region blockItemDone start="\s*<\*>" end="$" contains=blockItemDone2,ldap
syn region blockItemDone2 start="<" end=">" contained

syn region infoItem start="^\s*->" end="$" contains=infoItem2,ldap
syn region infoItem2 start="->" end="." contained


hi def todoItem ctermfg=white guifg=black
hi def todoItem2 ctermfg=green guifg=green
hi def todoItemDone ctermfg=darkgreen guifg=darkgreen
hi def todoItemDone2 ctermfg=darkgreen guifg=darkgreen

hi def subTodoItem ctermfg=gray guifg=darkgray
hi def subTodoItem2 ctermfg=darkgreen guifg=darkgreen
hi def subTodoItemDone ctermfg=darkgreen guifg=darkgreen
hi def subTodoItemDone2 ctermfg=darkgreen guifg=darkgreen

hi def bugItem ctermfg=white guifg=black
hi def bugItem2 ctermfg=red guifg=red
hi def bugItemDone ctermfg=darkred guifg=darkred
hi def bugItemDone2 ctermfg=darkred guifg=darkred

hi def blockItem ctermfg=gray guifg=darkgray
hi def blockItem2 ctermfg=magenta guifg=magenta
hi def blockItemDone ctermfg=darkmagenta guifg=darkmagenta
hi def blockItemDone2 ctermfg=darkmagenta guifg=darkmagenta

hi def infoItem ctermfg=gray guifg=darkgray
hi def infoItem2 ctermfg=blue guifg=blue


let b:current_syntax = "todo"

function! SwapStar()
  execute "normal! 0wl"
  if getline(".")[col(".")-1] == "*"
    execute "normal! r "
  elseif getline(".")[col(".")-1] == " "
    execute "normal! r*"
  endif
  execute "normal! 0j"
endfunction

" autocmd FileType todo-lang nnoremap <CR> :call SwapStar()<CR>
" TODO: make this buffer local(??)
nnoremap <buffer> <CR> :call SwapStar()<CR>

"EOF"

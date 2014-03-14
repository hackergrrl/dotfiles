" =============================================================================
"
"   Program:   CMake - Cross-Platform Makefile Generator
"   Module:    $RCSfile$
"   Language:  VIM
"   Date:      $Date$
"   Version:   $Revision$
"
" =============================================================================

" Vim syntax file
" Language:     CMake
" Author:       Andy Cedilnik <andy.cedilnik@kitware.com>
" Maintainer:   Karthik Krishnan <karthik.krishnan@kitware.com>
" Last Change:  $Date$
" Version:      $Revision$
"
" Licence:      The CMake license applies to this file. See
"               http://www.cmake.org/HTML/Copyright.html
"               This implies that distribution with Vim is allowed

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore
syn region todoItem start="\s\[ \]" end="$" contains=todoItem2
syn region todoItem2 start="\[" end="\]" contained
syn region todoItemDone start="\s\[\*\]" end="$" contains=todoItemDone2
syn region todoItemDone2 start="\[" end="\]" contained

syn region subTodoItem start="\s\s\+\[ \]" end="$" contains=subTodoItem2
syn region subTodoItem2 start="\[" end="\]" contained
syn region subTodoItemDone start="\s\s\+\[\*\]" end="$" contains=subTodoItemDone2
syn region subTodoItemDone2 start="\[" end="\]" contained

syn region bugItem start="\s*{ }" end="$" contains=bugItem2
syn region bugItem2 start="{" end="}" contained
syn region bugItemDone start="\s*{\*}" end="$" contains=bugItemDone2
syn region bugItemDone2 start="{" end="}" contained

syn region blockItem start="\s*< >" end="$" contains=blockItem2
syn region blockItem2 start="<" end=">" contained
syn region blockItemDone start="\s*<\*>" end="$" contains=blockItemDone2
syn region blockItemDone2 start="<" end=">" contained

syn region infoItem start="^\s*->" end="$" contains=infoItem2
syn region infoItem2 start="->" end="." contained

"syn match cmakeEscaped /\(\\\\\|\\"\|\\n\|\\t\)/ contained
"syn region cmakeComment start="#" end="$" contains=cmakeTodo
"syn region cmakeRegistry start=/\[/ end=/]/
"            \ contained oneline contains=CONTAINED,cmakeTodo,cmakeEscaped
"syn region cmakeVariableValue start=/\${/ end=/}/
"            \ contained oneline contains=CONTAINED,cmakeTodo
"syn region cmakeEnvironment start=/\$ENV{/ end=/}/
"            \ contained oneline contains=CONTAINED,cmakeTodo
"syn region cmakeString start=/"/ end=/"/ 
"            \ contains=CONTAINED,cmakeTodo,cmakeOperators
"syn region cmakeArguments start=/(/ end=/)/ 
"            \ contains=ALLBUT,cmakeArguments,cmakeTodo
"syn keyword cmakeSystemVariables
"            \ WIN32 UNIX APPLE CYGWIN BORLAND MINGW MSVC MSVC_IDE MSVC60 MSVC70 MSVC71 MSVC80 MSVC90
"syn keyword cmakeOperators
"            \ ABSOLUTE AND BOOL CACHE COMMAND DEFINED DOC EQUAL EXISTS EXT FALSE GREATER INTERNAL LESS MATCHES NAME NAMES NAME_WE NOT OFF ON OR PATH PATHS PROGRAM STREQUAL STRGREATER STRING STRLESS TRUE
"            \ contained
"syn keyword cmakeDeprecated ABSTRACT_FILES BUILD_NAME SOURCE_FILES SOURCE_FILES_REMOVE VTK_MAKE_INSTANTIATOR VTK_WRAP_JAVA VTK_WRAP_PYTHON VTK_WRAP_TCL WRAP_EXCLUDE_FILES
"           \ nextgroup=cmakeArguments

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

"EOF"

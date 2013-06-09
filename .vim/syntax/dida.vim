" Vim syntax file
" Language:    Dida
" Maintainer:  Xavier Nayrac <xavier.nayrac@gmail.com>
" Version:     0.1.0
" URL:	       

if version < 600
  syn clear
elseif exists("b:current_syn")
  finish
endif

" Numbers
" ---------------------------------------------------------------------
" Integer
syn match  didaNumber /\<\d\+\>/


" Classname
" ---------------------------------------------------------------------
syn match didaClassname /[A-Z][0-9a-zA-Z\._]*/

" Highlighting
" ---------------------------------------------------------------------
highlight link didaClassname Type
highlight link didaNumber Number

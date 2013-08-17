" Vim syntax file
" Language:    Naam
" Maintainer:  Xavier Nayrac <xavier.nayrac@gmail.com>
" Version:     0.1.0
" URL:

if version < 600
  syn clear
elseif exists("b:current_syn")
  finish
endif

syn case ignore

" Function definition
" --------------------------------------------------------------
syn match naamFunctionDef /^.*->/

" Naam's keywords ---------------------------------------
syn keyword naamKeyword if else print

" Numbers -------------------------------------------------------------
"
" Integer
syn match  naamNumber /\<\d\+\>/


" Highlighting --------------------------------------------------------
highlight link naamFunctionDef Function
highlight link naamKeyword Keyword
highlight link naamNumber Number

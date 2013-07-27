" Vim syntax file
" Language:    Organ
" Maintainer:  Xavier Nayrac <xavier.nayrac@gmail.com>
" Version:     0.1.0
" URL:	       

if version < 600
  syn clear
elseif exists("b:current_syn")
  finish
endif

syn case ignore


" Keywords
" --------------------------------------------------------------
syn keyword organKeyword align
syn keyword organKeyword background border bottom
syn keyword organKeyword color
syn keyword organKeyword decoration
syn keyword organKeyword family font
syn keyword organKeyword height
syn keyword organKeyword image
syn keyword organKeyword line
syn keyword organKeyword margin
syn keyword organKeyword padding
syn keyword organKeyword radius
syn keyword organKeyword shadow size style
syn keyword organKeyword text top transition
syn keyword organKeyword weight width

" Selectors
" --------------------------------------------------------------
syn match organSelectors /^.*=/


" Highlighting --------------------------------------------------------
highlight link organSelectors Keyword
highlight link organKeyword Function

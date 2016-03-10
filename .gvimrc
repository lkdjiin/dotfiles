" Retirer la toolbar
set guioptions-=T

" Retirer le menu
set guioptions-=m

" Ne mettre que les noms de fichier dans les onglets et
" l'éventuelle marque de modification. Prefixer par le numéro de l'onglet,
" c'est plus simple pour atteindre l'onglet voulu avec #gt.
set guitablabel=[%N]\ %t\ %M

" Digraphs
set digraph

colorscheme gruvbox
set bg=dark

let &colorcolumn=join(range(73,80),",")
highlight ColorColumn guibg=#404040

" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_detect_modified=1
let g:airline_section_z = ' %l / %L : %c '
let g:airline_section_c = '%t %m'

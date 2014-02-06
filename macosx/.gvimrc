" Ne mettre que les noms de fichier dans les onglets et
" l'éventuelle marque de modification. Prefixer par le numéro de l'onglet,
" c'est plus simple pour atteindre l'onglet voulu avec #gt.
" Doit être dans `.gvimrc`. N'est pas pris en compte sous OS X
" si dans `.vimrc`.
set guitablabel=[%N]\ %t\ %M

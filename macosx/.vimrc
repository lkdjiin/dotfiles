" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!). "{{{
" This must be first, because it changes other options as a side effect. "}}}
set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'git@github.com:t9md/vim-choosewin.git'
Bundle 'git@github.com:matze/vim-move.git'
Bundle 'git@github.com:tpope/vim-markdown.git'
Bundle 'git@github.com:vim-scripts/AutoComplPop.git'
Bundle 'git@github.com:tpope/vim-commentary.git'
Bundle 'git@github.com:tpope/vim-endwise.git'

" A fork of vim-surround usable with bépo layout
Bundle 'git@github.com:lkdjiin/vim-surround.git'

Bundle 'git@github.com:tpope/vim-repeat.git'
Bundle 'git@github.com:lkdjiin/vim-foldcomments.git'
Bundle 'git@github.com:morhetz/gruvbox.git'

" Vim-Airline settings.
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_section_z = ' %l / %L : %c '
let g:airline_section_c = '%t %m'

" Choosewin plugin settings.
"
" invoke with '-'
nmap  -  <Plug>(choosewin)
" use overlay feature
let g:choosewin_overlay_enable = 1
" workaround for overlay font broken on mutibyte buffer.
let g:choosewin_overlay_clear_multibyte = 1
" tmux like overlay color
let g:choosewin_color_overlay = {
  \ 'gui': ['DodgerBlue3', 'DodgerBlue3' ],
  \ 'cterm': [ 25, 25 ]
  \ }
let g:choosewin_color_overlay_current = {
  \ 'gui': ['firebrick1', 'firebrick1' ],
  \ 'cterm': [ 124, 124 ]
  \ }
let g:choosewin_blink_on_land      = 0 " dont' blink at land
let g:choosewin_statusline_replace = 0 " don't replace statusline
let g:choosewin_tabline_replace    = 0 " don't replace tabline

" vim-move plugin settings
let g:move_key_modifier = 'C'


set nostartofline

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" don't want backup files
set nobackup

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching



" Retirer la toolbar
set guioptions-=T

set cursorline
" hi CursorLine guibg=#494949

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo, "{{{
" so that you can undo CTRL-U after inserting a line break. "}}}
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Permet de mettre les plugins dans leurs dossiers respectifs
" sous ~/.vim/bundle/
" execute pathogen#infect()

" Switch syntax highlighting on, when the terminal has colors "{{{
" Also switch on highlighting the last used search pattern. "}}}
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection. "{{{
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting. "}}}
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " Surligner les chars au dela de la 80e colonne.
  " au BufWinEnter * let w:m1=matchadd('LineNr', '\%<81v.\%>73v', -1)
  " au BufWinEnter * let w:m2=matchadd('Error', '\%>80v.\+', -1)

  " When editing a file, always jump to the last known cursor position. "{{{
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file. "}}}
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

  " Mes types de fichiers personnalisés.
  autocmd BufNewFile,BufRead Gemfile set filetype=ruby
  autocmd BufNewFile,BufRead Capfile set filetype=ruby
  autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

  " Sauvegarder le fichier quand on change d'onglet.
  autocmd FocusLost,TabLeave * :wall

  " La chaîne de caractères pour les commentaires. Certains type de "{{{
  " fichier n'ont pas la bonne. "}}}
  autocmd FileType racket set commentstring=;\ %s
else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the "{{{
" file it was loaded from, thus the changes you made.
" Only define it when not defined already. "}}}
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

" Uncomment this for vim to use your bash aliases.
" let $BASH_ENV = "~/.bash_aliases"

" Des tabulations de 2 caractères et des espaces "{{{
" à la place de tabulation. "}}}
set tabstop=2
set shiftwidth=2
set expandtab

" Look de la fenêtre.
set guifont=Inconsolata\ for\ Powerline:h22

" Trying gruvbox color scheme
colorscheme gruvbox
set bg=dark
" colorscheme desertimp

set number
set foldcolumn=1

" Utiliser des marqueurs pour le folding
set foldmethod=marker

" Remappage du clavier pour la disposition bépo.
source ~/.vim/vimrc.bepo.vim

" Mappage clavier personnel. "{{{
"
"
" Désactiver la touche <ALT> pour le menu, comme ça on peut l'utiliser
" pour ce qu'on veut.
" set winaltkeys=no
"
" <CTRL-S> : Enregistrer le fichier. "}}}
map <C-s> :w<Enter>

" Le mappage suivant est désactivé suite à l'utilisation de la touche <Space> "{{{
" par le plugin EasyMotion.
" <Space>x : Insérer le caractère x, puis retourner en mode normal.
"            Uniquement en mode normal.
"            h est égal à r en bépo.
"nmap <Space> i_<Esc>h "}}}

" En mode normal , les touches fléchées servent à changer de fenêtre.
nnoremap <up> <C-w><up>
nnoremap <down> <C-w><down>
nnoremap <left> <C-w><left>
nnoremap <right> <C-w><right>

" Redimensioner les fenêtres.
nnoremap <C-up> :resize +2<cr>
nnoremap <C-down> :resize -2<cr>
nnoremap <C-right> :vertical resize +2<cr>
nnoremap <C-left> :vertical resize -2<cr>

" Dans les recherches, ne pas prendre en compte la casse des "{{{
" caractères, sauf si on saisi une majuscule. "}}}
set ignorecase smartcase

" Coller
map <Insert> "+gP
" Copier
map <C-Insert> "+y

" Parametrer EasyMotion pour mon clavier bépo
let g:EasyMotion_leader_key = '<Space>'

" Parametrer AutoCompletePop "{{{
"
" 4 lettres avant de tenter une complétion "}}}
let g:acp_behaviorKeywordLength = 4
" On peut essayer ça à la place "{{{
"let g:acp_behaviorKeywordIgnores = [] "}}}


" Fonctions persos "{{{
" "}}}
function! RemoveTrailingSpaces()
  " %s/\s\+$//
  rubydo gsub /\s+$/, ''
endfunction

" Leader
let mapleader = ","
" Ouvrir un nouvel onglet
map <Leader>t :tabnew<Enter>
" Ouvrir le fichier sous le curseur dans un onglet.
map <Leader>f wgf

map <Leader>p :RainbowParenthesesToggle<Enter>

map <Leader>r :call RemoveTrailingSpaces()<Enter>

map <F5> :FoldComments<Enter>

" RSpec.vim mappings
map <Leader>c :wall<CR>:call RunCurrentSpecFile()<CR>
map <Leader>n :wall<CR>:call RunNearestSpec()<CR>
map <Leader>l :wall<CR>:call RunLastSpec()<CR>
map <Leader>a :wall<CR>:call RunAllSpecs()<CR>

let &colorcolumn=join(range(73,80),",")
" highlight ColorColumn guibg=#404040


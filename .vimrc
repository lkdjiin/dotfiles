" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'git@github.com:vim-scripts/AutoComplPop.git'
Bundle 'git@github.com:kien/ctrlp.vim.git'
Bundle 'git@github.com:kien/rainbow_parentheses.vim.git'
Bundle 'git@github.com:scrooloose/syntastic.git'
Bundle 'git@github.com:vim-scripts/SyntaxRange.git'
Bundle 'git@github.com:bling/vim-airline.git'
Bundle 'git@github.com:tpope/vim-commentary.git'
Bundle 'git@github.com:skammer/vim-css-color.git'
Bundle 'git@github.com:elixir-lang/vim-elixir.git'
Bundle 'git@github.com:tpope/vim-endwise.git'
Bundle 'git@github.com:lkdjiin/vim-foldcomments.git'
Bundle 'git@github.com:tpope/vim-fugitive.git'
Bundle 'git@github.com:tpope/vim-haml.git'
Bundle 'git@github.com:wlangstroth/vim-racket.git'
Bundle 'git@github.com:tpope/vim-repeat.git'
Bundle 'git@github.com:lkdjiin/vim-surround.git'
Bundle 'git@github.com:Lokaltog/vim-easymotion.git'
Bundle 'git@github.com:junegunn/vader.vim.git'
Bundle 'git@github.com:JuliaLang/julia-vim.git'
Bundle 'git@github.com:raichoo/haskell-vim.git'

Bundle 'git@github.com:morhetz/gruvbox.git'

set nostartofline

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" don't want backup files
set nobackup

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Retirer la toolbar
set guioptions-=T

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " Surligner les chars au dela de la 80e colonne.
  " au BufWinEnter * let w:m1=matchadd('LineNr', '\%<81v.\%>73v', -1)
  " au BufWinEnter * let w:m2=matchadd('Error', '\%>80v.\+', -1)

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

  " Mes types de fichiers personnalisés.
  autocmd BufNewFile,BufRead *.less set filetype=less
  autocmd BufNewFile,BufRead *.logo set filetype=logo
  autocmd BufNewFile,BufRead *.lg set filetype=logo
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee
  autocmd BufNewFile,BufRead *.dida set filetype=dida
  autocmd BufNewFile,BufRead *.organ set filetype=organ
  autocmd BufNewFile,BufRead *.naam set filetype=naam
  autocmd BufNewFile,BufRead *.pir set filetype=pir
  autocmd BufNewFile,BufRead Gemfile set filetype=ruby
  autocmd BufNewFile,BufRead Capfile set filetype=ruby
  autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

  " Sauvegarder le fichier quand on change d'onglet.
  autocmd FocusLost,TabLeave * :wall

  " La chaîne de caractères pour les commentaires. Certains type de
  " fichier n'ont pas la bonne.
  autocmd FileType racket set commentstring=;\ %s

  autocmd BufWritePost ~/.vimrc source $MYVIMRC
else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

" Des tabulations de 2 caractères et des espaces
" à la place de tabulation.
set tabstop=2
set shiftwidth=2
set expandtab

" Look de la fenêtre.
set guifont=Inconsolata-g\ 15
set lines=35 columns=86
colorscheme gruvbox
set bg=dark
set number
set foldcolumn=1

" Utiliser des marqueurs pour le folding
set foldmethod=marker

" Ne mettre que les noms de fichier dans les onglets et
" l'éventuelle marque de modification. Prefixer par le numéro de l'onglet,
" c'est plus simple pour atteindre l'onglet voulu avec #gt.
set guitablabel=[%N]\ %t\ %M

" Digraphs
set digraph

" Remappage du clavier pour la disposition bépo.
source ~/.vim/vimrc.bepo.vim

" Mappage clavier personnel.
"
"
" Désactiver la touche <ALT> pour le menu, comme ça on peut l'utiliser
" pour ce qu'on veut.
" set winaltkeys=no
"
" <CTRL-S> : Enregistrer le fichier.
map <C-s> :w<Enter>

" Le mappage suivant est désactivé suite à l'utilisation de la touche <Space>
" par le plugin EasyMotion.
" <Space>x : Insérer le caractère x, puis retourner en mode normal.
"            Uniquement en mode normal.
"            h est égal à r en bépo.
"nmap <Space> i_<Esc>h

" En mode normal , les touches fléchées servent à changer de fenêtre.
nnoremap <up> <C-w><up>
nnoremap <down> <C-w><down>
nnoremap <left> <C-w><left>
nnoremap <right> <C-w><right>

" Redimensioner les fenêtres.
nnoremap <S-up> :resize +2<cr>
nnoremap <S-down> :resize -2<cr>
nnoremap <S-right> :vertical resize +2<cr>
nnoremap <S-left> :vertical resize -2<cr>

" Dans les recherches, ne pas prendre en compte la casse des
" caractères, sauf si on saisi une majuscule.
set ignorecase smartcase

" Coller
map <Insert> "+gP
" Copier
map <C-Insert> "+y

" Parametrer EasyMotion pour mon clavier bépo
let g:EasyMotion_leader_key = '<Space>'
let g:EasyMotion_mapping_f = '<Space>f'
let g:EasyMotion_mapping_F = '<Space>F'
let g:EasyMotion_mapping_t = '<Space>j'
let g:EasyMotion_mapping_T = '<Space>J'
let g:EasyMotion_mapping_w = '<Space>é'
let g:EasyMotion_mapping_W = '<Space>É'
let g:EasyMotion_mapping_b = '<Space>b'
let g:EasyMotion_mapping_B = '<Space>B'
let g:EasyMotion_mapping_e = '<Space>e'
let g:EasyMotion_mapping_E = '<Space>E'
let g:EasyMotion_mapping_ge = '<Space>ge'
let g:EasyMotion_mapping_gE = '<Space>gE'
let g:EasyMotion_mapping_j = '<Space>t'
let g:EasyMotion_mapping_k = '<Space>s'
let g:EasyMotion_mapping_n = '<Space>n'
let g:EasyMotion_mapping_N = '<Space>N'

" Parametrer AutoCompletePop
"
" 4 lettres avant de tenter une complétion
let g:acp_behaviorKeywordLength = 4
" On peut essayer ça à la place
"let g:acp_behaviorKeywordIgnores = []

" Parametrer Syntastic.
"
" Ne pas se servir du ruby system.
let g:syntastic_ruby_exec = "/home/xavier/.rvm/rubies/ruby-2.0.0-rc1/bin/ruby"

" Parametrer Airline
set laststatus=2
let g:airline_theme='wombat'
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

" Fonctions persos
"
function! RemoveTrailingSpaces()
  %s/\s\+$//
endfunction

" Leader
let mapleader = ","
" Ouvrir un nouvel onglet
map <Leader>t :tabnew<Enter>
" Ouvrir le fichier sous le curseur dans un onglet.
map <Leader>f wgf

map <Leader>p :RainbowParenthesesToggle<Enter>

map <Leader>r :call RemoveTrailingSpaces()<Enter>

nmap <Leader>q" :QuickMarkdownTitle1<Enter>
nmap <Leader>q« :QuickMarkdownTitle2<Enter>
nmap <Leader>q» :QuickMarkdownTitle3<Enter>
nmap <Leader>q( :QuickMarkdownTitle4<Enter>
nmap <Leader>q) :QuickMarkdownTitle5<Enter>
nmap <Leader>q@ :QuickMarkdownTitle6<Enter>
nmap <Leader>ql :QuickMarkdownLink<Enter>
nmap <Leader>qm :QuickMarkdownMore<Enter>
imap <C-q>" <C-o>:QuickMarkdownTitle1<Enter>
imap <C-q>« <C-o>:QuickMarkdownTitle2<Enter>
imap <C-q>» <C-o>:QuickMarkdownTitle3<Enter>
imap <C-q>( <C-o>:QuickMarkdownTitle4<Enter>
imap <C-q>) <C-o>:QuickMarkdownTitle5<Enter>
imap <C-q>@ <C-o>:QuickMarkdownTitle6<Enter>
imap <C-q>l <C-o>:QuickMarkdownLink<Enter>

" Test vim-refactor
nmap <Leader>rr :ExtractMethod<Enter>

map <F5> :FoldComments<Enter>

" Test some stuff for a todo file.
nnoremap <Leader>tt I[ ]<Space><Esc>
nnoremap <Leader>tx :s/^\(\s*\)\[ \]/\1[x]/<CR>

let &colorcolumn=join(range(73,80),",")
highlight ColorColumn guibg=#404040

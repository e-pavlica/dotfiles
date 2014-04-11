" see if this fixes the <leader> mapping prob
let mapleader = ","
let maplocalleader = ","

" add the pathogen package manager
execute pathogen#infect()

" turn on line numbers/ gutter
set number

" use soft tabs (2 spaces)
set expandtab
set shiftwidth=2
set softtabstop=2

" add the dayle rees themes package
colorscheme peacock 

" gvim settings
set guioptions-=T

" disable arrow keys
map <right> <nop>
map <left> <nop>
map <up> <nop>
map <down> <nop>
imap <right> <nop>
imap <left> <nop>
imap <up> <nop>
imap <down> <nop>





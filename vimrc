" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Leader
let mapleader = " "

set encoding=utf-8
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.es6 set filetype=javascript
  autocmd BufRead,BufNewFile .jshintrc set filetype=json
  autocmd BufRead,BufNewFile *.inky set filetype=eruby.html

  " Enable spellchecking for Markdown
  autocmd FileType markdown,text setlocal spell

  " Disable hidden quotes in JSON
  autocmd FileType json setlocal cole=0

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters for git commit messages
  autocmd FileType gitcommit setlocal textwidth=72

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-

  " Set JS to indent at 4 spaces
  " autocmd FileType javascript,js setlocal tabstop=4 shiftwidth=4
augroup END


" Color scheme
set t_Co=256
" let base16colorspace=256
" set background=dark
" colorscheme base16-eighties
" Unset backgrounds for transparency
" hi Normal  guibg=NONE ctermbg=NONE
" hi NonText guibg=NONE ctermbg=NONE
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Airline Customization
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#right_sep     = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#left_sep      = ''
let g:airline#extensions#tabline#left_alt_sep  = ''
let g:airline_right_sep     = ''
let g:airline_right_alt_sep = ''
let g:airline_left_sep      = ''
let g:airline_left_alt_sep  = ''

let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1

" Numbers
set number
set numberwidth=5

" Disable syntax highlighting after the first 200 columns
" (speeds up vim when super long lines are present)
set synmaxcol=200

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
" let g:syntastic_check_on_open=1
" let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
" let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_html_checkers = ['jshint', 'csslint']
" let g:syntastic_ruby_checkers = ['rubocop']

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Always use vertical diffs
set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" Custom splash screen
if filereadable($HOME . "/.vimrc.greeting")
  source ~/.vimrc.greeting
endif

" Config EasyMotion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Run rspec commands in a GNU Screen window
let g:rspec_command = 'SlimeSend0("bundle exec rspec -f d {spec}\n")'

" Make easytags a little perform a bit better
let g:easytags_async=1
let g:easytags_auto_highlight=0

let g:ale_sign_warning = ''
let g:ale_sign_error = ''
let g:ale_pattern_options = {'\.html$': {'ale_enabled': 0}}

" Convert Ruby 1.9 hash syntax to hashrocket style
vnoremap <Leader>hr :s/\(\s\+\)\(\w\+\):\s/\1:\2 => /g<CR>
" Convert Hashrocket syntax to Ruby 1.9 syntax
vnoremap <Leader>!hr :s/:\([^ ]*\)\(\s*\)=>/\1:/<CR>
" Convert Single Quotes to Double Quotes
vnoremap <Leader>' :s/"/'/g<CR>
" Add Space inside curly braces
vnoremap <Leader>{} :s/{\(\S\)\(.*\)\(\S\)}/{ \1\2\3 }/<CR>
" Add frozen_string_literal magic comment
function! FrozenStringLiteralRB()
  normal! m'
  1
  set paste
  normal! O# frozen_string_literal: true
  set nopaste
  normal! ``
endfunction
nnoremap <Leader>fsl :call FrozenStringLiteralRB()<CR>

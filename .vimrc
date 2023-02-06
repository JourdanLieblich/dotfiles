" vundle stuff
set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on    " required

nmap <C-e> :e#<CR>
:command W w
set laststatus=2
set statusline+=%F
" indenting
set smartindent
set encoding=utf-8
set showmatch
" global whitespace settings
set expandtab
" set highColor modes
set t_Co=256
" show tabs as special chars
set list
set listchars=tab:▸\
" incremental search
set incsearch
" highlight search
set hlsearch
" html settings
autocmd FileType html setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
" css settings
autocmd FileType css setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
" javascript settings
autocmd FileType javascript setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
syntax on
" python settings
autocmd FileType python setl tabstop=4|setl shiftwidth=4|setl softtabstop=4
" c settings
autocmd FileType c setl tabstop=4|setl shiftwidth=4|setl softtabstop=4
" shell settings
autocmd FileType sh setl tabstop=4|setl shiftwidth=4|setl softtabstop=4
" force gs to be recognized as js for coloration
autocmd BufNewFile,BufRead *.gs set syntax=javascript
" force jsx to be recognized as js for coloration
autocmd BufNewFile,BufRead *.jsx set syntax=javascript
" force html to be recognized as js for coloration and indents
autocmd BufNewFile,BufRead *.html set syntax=javascript
set backspace=indent,eol,start

" colorscheme
syntax on
colorscheme monokai_pro

" highlight white space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

set ignorecase
set smartcase
set runtimepath^=~/.vim/bundle/ctrlp.vim
set number


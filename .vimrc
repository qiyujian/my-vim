"======= vundle ================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/')
"
"==================plugin===============
Plugin 'VundleVim/Vundle.vim'    " let Vundle manage Vundle, required
Plugin 'L9'
Plugin 'The-NERD-tree'
Plugin 'nanotech/jellybeans.vim'
Plugin 'majutsushi/tagbar'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'rhysd/vim-clang-format'

call vundle#end()            " required
filetype plugin indent on    " required

"-----NERD-tree-----------------------------------------------------------------------------------------------------------------------------------------
map <F2> :NERDTree <CR>
map  :silent! NERDTreeToggle
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"---------tagbar----------------------------------------------
"Bundle 'majutsushi/tagbar'
"nmap <Leader>tb :TagbarToggle<CR>      "快捷键设置
let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置
map <F3> :Tagbar<CR>

"-------ctags---------
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>:set tags+=tags<CR>

"--------minibufexpl-----------------
"Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0

map <F11> :MBEbp<CR>
map <F12> :MBEbn<CR>

"=============settings===========
set nu
colorscheme jellybeans
set shiftwidth=2
set tabstop=2
filetype on
syntax on
set history=1000
set autoindent
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"=========clang-format================
let g:clang_format#style_options={
	\ "AccessModifierOffset": -4,
	\ "AllowShortIfStatementsOnASingleLine": "true",
	\ "AlwaysBreakTemplateDeclarations": "true",
	\ "Standard" : "C++11"}

let mapleader=","
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>
" if you install vim-operator-user
"autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
"nmap <Leader>C :ClangFormatAutoToggle<CR>
"autocmd FileType c,cc,cpp,h ClangFormatAutoEnable

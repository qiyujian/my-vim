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
Plugin 'Valloric/YouCompleteMe'
Plugin 'google/yapf', { 'rtp': 'plugins/vim' }
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()            " required
filetype plugin indent on    " required

"=============settings===========
colorscheme jellybeans
syntax on
"set nu
set cursorline
set hlsearch
set history=1000
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
"set noswapfile
filetype plugin indent on
set smarttab
set smartindent
set shiftwidth=2
set tabstop=4
set expandtab

" mkdir on edit if needed
" <href=http://vim.wikia.com/wiki/Mkdir_on_edit_if_needed>
au BufNewFile * :exe ': !mkdir -p ' . escape(fnamemodify(bufname('%'),':p:h'),'#% \\')

" set backspace key work
set backspace=indent,eol,start

"-----NERD-tree------------------------------------------------
map <F2> :NERDTree <CR>
map <F2> :NERDTreeToggle <CR>
:let g:NERDTreeWinSize=5
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == /"primary") | q | endif
"autocmd vimenter * NERDTree

"---------tagbar----------------------------------------------
"Bundle 'majutsushi/tagbar'
"nmap <Leader>tb :TagbarToggle<CR>      "快捷键设置
let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
let g:tagbar_width=10                   "窗口宽度的设置
map <F3> :Tagbar<CR>

"-------ctags---------------------------------------------------
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>:set tags+=tags<CR>

"--------minibufexpl-----------------
"Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0

map <F7> :MBEbp<CR>
map <F8> :MBEbn<CR>

"=========clang-format================
let mapleader=","
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>
" if you install vim-operator-user
"autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
"nmap <Leader>C :ClangFormatAutoToggle<CR>
"autocmd FileType c,cc,cpp,h ClangFormatAutoEnable
"

" =======================ycm==========
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_extra_conf_globalist = ['!/*', '~/*']
let g:ycm_confirm_extra_conf = 0

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'cc,cpp,cuda,objcpp' : ['->', '.', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \ }

"====================ycm==========
map <C-Y> :call yapf#YAPF()<cr>
imap <C-Y> :call yapf#YAPF()<cr> 


"================= vim-tmux-navigator ==========
let g:tmux_navigator_save_on_switch = 2


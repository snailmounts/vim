set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'

""""""""""""""""""""""""""""""""""""
" golang plugin
Plugin 'fatih/vim-go'
Plugin 'jstemmer/gotags'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'derekparker/delve'

""""""""""""""""""""""""""""""""""""
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'

""""""""""""""""""""""""""""""""""""
"sublime 配色方案
Plugin 'tomasr/molokai'

Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteme'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'

" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'fholgado/minibufexpl.vim'
" Plugin 'jlanzarotta/bufexplorer'
" Plugin 'bling/vim-bufferline'
" Plugin 'bronson/vim-trailing-whitespace'
" Plugin 'fannheyward/rainbow_parentheses.vim'
" Plugin 'vim-scripts/loremipsum'
" Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-repeat'
" Plugin 'tpope/vim-rails'
" Plugin 'mhinz/vim-startify'
" Plugin 'fatih/vim-go'
" Plugin 'bling/vim-airline'
" Plugin 'Keithbsmiley/swift.vim'
"Plugin 'kballard/vim-swift'
" Plugin 'junegunn/vim-easy-align'
" Plugin 'dyng/ctrlsf.vim' "全局搜索
" Plugin 'chrisbra/vim-diff-enhanced'
" Plugin 'ConradIrwin/vim-bracketed-paste'
" Plugin 'terryma/vim-expand-region'
" Plugin ''

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=','
map <silent> <leader>ee :e ~/.vimrc<cr>
map <silent> <leader>n :nohlsearch<cr>
inoremap <C-g> <Esc>
inoremap jj <Esc>

" nmap ? /\<\><Left><Left>

set novisualbell
set noeb
set clipboard=unnamed " 应用系统剪切板

" 鼠标操作,可以在buffer任何位置使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 语言，字体设置
set helplang=cn
set guifont=Monaco:h15
set guifontwide=Monaco:h15

" 配色方案
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
set background=dark
" set ruler
set ttyfast

" set showcmd "输入的命令显示出来

" Chinese encodingcoding
set encoding=utf-8
set fileencodings=utf-8,gbk,chinese,cp936,gb18030,utf-16le,utf-16,big5,euc-jp,euc-kr,latin-1,ucs-bom
set fileencoding=utf-8

set number
setlocal noswapfile
set smartindent       "set smart Gindent

set expandtab "不用空格代替制表符
set tabstop=4
set shiftwidth=4

set nofoldenable
set foldmethod=indent
set showmatch " 高亮显示匹配的括号
set matchtime=1 " 匹配括号高亮的时间（单位是十分之一秒）
set matchpairs+=<:>
set ignorecase smartcase
set completeopt=longest,menu
let do_syntax_sel_menu=1
set updatetime=200
set history=1000

" 搜索
set hlsearch
set incsearch " 搜索忽略大小写

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
set laststatus=2

set tags=tags
set tags+=./tags "add current directory's generated tags file
set tags+=/usr/local/include/c++/tags


set foldmethod=indent
au BufWinLeave * silent mkview
au BufRead * silent loadview
" nnoremap <C-.> za

Plugin 'Tagbar'
let g:tagbar_width=30
map <F8> :NERDTreeToggle<CR>
map <F9> :TagbarToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd VimEnter * NERDTree
wincmd w
autocmd VimEnter * wincmd w

let g:NERDTreeWinSize = 31

let g:ConqueTerm_Color = 2
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_StartMessages = 0
function DebugSession()
    silent make -o vimgdb -gcflags "-N -l"
    redraw!
    if (filereadable("vimgdb"))
        ConqueGdb vimgdb
    else
        echom "Couldn't find debug file"
    endif
endfunction
function DebugSessionCleanup(term)
    if (filereadable("vimgdb"))
        let ds=delete("vimgdb")
    endif
endfunction
call conque_term#register_function("after_close", "DebugSessionCleanup")
nmap <leader>d :call DebugSession()<CR>;

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" golang config
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <leader>r: Run
au FileType go nmap <leader>c: Continue
au FileType go nmap <leader>n: Execute next line
au FileType go nmap <leader>p: Print variable under cursor
au FileType go nmap <leader>b: Toggle breakpoint

let g:go_disable_autoinstall = 1
" let $GOPATH = "/Users/Snail/work/golang/go:/User/Snail/work/golang/workspace"
" let $GOROOT = "/usr/local/go"
" let $GOBIN = "/usr/local/go/bin"
""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

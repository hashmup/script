set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

""""""""""""""""""""""""""""
" NeoBundle begin
"""""""""""""""""""""""""""
let g:neobundle_default_git_protocol='https'
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

"""""""""""""""""""""""""""""
" NeoBundleでインストールするプラグイン
"""""""""""""""""""""""""""""
NeoBundle 'mopp/AOJ.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimproc',{
  \ 'build':{
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin'  : 'make -f make_cygwin.mak',
    \ 'mac'     : 'make -f make_mac.mak',
    \ 'unix'    : 'make -f make_unix.mak',
  \ },
\ }

" Ruby関連
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
"colorscheme
NeoBundle 'tomasr/molokai'
NeoBundle 'ujihisa/unite-colorscheme'

call neobundle#end()
""""""""""""""""""""""""""""""
" NeoBundle end
""""""""""""""""""""""""""""""

filetype plugin indent on

""""""""""""""""""""""""""""""
" plugin関係なし
""""""""""""""""""""""""""""""
set number
set tabstop=4
set autoindent
set expandtab
set shiftwidth=2
set noswapfile
set ruler
set cmdheight=2
set laststatus=1
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set title
set wildmenu
set showcmd
set backupdir=$HOME/.vimbackup
set browsedir=buffer
set smartcase
set hlsearch
set background=dark
set incsearch
set hidden
set list
set showmatch
set smartindent
set smarttab
set t_Co=256
syntax on
highlight LineNr ctermfg=darkblue
""""""""""""""""""""""""""""""
" 全角スペースの可視化
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace','　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 挿入モード時にステータス行の色を変える
""""""""""""""""""""""""""""""
let g:hi_insert='highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
if has('syntax')
    augroup InsetHook
        autocmd!
        autocmd InsertEnter * call s:StatusLine('Enter')
        autocmd InsertLeave * call s:StatusLine('Leave')
    augroup END
endif

let s:slhlcmd=''
function! s:StatusLine(mode)
    if a:mode=='Enter'
        silent! let s:slhlcmd='highlight ' . s:GetHighlight('StatusLine')
        silent exec g:hi_insert
    else
        highlight clear StatusLine
        silent exec s:slhlcmd
    endif
endfunction

function! s:GetHighlight(hi)
    redir => hl
    exec 'highlight '.a:hi
    let hl = substitute(hl,'[\r\n]','','g')
    let hl = substitute(hl,'xxx','','')
    return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" paste時のインデントの崩れを防ぐ
""""""""""""""""""""""""""""""
set pastetoggle=<F10>
nnoremap <F10> :set paste!<CR>:set paste?<CR>
""""""""""""""""""""""""""""""
" カーソル位置の復元
""""""""""""""""""""""""""""""
if has('autocmd')
    autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" plugin関係あり
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" 1. Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"color scheme
colorscheme molokai
if &term =~ "xterm-256color" || "screen-256color"
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

""""""""""""""""""""""""""""""
" 2. fugitive.vimの設定
""""""""""""""""""""""""""""""
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" ステータス業に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

""""""""""""""""""""""""""""""
" 3. vim-indent-guidesの設定
""""""""""""""""""""""""""""""
" vimを立ち上げた時に、自動的にvim-indent-guidesをonにする
let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""""""""""""""""""
" 4. emmet-vimの設定
""""""""""""""""""""""""""""""
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.emmet_snippets_custom.json')),"\n"))

""""""""""""""""""""""""""""""
" 5. vim-quickrunの設定
""""""""""""""""""""""""""""""
let g:quickrun_config={'*': {'split': ''}}
set splitright

""""""""""""""""""""""""""""""
" 6. AOJ.vimの設定
""""""""""""""""""""""""""""""
let g:aoj#user_id = 'ywizowoz'

""""""""""""""""""""""""""""""
" 7. neocomplcache.vimの設定
""""""""""""""""""""""""""""""

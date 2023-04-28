" Software Design 2015/01 26page
if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

" neobundle.vim自身をneobundle.vimで管理する
NeoBundleFetch 'Shougo/neobundle.vim'

" ヘルプの日本語化
NeoBundle 'vim-jp/vimdoc-ja'
" 現在開いているファイルをVim内で直接実行し、結果を表示。
NeoBundle 'thinca/vim-quickrun'
" カラースキーム 使っていない。
"NeoBundle 'junegunn/seoul256.vim'

call neobundle#end()

filetype plugin indent on

" プラグインがインストールされているかチェック
NeoBundleCheck

if !has('vim_starting')
    " .vimrcを読み込み直したときのための設定
    call neobundle#call_hook('on_source')
endif

set helplang=ja,en

set nocompatible        " Use Vim defaults (much better!)
set bs=indent,eol,start         " allow backspacing over everything in insert mode
set backup             " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=%dm
     set t_Sf=%dm
endif


" タブを常に表示
set showtabline=2

" http://d.hatena.ne.jp/d4-1977/20090120/1232468182
"----------------------------------------------------------
" 文字コードの指定
set enc=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,utf-8,euc-jp,cp932

"----------------------------------------------------------
" タブの画面上での幅
set tabstop=4
" タブを挿入するときの幅
set shiftwidth=4
" タブをスペースに展開する (expandtab:展開する) 
"set noexpandtab
set expandtab
" ルーラーを表示 (noruler:非表示) 
"set ruler
set noruler
" タブや改行を表示 (list:表示) 
"set nolist
"set list

" インクリメンタルサーチ
set incsearch

" 行番号表示
set number
"---------------------------------------------------------
" 自動的にインデントする (noautoindent:インデントしない) 
" set autoindent
set noautoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない) 
set wrapscan
" テキスト挿入中の自動折り返しを日本語に対応させる
"set formatoptions+=mM
" テキスト挿入中に自動折り返ししない
set formatoptions=q
" 日本語整形スクリプト(by. 西岡拓洋さん)用の設定
let format_allow_over_tw = 1    " ぶら下り可能幅
" コマンドをステータス行に表示
set showcmd
"---------------------------------------------------------
" プラグインファイルの置き場所を追加する
"
" syntaxを追加する
augroup filetypedetect
au BufNewFile,BufRead *.as  setf actionscript
augroup END 

" swpファイルの保存場所を変更し、Dropboxの同期対象外に。
" http://d.hatena.ne.jp/RKTM/20070825/1188065053
set backupdir=/tmp
set directory=/tmp

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" カラースキーマ
"colorscheme desert


" ウィンドウ上部のタブ部分を無効に
" set guioptions-=T

" MacVim.appを起動時の設定
"if has("gui_running")
"  フルスクリーンモードする
"  set fuoptions=maxvert,maxhorz
"  au GUIEnter * set fullscreen
"  IMを無効化
"  set imdisable
"  透明度を指定 0 - 100
"  set transparency=15
"else
" Macターミナルのカラー設定
" http://qiita.com/Humangas/items/848f0318dfc3c6f5b8e2
"  set background=dark
"  colorscheme solarized
"  let g:solarized_termcolors=256
"endif
" シンタックス
"syntax enable
"

" Software Design 2017年10月号
call plug#begin('~/.vim/plugged')
" gina.vim の指定
Plug 'lambdalisue/gina.vim'
" 上記したプラグインの初期化処理
call plug#end()
" vimdiffで横分割を使う設定
" Gina は diffoptの値で分割方向を決めるので、ここで指定する。
"set diffopt+=vertical

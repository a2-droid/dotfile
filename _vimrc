
"common
"文字コード
scriptencoding utf-8
" 'm'を入力すると検索の強調を消す
nmap <silent>m :noh<CR>
map <silent>m :noh<CR>
" 60列、81列目に線を表示する
set colorcolumn=60,81
" 行番号を表示
set nu
" 現在の行に下線を表示
set cursorline
" TODO 何だっけ？
set clipboard+=unnamed
" 行番号の表示スペース 6マス分
set numberwidth=6
" 検索などをした時に画面中央に表示
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
" 半ページ送りの時画面中央に表示
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
"シンタックスON　色つけるやつ
syntax on
"タブを表示するときの幅
set expandtab
set tabstop=4
set shiftwidth=4
"自動でインデント
set autoindent

"検索の設定
"ハイライト
set hlsearch
"下まで検索したら戻る
set wrapscan
"検索中のハイライト
set showmatch

"7.4からバックスペースで改行などが消せなくなったので追加した
set backspace=indent,eol,start
"ctr+j,kで移動量を多くする
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
"挿入モード時にCtrl+h,j,k,lで移動出来るように変更
imap <C-h> <Left>
imap <C-l> <Right>
imap <C-k> <Up>
imap <C-j> <Down>
" 移動量を増やす（使わないかもだから消す予定
noremap J 5jzz
noremap K 5kzz
"全角スペースの可視化
function! DoubleByteSpace()
    highlight DoubleByteSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction
if has('syntax')
    augroup DoubleByteSpace
        autocmd!
        autocmd ColorScheme * call DoubleByteSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('DoubleByteSpace', '　')
    augroup END
    call DoubleByteSpace()
endif
"ペースモード
"挿入モード以外の^pをset pasteのトグルに変更
"挿入モードは補完に使うため
nmap <silent><C-p> :call SetPaste()<CR>
vmap <silent><C-p> :call SetPaste()<CR>
omap <silent><C-p> :call SetPaste()<CR>
function SetPaste()
    if &paste
        set nopaste
    else
        set paste
    endif
endfunction
"タブ、空白、改行の可視化
set list
"set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%

" TODO 何だっけ？
set modeline
set modelines=3
" なんの設定か忘れた
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"


if has('mac') "setting for mac

    set t_Co=256

    " マウス操作許可のはず
    set mouse=a

    "挿入モード以外の^nをset numberのトグルに変更
    "挿入モードは補完に使うため
    nmap <silent><C-n> :call Setnumber()<CR>
    vmap <silent><C-n> :call Setnumber()<CR>
    omap <silent><C-n> :call Setnumber()<CR>

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " function for mac
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    function Setnumber()
        if !&number && &relativenumber
            set number
            set norelativenumber
        elseif &number && !&relativenumber
            set relativenumber
            set nonumber
        else
            set number
            set norelativenumber
        endif
    endfunction

    " vim version 7.04 からの設定よう
    if version > 703
        if has('vim_starting')
            set runtimepath+=~/.vim/bundle/neobundle.vim/
        endif

        "neobundleを使う上で必要なもの
        "ファンクションの呼び出しneobundleはクラスかな？
        call neobundle#begin(expand('~/.vim/bundle/'))
        "謎？
        NeoBundleFetch 'Shougo/neobundle.vim'
        "ファイルタイプ用のプラグインとインデントを自動読み込みをonにする
        filetype plugin indent on
        NeoBundleCheck

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "NeoBundleからインストールするパッケージはここに追加する"
        " status lineのデザイン用だったはず
        NeoBundle 'itchyny/lightline.vim'
        " インデント用プラグイン
        NeoBundle 'nathanaelkane/vim-indent-guides'
        "左側にディレクトリツリーを表示してくるぱっけーじ
        NeoBundle 'scrooloose/nerdtree'

        "補完候補などを表示してくれるプラグインらしい
"        NeoBundle 'Shougo/neocomplete.vim'
"        NeoBundle 'violetyk/neocomplete-php.vim'
"        NeoBundle 'Shougo/neosnippet'
"        NeoBundle 'Shougo/neosnippet-snippets'
        "ファイル操作系 後で決める TODO
"        NeoBundle 'Shougo/unite.vim'
"        NeoBundle 'ujihisa/unite-colorscheme'
"        "markdown関係
"        NeoBundle 'plasticboy/vim-markdown'
"        NeoBundle 'kannokanno/previm'
"        NeoBundle 'tyru/open-browser.vim'
"        "なんだっけ?
"        NeoBundle 'Shougo/vimproc', {
"            \ 'build' : {
"                \ 'windows' : 'make -f make_mingw32.mak',
"                \ 'cygwin' : 'make -f make_cygwin.mak',
"                \ 'mac' : 'make -f make_mac.mak',
"                \ 'unix' : 'make -f make_unix.mak',
"            \ },
"        \ }
"        "
"        NeoBundle 'jonathanfilip/vim-lucius'
"        NeoBundle 'vim-scripts/javacomplete'
"        "python用プラグイン
"        NeoBundle 'davidhalter/jedi-vim'
"        NeoBundle 'grep.vim'
        call neobundle#end()
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "ステータスラインを表示させるのとデザイン
        set laststatus=2
        let g:lightline = {
              \ 'colorscheme': 'wombat',
              \ }

        "indentの可視化
        let g:molokai_original=1
        let g:indent_guides_auto_colors=0
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=236
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=235
        let g:indent_guides_enable_on_vim_startup=1

"        "Neocompleteの設定
"        let g:neocomplete#enable_at_startup = 1
"        "phpプラグインの設定
"        "let g:neocomplete_php_locale = 'ja'
        "NERDTreeの設定
        "隠しファイルをdefaultで表示
        let NERDTreeShowHidden = 1
        "^qでNERDTREEを開く&閉じる
        nmap <silent> <C-e> :NERDTreeToggle<CR>
        vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
        omap <silent> <C-e> :NERDTreeToggle<CR>
        "挿入モードの時はNERDTreeの処理をさせない
        "imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
        "引数なしの時NERDTREEを開く
        autocmd vimenter * if !argc() | NERDTree | endif
        "NERDTreeを開いた状態で閉じたらNERDTreeも閉じる
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
        let g:NERDTreeMinimalUI=1
        let g:NERDTreeDirArrows=1
        "マウスオプション
        "terminal上のvimで元々有効になるやつじゃないからここでは意味がない
        let g:NERDTreeMouseMode=3

        "カラースキーマの設定
        colorscheme default
        "コメントの文字が見にくかったから変えたやつ
        hi Comment ctermfg=22
        hi colorcolumn ctermbg=233
        hi Directory ctermfg=14
        hi String ctermfg=12
        hi Search ctermbg=11 ctermfg=0  guibg=Yellow guifg=Black
        hi LineNr ctermbg=235 ctermfg=120
        hi VertSplit ctermbg=123 ctermfg=237
        hi Number ctermfg=208
        hi Type ctermfg=10
        hi Question ctermfg=10
        hi MoreMsg ctermfg=10
        hi Boolean ctermfg=135
        hi CursorLineNr ctermfg=130
        "let g:indentLine_color_term = 111
        "let g:indentLine_char = '¦'

        "折り返しの設定
        "set breakindent
        "set breakindentopt=shift:4
   endif "version >703 end
else "no thing
    " とりあえずなし
endif


"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup
"クリップボードをWindowsと連携
set clipboard=unnamed
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"タブ文字、行末など不可視文字を表示する
"set list
"行番号を表示する
set number
""シフト移動幅
set shiftwidth=4
""閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
""新しい行を作ったときに高度な自動インデントを行う
set autoindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
""ファイル内の  が対応する空白の数
set tabstop=4
"カッコ自動補完
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

"カレント行をハイライト
set cursorline
set cursorcolumn

"可憐とウィンドウのみにライン
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black


"colorscheme
syntax on
colorscheme molokai

"ステータスライン
let g:Powerline_symbols = 'fancy'


"前回閉じた時の場所
if has("autocmd")
	    autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
endif

set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
set nowrapscan
""入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"ファイルの認識
augroup filetypedetect
autocmd BufNewFile,BufRead *.cgi   set filetype=perl
autocmd BufNewFile,BufRead *.fcgi   set filetype=perl
autocmd BufNewFile,BufRead *.pm   set filetype=perl
augroup END

augroup SkeletonAu
autocmd!
autocmd BufNewFile *.pl 0r /Users/Yujiro/.vim/.pl
autocmd BufNewFile *.cgi 0r /Users/Yujiro/.vim/.pl
autocmd BufNewFile *.fcgi 0r /Users/Yujiro/.vim/.pl
augroup END

"c-nでsyntaxチェック、c-eで実効
autocmd FileType perl :map <C-n> <ESC>:!perl -cw %<CR>
autocmd FileType perl :map <C-e> <ESC>:!perl %<CR>

"----------------------------------------------------
" neobundle.vim
"----------------------------------------------------
set nocompatible
filetype plugin indent off

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif


NeoBundle 'petdance/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'vim-scripts/taglist.vim'

filetype plugin indent on


" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:neocomplcache_ctags_arguments_list = {
\ 'perl' : '-R -h ".pm"'
\ }

let g:neocomplcache_snippets_dir = "~/.vim/snippets"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
\ 'default'    : '',
\ 'perl'       : $HOME . '/.vim/dict/perl.dict'
\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" for snippets
"imap <expr><C-k>neocomplcache#sources#snippets_complete#expandable() ?\<Plug>(neosnippet)" : "\<C-n>"
"smap <C-k> <Plug>(neosnippet))
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
	    autocmd VimEnter * NERDTree ./
endif

"ctags
"set tags = tags
"let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"  " ctagsのコマンド
"let Tlist_Show_One_File = 1                         " 現在表示中のファイルのみのタグしか表示しない
"let Tlist_Use_Right_Window = 1                    " 右側にtag listのウインドうを表示する
"let Tlist_Exit_OnlyWindow = 1                      " taglistのウインドウだけならVimを閉じる
"\lで実効
"map <silent> <leader>l :TlistToggle<CR>     



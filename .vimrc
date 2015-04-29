"バックアップファイルを作るディレクトリ
"set backupdir=$HOME/vimbackup
"クリップボードをWindowsと連携
set clipboard=unnamed
"変更中のファイルでも、保存しないで他のファイルを表示
"set hidden
"タブ文字、行末など不可視文字を表示する
"set list
"行番号を表示する
set number
"ファイル内の  が対応する空白の数
set tabstop=4
set expandtab
"シフト移動幅
set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
"set autoindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"カッコ自動補完
"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>

"カレント行をハイライト
set cursorline
set cursorcolumn

"可憐とウィンドウのみにライン
"augroup cch
"autocmd! cch
"autocmd WinLeave * set nocursorline
"autocmd WinEnter,BufRead * set cursorline
"augroup END
"
"hi clear CursorLine
"hi CursorLine gui=underline
"highlight CursorLine ctermbg=black guibg=black
	

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

augroup filetypedetect 
	autocmd BufNewFile,BufRead *.pig set filetype=pig syntax=pig 
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
 	call neobundle#begin(expand('~/.vim/bundle/'))
 	NeoBundleFetch 'Shougo/neobundle.vim'
 	call neobundle#end()
endif


NeoBundle 'petdance/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'smartchr'
"NeoBundle 'honza/vim-snipmate'

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


"for snippets
"let g:neosnippet#snippets_directory = '~/.vim/bundle/snipmate-snippets/snippets'
"'~/.vim/snippets'

imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <C-k> <Plug>(neocomplcache_snippets_expand)

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
	    autocmd VimEnter * NERDTree ./
endif

"ctags
"set tags = tags
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"  " ctagsのコマンド
let Tlist_Show_One_File = 1                         " 現在表示中のファイルのみのタグしか表示しない
let Tlist_Use_Right_Window = 1                    " 右側にtag listのウインドうを表示する
let Tlist_Exit_OnlyWindow = 1                      " taglistのウインドウだけならVimを閉じる
"\lで実効
map <silent> <leader>l :TlistToggle<CR>     

" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key="'"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

"smartchr
"inoremap <expr> = smartchr#loop(' = ', ' == ', ' === ', '=')

""vimfilter
"
"let file_name = expand("%")
"if has('vim_starting') &&  file_name == ""
"	    autocmd VimEnter * VimFilerBufferDir ./
"endif
"
""unite {{{
"
""unite prefix key.
"nnoremap [unite] <Nop>
"nmap <Space>f [unite]
"
""インサートモードで開始しない
"let g:unite_enable_start_insert = 0
"
"" For ack.
"if executable('ack-grep')
"	let g:unite_source_grep_command = 'ack-grep'
"	let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
"	let g:unite_source_grep_recursive_opt = ''
"endif
"
""file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
"let g:unite_source_file_mru_filename_format = ''
"
""data_directory はramdiskを指定
""if has('win32')
""	let g:unite_data_directory = 'R:\.unite'
""elseif  has('macunix')
""	let g:unite_data_directory = '/Volumes/RamDisk/.unite'
""else
""	let g:unite_data_directory = '/mnt/ramdisk/.unite'
""endif
"
""bookmarkだけホームディレクトリに保存
"let g:unite_source_bookmark_directory = $HOME . '/.unite/bookmark'
"
"
""現在開いているファイルのディレクトリ下のファイル一覧。
""開いていない場合はカレントディレクトリ
"nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
""バッファ一覧
"nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
""レジスタ一覧
"nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
""最近使用したファイル一覧
"nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
""ブックマーク一覧
"nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
""ブックマークに追加
"nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
""uniteを開いている間のキーマッピング
"augroup vimrc
"	autocmd FileType unite call s:unite_my_settings()
"augroup END
"function! s:unite_my_settings()
"	"ESCでuniteを終了
"	nmap <buffer> <ESC> <Plug>(unite_exit)
"	"入力モードのときjjでノーマルモードに移動
"	imap <buffer> jj <Plug>(unite_insert_leave)
"	"入力モードのときctrl+wでバックスラッシュも削除
"	imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
"	"sでsplit
"	nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
"	inoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
"	"vでvsplit
"	nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
"	inoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
"	"fでvimfiler
"	nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
"	inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
"endfunction
"
""}}}
"
""vimfiler {{{
"
""data_directory はramdiskを指定
""if has('win32')
""	let g:vimfiler_data_directory = 'R:\.vimfiler'
""elseif  has('macunix')
""	let g:vimfiler_data_directory = '/Volumes/RamDisk/.vimfiler'
""else
""	let g:vimfiler_data_directory = '/mnt/ramdisk/.vimfiler'
""endif
"
""vimデフォルトのエクスプローラをvimfilerで置き換える
"let g:vimfiler_as_default_explorer = 1
""セーフモードを無効にした状態で起動する
"let g:vimfiler_safe_mode_by_default = 0
""現在開いているバッファのディレクトリを開く
"nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
""現在開いているバッファをIDE風に開く
"nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
"
""デフォルトのキーマッピングを変更
"augroup vimrc
"	autocmd FileType vimfiler call s:vimfiler_my_settings()
"augroup END
"function! s:vimfiler_my_settings()
"	nmap <buffer> q <Plug>(vimfiler_exit)
"	nmap <buffer> Q <Plug>(vimfiler_hide)
"endfunction
"
""}}}
"

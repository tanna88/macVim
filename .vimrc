
set nocompatible
set history=1024
set cf                                " enable error files and error jumping
set ffs=unix,dos,mac                  " support these files
filetype on
filetype plugin on
filetype indent on
set isk+=_,$,@,%,#,-
set modeline
set autoread                          " reload file
set tabpagemax=50                     " open 50 tabs max
set splitbelow


"-----------------------------------------------------------------------------
" Colors/ Theme
"-----------------------------------------------------------------------------
colo bocau
set guifont=ProggyCleanTT\ 11

if has("syntax")
  syntax on
endif

set hls                               " Highlighting search result

"-----------------------------------------------------------------------------
" Backup
"-----------------------------------------------------------------------------
set nobackup
set nowritebackup
set noswapfile
set backupdir=/tmp/
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp

"-----------------------------------------------------------------------------
" UI
"-----------------------------------------------------------------------------
set ruler                             " show cursor position all the time
set nolazyredraw
set number                            " set line number on
set wildmenu
set ch=1                              " command line height
set backspace=2
set report=0                          " tell us about changes
set guioptions=aegitcm
win 180 50
set laststatus=2                      " always show status line
set mousehide                         " hide mouse after chars typed
set mouse=a                           " mouse in all modes

"-----------------------------------------------------------------------------
" Visual cues
"-----------------------------------------------------------------------------
set showmatch
set incsearch
set ignorecase                        " case insensitive search
set mat=5                             " bracket blinking
set novisualbell                      " no blinking

"highlight ExtraWhitespace ctermbg=yellow guibg=yellow
"match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()

"autocmd BufWritePre * :%s/\s\+$//e

"-----------------------------------------------------------------------------
" Text formatting
"-----------------------------------------------------------------------------
set autoindent
set smartindent
set nowrap
set tabstop=8
set softtabstop=8
set nosmarttab
set formatoptions+=n
set shiftwidth=8
set encoding=utf-8
set vb t_vb=
set virtualedit=all
set textwidth=80
set smartcase
"set expandtab=false
set noexpandtab

set foldmethod=indent
set foldnestmax=2
set nofoldenable                        "don't fold by default
set foldlevel=1
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set cindent

"-----------------------------------------------------------------------------
" Mapping keys
"-----------------------------------------------------------------------------
" remap Leader to , instead of \
"let mapleader = "/"
map <F7> :cn<CR>

" use ctrl + prev/next to browse tab
"map [5^ gT
"map [6^ gt
"map <C-N> :tabnew<CR>
"map <C-T> :tabnex<CR>:cd %:p:h<CR>:<CR>
"Ctrl-left arrow – move one tab to the left
"map <C-left> :tabp<CR>

"Ctrl-right arrow – move one tab to the right
"map <C-right> :tabn<CR>

"save
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

map <M-J> :m +1 <CR>
map <M-K> :m -2 <CR>
vnoremap <M-J> dp'[V']
vnoremap <M-K> dkP'[V']
map <F2> :NERDTreeToggle<CR>
"nmap <tab> v>

"vmap <tab> >gv
"vmap <tab> >gv

"a trick for sudo save
cmap w!! w !sudo tee % >/dev/null

" map esc
"imap ;; <Esc>
imap jk <Esc>
imap kj <Esc>
imap <s-CR> <CR><CR>end<Esc>ki
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gA :Ack <cword><CR>

"inoremap <Left> <NOP>
"Enable arrow key for FuzzyFinder
"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
nnoremap <silent> <F3> :TlistToggle<CR>
nnoremap <silent> <F4> :CommandT<CR>
nnoremap <silent> <F5> :CommandTBuffer<CR>
"nnoremap <Leader>f :FufFile<CR>
"recursive search for FufFile
let g:fuf_abbrevMap = {
  \   "^ " : [ "**/", ],
  \ }
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
"clear highlight search
nnoremap <Esc> :noh<CR><Esc>

"Ctrl + S to save
map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>

"Ctrl + Space to auto complete on local buff
imap <C-Space> <C-P>
"move to next/previous line with same indentation
nnoremap <M-,> k:call search('^'. matchstr(getline(line('.')+1), '\(\s*\)') .'\S', 'b')<CR>^
nnoremap <M-.> :call search('^'. matchstr(getline(line('.')), '\(\s*\)') .'\S')<CR>^

"autotest
nmap <Leader>fd :cf /tmp/autotest.txt<CR> :compiler rubyunit<CR>

"rspec test
map <Leader>r :SweetSpec<CR>
map <Leader>R :SweetSpecRunAtLine<CR>
map <Leader>L :SweetSpecRunLast<CR>


"-----------------------------------------------------------------------------
" Auto commands
"-----------------------------------------------------------------------------
" Edit .vimrc
au! BufRead,BufNewFile *.haml setfiletype haml

"auto open NERDTree when start
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"NERD Tree
"let g:NERDCreateDefaultMappings=0
"let g:NERDSpaceDelims=1
"let g:NERDShutUp=1
"let g:NERDTreeHijackNetrw=0

"-----------------------------------------------------------------------------
" Ruby related
"-----------------------------------------------------------------------------
compiler rubyunit
let g:rubytest_in_quickfix = 0              " minimal ruby test error message
let g:rubytest_cmd_test = "ruby %p"
let g:rubytest_cmd_testcase = "ruby %p -n '/%c/'"
let g:rubytest_cmd_spec = "spec -f specdoc %p"
let g:rubytest_cmd_example = "spec -f specdoc %p -e '%c'"
let g:rubytest_cmd_feature = "cucumber %p"
let g:rubytest_cmd_story = "cucumber %p -n '%c'"
"au Filetype ruby call Foldsearch("")
au Filetype ruby let b:foldsearchprefix='\v^\s*(#.*)?$'


let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)
let tlist_sql_settings = 'sql;P:package;t:table'
let tlist_ant_settings = 'ant;p:Project;r:Property;t:Target'
"let Tlist_Ctags_Cmd = $VIM.'/vimfiles/ctags.exe' " location of ctags tool
set tags=tags;/
"auto update ctags after file was saved
au BufWritePost .rb,.c,.cpp,*.h silent! !ctags -R &
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/gem/**;vendor/plugins/**;coverage/**;tmp/**;rdoc/**"
let g:fuf_splitPathMatching=1

" Auto indicating changes
"let g:changes_autocmd=1
let g:changes_vcs_system='git'

"Mini buffer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

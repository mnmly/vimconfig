call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

if has("gui_running")
	set guioptions=egmrt
endif

set number
set cursorline
set autoindent
set linespace=3
set nowrap


let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
filetype on

"Set incremental searching
set incsearch

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType objc set omnifunc=objc#cocoacomplete#Complete

" Auto detect less and treat as css
autocmd BufRead *.less set omnifunc=csscomplete#CompleteCSS syntax=less


let g:SuperTabDefaultCompletionType = "context"
set completeopt=menu
"Python 
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"Jad3
autocmd BufRead *.jade set smartindent tabstop=2 softtabstop=2 shiftwidth=2

" SnipMate
autocmd FileType python set ft=python.django
autocmd FileType html set ft=htmldjango.html

" Open vimrc
nmap ,ev : tabedit $MYVIMRC<cr>

" Change zen coding key map
let g:user_zen_expandabbr_key = '<C-e>'

"-------------------------------------------------
" Abbreviations 
"-------------------------------------------------

"iabbrev mysite ftp://jeff-way.com@jeffrey-way.com/domains/
abbrev ff :! open -a firefox.app %p<cr>
abbrev chrome :! open -a Google\ Chrome.app %p<cr>


"-------------------------------------------------
" Key Mapping 
"-------------------------------------------------
let mapleader = ","
nmap <space> :
:noremap <silent> <leader>h :set hls!<CR>

"Map escape key to jj
imap jj <esc>

"Map ,is to => 
autocmd FileType ruby iab @is =>

"-------------------------------------------------
" Auto-save
"-------------------------------------------------
set nobackup
set noswapfile

"-------------------------------------------------
" Spellings
"-------------------------------------------------
iab teh the
iab Teh The
iab obejct object


"-------------------------------------------------
" Window Setting Mappings 
"-------------------------------------------------
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"-------------------------------------------------
" Javascript folding settings
"-------------------------------------------------
function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen

"-------------------------------------------------
" PeepOpen Settings
"-------------------------------------------------

if has("gui_macvim")
    map <D-t> <Plug>PeepOpen
end


"-------------------------------------------------
" snipMate Settings
"-------------------------------------------------
let g:SuperTabDefaultCompletionType = "context"
:filetype plugin on
let g:acp_behaviorSnipmateLength = 1

if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

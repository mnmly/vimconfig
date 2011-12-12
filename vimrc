call pathogen#infect()

syntax on
filetype plugin on

if has("gui_running")
	set guioptions=egmrt
endif

set number
set cursorline
set autoindent
set linespace=3
set nowrap


let g:netrw_browse_split = 2
let g:netrw_altv = 1

filetype on

"Set incremental searching
set incsearch

set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

autocmd FileType python set omnifunc=pythoncomplete#Complete|set tabstop=4|set shiftwidth=4|set softtabstop=4
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType objc set softtabstop=4|set shiftwidth=4
autocmd BufRead *.less set omnifunc=csscomplete#CompleteCSS syntax=less
autocmd BufRead *.sass set tabstop=2|set shiftwidth=2|set softtabstop=2

"JSDoc vim plugin
au FileType javascript nnoremap <buffer> <C-c>  :<C-u>call WriteJSDocComment()<CR>

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
"autocmd FileType ruby iab @is =>
inoremap <C-f> <C-x><C-o>
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
"let g:SuperTabDefaultCompletionType = "context"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enahle_smart_case            = 1
let g:neocomplcache_enable_camel_case_completion = 1
" we don't want the completion menu to auto pop-up when we are in text files
let g:neocomplcache_lock_buffer_name_pattern = '\v(\.md|\.txt)'

:filetype plugin on
let g:acp_behaviorSnipmateLength = 1

if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif


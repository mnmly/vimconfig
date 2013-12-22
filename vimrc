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

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set tabstop=4|set shiftwidth=4|set softtabstop=4
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS|set softtabstop=2
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType objc set softtabstop=4|set shiftwidth=4
autocmd FileType cpp set softtabstop=4|set shiftwidth=4
autocmd BufRead *.less set omnifunc=csscomplete#CompleteCSS syntax=less
autocmd BufRead *.sass set tabstop=2|set shiftwidth=2|set softtabstop=2
autocmd BufRead *.styl set tabstop=2|set shiftwidth=2|set softtabstop=2
autocmd BufRead *.coffee set tabstop=2|set shiftwidth=2|set softtabstop=2|set syntax=coffee
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

" Hard mode
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

"JSdoc git://github.com/tanabe/WriteJSDocComment.vim.git
"au FileType javascript nnoremap <buffer> <C-c>  :<C-u>call WriteJSDocComment()<CR>



let g:SuperTabDefaultCompletionType = "context"
set completeopt=menu
"Python 
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"Jade
autocmd BufRead *.jade set smartindent tabstop=2 softtabstop=2 shiftwidth=2

" Open vimrc
nmap ,ev : tabedit $MYVIMRC<cr>

" Change zen coding key map
let g:user_zen_expandabbr_key = '<C-e>'

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
" ctrlp.vim
"-------------------------------------------------

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"-------------------------------------------------
" Tabularize
"-------------------------------------------------
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif


"-------------------------------------------------
" snipMate Settings
"-------------------------------------------------
let g:snips_trigger_key = '<C-\>'

"let g:SuperTabDefaultCompletionType = "context"
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_enahle_smart_case            = 1
"let g:neocomplcache_enable_camel_case_completion = 1

" we don't want the completion menu to auto pop-up when we are in text files
" let g:neocomplcache_lock_buffer_name_pattern = '\v(\.md|\.txt)'

:filetype plugin on
let g:acp_behaviorSnipmateLength = 1

if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

"-------------------------------------------------
" Tern
"-------------------------------------------------
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

"-------------------------------------------------
" vim-processing: https://github.com/vortura/vim-processing
"-------------------------------------------------

let g:use_processing_java = 1

"-------------------------------------------------
" tagbar: https://github.com/majutsushi/tagbar/wiki
"-------------------------------------------------
nmap <Leader>l :TagbarToggle<CR>

"let g:syntastic_cpp_include_dirs = ['/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/openFrameworks', '/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/openFrameworks/3d', '/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/openFrameworks/app', '/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/openFrameworks/communication', '/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/openFrameworks/events', '/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/openFrameworks/gl', '/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/openFrameworks/graphics', '/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/openFrameworks/math', '/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/openFrameworks/sound', '/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/openFrameworks/types', '/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/openFrameworks/utils', '/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/openFrameworks/video', '/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/assimp/include','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/assimp/include/Compiler','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/cairo/include','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/cairo/include/cairo','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/cairo/include/libpng15','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/cairo/include/pixman-1','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/fmodex/include','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/FreeImage/include','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/freetype/include','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/freetype/include/freetype2','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/freetype/include/freetype2/freetype','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/freetype/include/freetype2/freetype/config','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/freetype/include/freetype2/freetype/internal','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/freetype/include/freetype2/freetype/internal/services','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/glew/include','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/glew/include/GL','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/glut/include','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/poco/include','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/poco/include/CppUnit','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/poco/include/Poco','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/Crypto','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/Data','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/DOM','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/Dynamic','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/Net','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/SAX','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/Util','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/XML','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/poco/include/Poco/Zip','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/rtAudio/include','/Users/mnmly/Development/of-v0.8.0/apps/projects/cameraBuffer/../../../libs/tess2/include' ]
let g:syntastic_cpp_check_header = 0


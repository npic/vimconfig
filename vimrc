noremap <Left> <nop>
noremap <Down> <nop>
noremap <Up> <nop>
noremap <Right> <nop>
inoremap <Left> <nop>
inoremap <Down> <nop>
inoremap <Up> <nop>
inoremap <Right> <nop>
noremap ; :
noremap <C-H> ^
noremap <C-J> <C-F>
noremap <C-K> <C-B>
noremap <C-L> $
nnoremap <F2> :Texplore<CR>
nnoremap <F3> :call InteractiveGrep("<C-R><C-W>")<CR>
vnoremap <F3> :call InteractiveGrep("<C-R>*")<CR>
nnoremap <F4> :tabnew<CR>
nnoremap <F5> :checktime<CR>:syntax sync fromstart<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
inoremap ( ()<Left>
inoremap {<CR> {<CR>}<Esc>O<Tab>
inoremap {;<CR> {<CR>};<Esc>O<Tab>
inoremap [ []<Left>
inoremap < <><Left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> > strpart(getline('.'), col('.')-1, 1) == ">" ? "\<Right>" : ">"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
set autoindent
set autoread
set expandtab
set fileencodings=utf-8,cp1251,koi8-r,cp866
set ignorecase
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set nobackup
set nohlsearch
set noundofile
set nowritebackup
set number
set pastetoggle=<F6>
set path=$PWD/**
set relativenumber
set shiftwidth=4
set softtabstop=4
set splitbelow
set splitright
set switchbuf+=usetab,newtab
set tabstop=8
filetype plugin on
syntax on
highlight MatchParen ctermbg=4

augroup autorun
    autocmd!
    autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR><C-W>T
augroup END

function! InteractiveGrep(default)
    call inputsave()
    let what = input("Search for: ", a:default)
    call inputrestore()
    if(empty(what))
        return
    endif
    execute "lvimgrep /" . what . "/gj ./**"
    tab lw
endfunction


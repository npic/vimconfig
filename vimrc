noremap <Left> <nop>
noremap <Down> <nop>
noremap <Up> <nop>
noremap <Right> <nop>
nnoremap ; :
vnoremap ; :
nnoremap <C-H> ^
nnoremap <C-J> <C-F>
nnoremap <C-K> <C-B>
nnoremap <C-L> $
vnoremap <C-H> ^
vnoremap <C-J> <C-F>
vnoremap <C-K> <C-B>
vnoremap <C-L> $
nnoremap <F2> :Texplore<CR>
nnoremap <F3> :!grep -i -r -C5 '<C-R><C-W>' . \| less<CR>
nnoremap <F4> :tabnew<CR>
nnoremap <F5> :checktime<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
"vnoremap q* <Esc>`>a*/<Esc>`<i/*<Esc>h
"vnoremap q!* <Esc>`>hxx`<xx
"vnoremap q# :s/^\(\s*\)/\1#/<CR>
"vnoremap q!# :s/^\(\s*\)#/\1/<CR>
"vnoremap q/ :s!^\(\s*\)!\1//!<CR>
"vnoremap q!/ :s!^\(\s*\)//!\1!<CR>
"vnoremap q; :s/^\(\s*\)/\1;/<CR>
"vnoremap q!; :s/^\(\s*\);/\1/<CR>
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
set shiftwidth=4
set softtabstop=4
set splitbelow
set splitright
set tabstop=8
filetype plugin on
syntax on
highlight MatchParen ctermbg=4


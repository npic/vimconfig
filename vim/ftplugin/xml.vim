nnoremap <silent> <buffer> d& :set opfunc=CDATify<CR>g@
nnoremap <silent> <buffer> & :set opfunc=UnCDATify<CR>g@
vnoremap <silent> <buffer> d& :<C-U>call CDATify(visualmode(), 1)<CR>
vnoremap <silent> <buffer> & :<C-U>call UnCDATify(visualmode(), 1)<CR>
inoremap <buffer> < <><Left>
inoremap <buffer> <expr> > strpart(getline('.'), col('.')-1, 1) == ">" ? "\<Esc>F<\"tya<:let @t = substitute(@t, '^<\\([^ >]*\\).*$', '</\\1>', '')\<CR>f>\"tpF<i" : ">"
let g:xml_syntax_folding=1
setlocal foldmethod=syntax
setlocal foldlevel=99
setlocal equalprg=tidy\ -i\ -w\ 0\ -quiet\ -raw\ --doctype\ omit\ --drop-empty-paras\ no\ --input-xml\ yes\ --join-styles\ no\ --literal-attributes\ yes\ --merge-divs\ no\ --merge-spans\ no\ --output-xml\ yes\ --preserve-entities\ yes\ --quote-marks\ no\ --quote-ampersand\ no\ --indent-spaces\ 8\ --show-warnings\ no\ --show-errors\ 0

function! CDATify(type, ...)
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@

    if a:0  " Invoked from Visual mode, use '< and '> marks.
        silent exe "normal! `<" . a:type . "`>d"
    elseif a:type == 'line'
        silent exe "normal! '[V']d"
    elseif a:type == 'block'
        silent exe "normal! `[\<C-V>`]d"
    else
        silent exe "normal! `[v`]d"
    endif

    let @@ = substitute(@@, '&amp;', '\&', 'g')
    let @@ = substitute(@@, '&quot;', '"', 'g')
    let @@ = substitute(@@, '&apos;', "'", 'g')
    let @@ = substitute(@@, '&lt;', '<', 'g')
    let @@ = substitute(@@, '&gt;', '>', 'g')

    silent exe "normal! P"

    let &selection = sel_save
    let @@ = reg_save
endfunction

function! UnCDATify(type, ...)
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@

    if a:0  " Invoked from Visual mode, use '< and '> marks.
        silent exe "normal! `<" . a:type . "`>d"
    elseif a:type == 'line'
        silent exe "normal! '[V']d"
    elseif a:type == 'block'
        silent exe "normal! `[\<C-V>`]d"
    else
        silent exe "normal! `[v`]d"
    endif

    let @@ = substitute(@@, '&', '\&amp;', 'g')
    let @@ = substitute(@@, '"', '\&quot;', 'g')
    let @@ = substitute(@@, "'", '\&apos;', 'g')
    let @@ = substitute(@@, '<', '\&lt;', 'g')
    let @@ = substitute(@@, '>', '\&gt;', 'g')

    silent exe "normal! P"

    let &selection = sel_save
    let @@ = reg_save
endfunction

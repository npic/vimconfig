nnoremap <silent> <buffer> d& :set opfunc=CDATify<CR>g@
nnoremap <silent> <buffer> & :set opfunc=UnCDATify<CR>g@
vnoremap <silent> <buffer> d& :<C-U>call CDATify(visualmode(), 1)<CR>
vnoremap <silent> <buffer> & :<C-U>call UnCDATify(visualmode(), 1)<CR>
inoremap <buffer> < <><Left>
inoremap <buffer> <expr> > strpart(getline('.'), col('.')-1, 1) == ">" ? "\<Right>" : ">"
let g:xml_syntax_folding=1
setlocal foldmethod=syntax
setlocal foldlevel=99

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

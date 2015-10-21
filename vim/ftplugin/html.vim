inoremap <buffer> < <><Left>
inoremap <buffer> <expr> > strpart(getline('.'), col('.')-1, 1) == ">" ? "\<Esc>F<\"tya<:let @t = substitute(@t, '^<\\([^ >]*\\).*$', '</\\1>', '')\<CR>f>\"tpF<i" : ">"
setlocal equalprg=tidy\ -i\ -w\ 0\ -quiet\ -raw\ --doctype\ omit\ --drop-empty-paras\ no\ --input-xml\ yes\ --join-styles\ no\ --literal-attributes\ yes\ --merge-divs\ no\ --merge-spans\ no\ --output-xml\ yes\ --preserve-entities\ yes\ --quote-marks\ no\ --quote-ampersand\ no\ --indent-spaces\ 4\ --show-warnings\ no\ --show-errors\ 0

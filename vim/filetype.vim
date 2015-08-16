if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    autocmd!
    autocmd BufNewFile,BufRead *.cls,*.trigger,*.resource set filetype=sfapex
    autocmd BufNewFile,BufRead *.page,*.component,*.scf set filetype=sfvf
augroup END


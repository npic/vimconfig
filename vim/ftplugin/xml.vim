let g:xml_syntax_folding=1
setlocal foldmethod=syntax
setlocal foldlevel=99
let $XMLLINT_INDENT="	"
setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Quoting and commenting functions

function qcom#LineComment(start)
    execute "s/^/" . a:start . "/"
endfunction

function qcom#BlockComment(start, end)
    execute "s/\\%'<\\(\\_.\\)\\%'>/" . a:start . "\\1" . a:end . "/"
endfunction


" echom "hell"
nnoremap <localleader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <localleader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
  let saved_unnaamed_register = @@

  if a:type ==# 'v'
    execute "normal! `<v`>y"
  elseif a:type ==# 'char'
    execute "normal! `[v`]y"
  else
    return
  endif

  silent execute "grep! " . shellescape(@@) . " ."
  copen

  echom shellescape(@@)
  echom a:type

  let @@ = saved_unnaamed_register
endfunction

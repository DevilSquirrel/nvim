" source $HOME\AppData\Local\nvim\plugin\grep-operator.vim
" source $HOME\AppData\Local\nvim\plugin\functional.vim

" echom "保存成功!"
" echo $MYVIMRC
" set number
" set numberwidth=4
" set shiftwidth=5
" set tabstop=2
" set softtabstop=2
" set shiftwidth=2
" set autoindent
" nmap \ dd
" let mapleader  = "-"
let maplocalleader   = "-"
" nnoremap <localleader>d dd
" nnoremap <localleader>ev :vsplit $XDG_CONFIG_HOME.."/nvim/test.vim"<cr>
" nnoremap <localleader>sv :source $XDG_CONFIG_HOME.."/nvim/test.vim"<cr>

" iabbrev sele <a-select v-model="">\\<a-select>

" inoremap ssig -- <cr>Steve Losh<cr>steve@stevelosh.com
" iunmap ssig
" iabbrev ssig -- <cr>Steve Losh<cr>steve@stevelosh.com
" autocmd FileType javascript :iabbrev <buffer> iff if ()<Del><left>
" Vimscript file settings ---------------------- {{{
" augroup filetype_vim
"     autocmd!
"     autocmd FileType vim setlocal foldmethod=marker
" augroup END
" }}}

nnoremap <localleader>ev :vsplit C:\Users\Administrator\AppData\Local\nvim\test.vim<cr>
nnoremap <localleader>es :w<cr>:source C:\Users\Administrator\AppData\Local\nvim\test.vim<cr>
" 缩写
iabbrev waht what
" inoremap ssig -- <cr>Steve Losh<cr>steve@stevelosh.com
" iabbrev ssig -- <cr>Steve Losh<cr>steve@stevelosh.com
" iunmap ssig
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
vnoremap <leader>" <esc>a"<esc>gvo<esc>i"<esc>gvoll<esc>
vnoremap <leader>' <esc>a'<esc>gvo<esc>i'<esc>gvoll<esc>

augroup testgroup 
  autocmd!
  autocmd BufWrite * :normal zz
augroup END
" autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
" autocmd FileType javascript :iabbrev <buffer> iff if ()<left><left>
" autocmd BufWrite * :sleep 200m

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


" let &textwidth=&textwidth+10
" set textwidth?
" echom &textwidth
" echom &wrap

function Meow()
  echom "Newo"
endfunction

function GetMeow()
  return "Meow String"
endfunction

function TextwidthIsTooWide()
  if(&l:textwidth># 80)
    return 1
  endif
endfunction

" set textwidth=100   that's
" if TextwidthIsTooWide()
"   echom "Waring: wide text"
" endif
"
function DisplayName(name)
  echom "Hello!  My name is:"
  echom a:name
endfunction

" call DisplayName("liuyc")
"
function Varg(...)
  echom a:0
  echom a:1
  echom a:2
  echo a:000
endfunction

" call Varg("a","b")
" nnoremap <leader>g :execute "grep '<cWORD>' ."<cr>
" nnoremap <leader>g :execute "grep ".shellescape("<cWORD>")." ."<cr>
" nnoremap <localleader>g :silent execute "grep! ".shellescape(expand("<cWORD>"))." ."<cr>:copen<cr>
" foo;ls

" let c = 0
"
" for i in [1,2,3,4,5]
"   let c+=i
" endfor
"
" echom c

" let dict = {'a':100,'b':300,}
" let test = remove(dict,'a')
" unlet dict.b
" echo test
" echo dict

nnoremap <localleader>f :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
  if &foldcolumn 
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=4
  endif
  echom &foldcolumn
endfunction

nnoremap <localleader>q :call QuickfixToggle()<cr>
let g:quickfix_is_open=0
function! QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open=0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open=1
  endif
endfunction

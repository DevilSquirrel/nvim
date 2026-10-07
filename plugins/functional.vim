function! Sorted(l)
    let new_list = deepcopy(a:l)
    call sort(new_list)
    return new_list
endfunction

function! Reversed(l)
    let new_list = deepcopy(a:l)
    call reverse(new_list)
    return new_list
endfunction

function! Append(l, val)
    let new_list = deepcopy(a:l)
    call add(new_list, a:val)
    return new_list
endfunction

function! Assoc(l, i, val)
    let new_list = deepcopy(a:l)
    let new_list[a:i] = a:val
    return new_list
endfunction

function! Pop(l, i)
    let new_list = deepcopy(a:l)
    call remove(new_list, a:i)
    return new_list
endfunction

function! Mapped(fn, l)
    let new_list = deepcopy(a:l)
    echom string(a:fn) . "(v:val)"
    call map(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

" let arr=[1,2,3,4,5,6]
" echom Reversed(arr)
" echom Append(arr, 7)
" echom Assoc(arr, 3, 10)
" echom Pop(arr, 2)
"
" let mylist = [[1,2],[3,4]]
" echo Mapped(function("Reversed"), mylist)

function! Filtered(fn, l)
    let new_list = deepcopy(a:l)
    call filter(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

function! Removed(fn, l)
    let new_list = deepcopy(a:l)
    call filter(new_list, '!' . string(a:fn) . '(v:val)')
    return new_list
endfunction

" let arr = [[1,2],[],['foo'],[]]
" echom Filtered(function('len'),arr)
" echom Removed(function('len'),arr)


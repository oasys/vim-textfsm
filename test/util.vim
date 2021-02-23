" utility function and mapping to assist with generating syntax assertions

function! SyntaxItem()
  return synIDattr(synID(line('.'),col('.'),1),'name')
endfunction

function! GetSyn()
  let matchgroup=SyntaxItem()
  let row=getcurpos()[1]
  let col=getcurpos()[2]
  echom printf("  AssertEqual SyntaxAt(%d,%d), '%s'", row, col, matchgroup)
endfunction

nmap <silent> <Leader>s :call GetSyn()<CR>

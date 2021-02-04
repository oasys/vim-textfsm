" Vim syntax file
" Language:    textfsm
" Maintainer:  Jason Lavoie <jason@oasys.net>
" URL:         https://github.com/oasys/vim-textfsm

if exists("b:current_syntax")
  finish
endif

syntax match simpleVar "\k\+" nextgroup=simpleAssignment
syntax match simpleAssignment "=" contained nextgroup=simpleValue
syntax match simpleValue ".*" contained

hi def link simpleVar Identifier
hi def link simpleAssignment Statement
hi def link simpleValue String

syn region  textfsmLineComment       start=+^\s*#+ end=+$+


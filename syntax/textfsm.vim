" Vim syntax file
" Language:    textfsm
" Maintainer:  Jason Lavoie <jason@oasys.net>
" URL:         https://github.com/oasys/vim-textfsm

if exists('b:current_syntax')
  finish
endif

syntax case match

sy match  tfComment "^\s*#.*"

sy match  tfState   "\v^\w+$" nextgroup=tfRule skipnl
sy region tfRule    contained start="\v^\s\s?\^" end="$"  end="\s->" contains=tfRuleVar,tfArrow,tfStateComment nextgroup=tfArrow,tfRule oneline skipnl skipwhite
sy match  tfRuleComment "^\s*#.*" nextgroup=tfRule skipnl
sy match  tfRuleVar contained "\v\$\w+"
sy match  tfRuleVar contained "\v\$\{\w+\}"
sy match  tfArrow   contained "->" nextgroup=tfAction,tfNext skipwhite
sy match  tfNext    contained "\v\w+" nextgroup=tfRule skipnl skipwhite
sy match  tfAction  contained "\v(Next|Continue|Record|NoRecord|Clear(All)*)" nextgroup=tfNext,tfRule skipnl skipwhite
sy match  tfAction  contained "\v(Next|Continue)\.(Record|NoRecord|Clear(All)*)" nextgroup=tfNext,tfRule skipnl skipwhite
sy match  tfAction  contained "\vError.*" nextgroup=tfRule skipnl

sy match  tfValue   "\v^Value" nextgroup=tfOption,tfVar skipwhite
sy match  tfVar     contained "\v\S+" nextgroup=tfRegex skipwhite
sy match  tfOption  contained "\v((Filldown|Key|Required|List|Fillup),?)+" nextgroup=tfVar,tfRegex skipwhite
sy match  tfRegex   contained "\v\(.*\)"hs=s+1,he=e-1

hi def link tfValue PreProc
hi def link tfState Statement
hi def link tfNext Statement

hi def link tfAction Constant
hi def link tfOption Constant

hi def link tfVar Identifier
hi def link tfRuleVar Identifier

hi def link tfComment Comment
hi def link tfRuleComment Comment
hi def link tfArrow Function

hi def link tfRule String
hi def link tfRegex String

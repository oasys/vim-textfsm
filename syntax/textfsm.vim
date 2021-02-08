" Vim syntax file
" Language:    textfsm
" Maintainer:  Jason Lavoie <jason@oasys.net>
" URL:         https://github.com/oasys/vim-textfsm

if exists('b:current_syntax')
  finish
endif

syntax case match

sy match  tfComment "^\s*#.*"

sy match  tfState   "\v^\w+$" nextgroup=tfRule,tfStateComment skipnl
sy region tfRule    contained start="\v^\s\s?\^" end="$"  end="\s->" contains=tfRuleVar,tfArrow nextgroup=tfRule,tfStateComment oneline skipnl skipwhite
sy match  tfStateComment contained "^\s*#.*" nextgroup=tfRule,tfStateComment skipnl
sy match  tfRuleVar contained "\v\$\w+"
sy match  tfRuleVar contained "\v\$\{\w+\}"
sy match  tfArrow   contained "->" nextgroup=tfAction,tfNext skipwhite
sy match  tfNext    contained "\v\w+" skipnl
sy match  tfAction  contained "\v(Next|Continue|Record|NoRecord|Clear(All)*)" nextgroup=tfNext skipnl skipwhite
sy match  tfAction  contained "\v(Next|Continue)\.(Record|NoRecord|Clear(All)*)" nextgroup=tfNext skipnl skipwhite
sy match  tfAction  contained "\vError.*" nextgroup=tfRule skipnl

sy match  tfValue   "\v^Value\s" nextgroup=tfOption,tfVar skipwhite
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
hi def link tfStateComment Comment
hi def link tfArrow Function

hi def link tfRule String
hi def link tfRegex String

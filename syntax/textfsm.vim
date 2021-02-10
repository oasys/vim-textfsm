" Vim syntax file
" Language:    textextfsmsm
" Maintainer:  Jason Lavoie <jason@oasys.net>
" URL:         https://github.com/oasys/vim-textextfsmsm

if exists('b:current_syntax')
  finish
endif

syntax case match

sy match  textfsmComment                "^\s*#.*"

" State block(s)
sy match  textfsmState                  "\v^\w+\s*$" nextgroup=textfsmRule,textfsmStateComment skipnl
sy region textfsmRule         contained start="\v^\s\s?\^" end="$"  end="\s->" contains=textfsmRuleVar,textfsmArrow nextgroup=textfsmRule,textfsmStateComment skipnl skipwhite
sy match  textfsmStateComment contained "^\s*#.*" nextgroup=textfsmRule,textfsmStateComment skipnl
sy match  textfsmRuleVar      contained "\v\$\w+"
sy match  textfsmRuleVar      contained "\v\$\{\w+\}"
sy match  textfsmArrow        contained "->" nextgroup=textfsmAction,textfsmNext skipwhite
sy match  textfsmNext         contained "\v\w+" skipnl
sy match  textfsmAction       contained "\v<(Next|Continue|Record|NoRecord|Clear(All)*)>" nextgroup=textfsmNext skipnl skipwhite
sy match  textfsmAction       contained "\v<(Next|Continue)\.(Record|NoRecord|Clear(All)*)>" nextgroup=textfsmNext skipnl skipwhite
sy match  textfsmAction       contained "\vError.*" nextgroup=textfsmRule skipnl

" Value definition(s)
sy match  textfsmValue                  "\v^Value\s" nextgroup=textfsmOption,textfsmVar skipwhite
sy match  textfsmVar          contained "\v\S+" nextgroup=textfsmRegex skipwhite
sy match  textfsmOption       contained "\v<((Filldown|Key|Required|List|Fillup),?)+>" nextgroup=textfsmVar,textfsmRegex skipwhite
sy match  textfsmRegex        contained "\v\(.*\)"hs=s+1,he=e-1

sy region textfsmStateFold              start="\v^\S+\s*$" end="\v\n\s*\n" fold transparent

hi def link textfsmValue PreProc
hi def link textfsmState Statement
hi def link textfsmNext Statement

hi def link textfsmAction Constant
hi def link textfsmOption Constant

hi def link textfsmVar Identifier
hi def link textfsmRuleVar Identifier

hi def link textfsmComment Comment
hi def link textfsmStateComment Comment
hi def link textfsmArrow Function

hi def link textfsmRule String
hi def link textfsmRegex String

" ToAPL.vim - an APL transliteration script
" 
"   Author and maintainer: Richard Alex Hofer <atomic.quark@gmail.com>
"   Last Change: 2013-05-21
"
" SYNOPSIS:
"   This defines ToAPL which converts TeX-style commands into APL characters
" SHORT USAGE DESCRIPTION:
"   Run ToAPL to convert a line into APL symbols
"
" DETAILED DESCRIPTION:
"   1. source ToAPL.vim or place ToAPL.vim into your ~/.vim/plugins direcctory
"   2. run ToAPL to convert a line of Tex-style commands into APL character
"   The conversion table is listed below:
"   +---------------+---------------+---------------+---------------+
"   |    Command    | APL Character |    Command    | APL Character |
"   +---------------+---------------+---------------+---------------+
"   | \divide       | ÷             | \negative     | ¯             |
"   +---------------+---------------+---------------+---------------+
"   | <-            | ←             | \times        | ×             |
"   +---------------+---------------+---------------+---------------+
"   | \alpha        | ⍺             | \omega        | ⍵             |
"   +---------------+---------------+---------------+---------------+
"   | \zilde        | ⍬             | \currency     | ¤             |
"   +---------------+---------------+---------------+---------------+
"   | \yen          | ¥             | \pound        | £             |
"   +---------------+---------------+---------------+---------------+
"   | \cent         | ¢             | \delta        | ∆             |
"   +---------------+---------------+---------------+---------------+
"   | \deltau       | ⍙             | \euro         | €             |
"   +---------------+---------------+---------------+---------------+
"   | \ltack        | ⊣             | \rtack        | ⊢             |
"   +---------------+---------------+---------------+---------------+
"   | \utack        | ⊥             | \dtack        | ⊤             |
"   +---------------+---------------+---------------+---------------+
"   | \ustile       | ⌈             | \dstile       | ⌊             |
"   +---------------+---------------+---------------+---------------+
"   | \uarrow       | ↑             | \darrow       | ↓             |
"   +---------------+---------------+---------------+---------------+
"   | \iota         | ⍳             | \nabla        | ∇             |
"   +---------------+---------------+---------------+---------------+
"   | \jot          | ∘             | \circle       | ○             |
"   +---------------+---------------+---------------+---------------+
"   | \subset       | ⊂             | \superset     | ⊃             |
"   +---------------+---------------+---------------+---------------+
"   | \interset     | ∩             | \union        | ∪             |
"   +---------------+---------------+---------------+---------------+
"   | \interset     | ∩             | \union        | ∪             |
"   +---------------+---------------+---------------+---------------+
"   | \or           | ∨             | \and          | ∧             |
"   +---------------+---------------+---------------+---------------+
"   | \nor          | ⍱             | \nand         | ⍲             |
"   +---------------+---------------+---------------+---------------+
"   | \gradeu       | ⍋             | \graded       | ⍒             |
"   +---------------+---------------+---------------+---------------+
"   | \neq          | ≠             | \rho          | ⍴             |
"   +---------------+---------------+---------------+---------------+
"   | \o-           | ⊖             | \o|           | ⌽             |
"   +---------------+---------------+---------------+---------------+

function! ToAPL()
  let o_ignorecase = &ignorecase 
  let o_gdefault = &gdefault
  set noignorecase
  set gdefault
  let mapping = {
    \ '\\divide'    : '÷',
    \ '\\negative'  : '¯',
    \ '<\-'         : '←', 
    \ '\\times'     : '×', 
    \ '\\alpha'     : '⍺', 
    \ '\\omega'     : '⍵', 
    \ '\\zilde'     : '⍬',
    \ '\\currency'  : '¤',
    \ '\\yen'       : '¥',
    \ '\\pound'     : '£',
    \ '\\cent'      : '¢',
    \ '\\delta'     : '∆',
    \ '\\deltau'    : '⍙',
    \ '\\euro'      : '€',
    \ '\\ltack'     : '⊣',
    \ '\\rtack'     : '⊢',
    \ '\\utack'     : '⊥',
    \ '\\dtack'     : '⊤',
    \ '\\ustile'    : '⌈',
    \ '\\dstile'    : '⌊',
    \ '\\uarrow'    : '↑',
    \ '\\darrow'    : '↓',
    \ '\\iota'      : '⍳',
    \ '\\nabla'     : '∇',
    \ '\\jot'       : '∘',
    \ '\\circle'    : '○',
    \ '\\subset'    : '⊂',
    \ '\\superset'  : '⊃',
    \ '\\intersect' : '∩',
    \ '\\union'     : '∪',
    \ '\\or'        : '∨',
    \ '\\and'       : '∧',
    \ '\\nor'       : '⍱',
    \ '\\nand'      : '⍲',
    \ '\\gradeu'    : '⍋',
    \ '\\graded'    : '⍒',
    \ '\\neq'       : '≠',
    \ '\\rho'       : '⍴',
    \ '\\o-'        : '⊖',
    \ '\\o|'        : '⌽',
    \}
  for [pattern, character] in items(mapping)
    let @/=pattern
    s//\=character/e
  endfor
  let &ignorecase = o_ignorecase
  let &gdefault = o_gdefault
endf

com! ToAPL call ToAPL()

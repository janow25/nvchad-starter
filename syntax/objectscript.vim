" Syntax highlighting for ObjectScript

" Define keywords
syntax keyword objectscriptKeyword Class Method Property Parameter As Extends Return Storage Default
syntax keyword objectscriptKeyword Set Do Write set do write s d w #dim

" Highlight class names, method names, and parameters
syntax match objectscriptClassName "\<[A-Za-z0-9_\.]\+\>"
syntax match objectscriptMethodName "\<%[A-Za-z0-9_]\+\>" " Highlight methods starting with a % (e.g., %OnNew)
syntax match objectscriptParameter "\<\.\.[A-Za-z0-9_]\+\>"

" Highlight specific $-prefixed constructs (generic match for all $-commands)
syntax match objectscriptDollarCommands "\$[A-Za-z0-9_]\+"

" Highlight macros (e.g., $$$MACRO)
syntax match objectscriptMacro "\$\$\$[A-Za-z0-9_]\+"

" Highlight macros with arguments (e.g., $$$MACRO(arg))
syntax match objectscriptMacroWithArgs "\$\$\$[A-Za-z0-9_]\+\s*("

" Highlight system calls (e.g., $SYSTEM.Status.GetErrorText)
syntax match objectscriptSystemCall "\$SYSTEM\.[A-Za-z0-9_\.]\+"

" Highlight ##class and ##super constructs
syntax match objectscriptClassConstruct "##\(class\|super\)\>"

" Highlight `Property ... As` with `%` library types (e.g., Property ... As %Library.String)
syntax match objectscriptPropertyWithType "Property\s\+[A-Za-z0-9_]\+\s\+As\s\+%[A-Za-z0-9_\.]\+"

" Highlight operators (e.g., '==', '!=', '>=', '<=', and symbols like _ and +)
syntax match objectscriptOperator "'=\|=\|<>\|>=\|<=\|<\|>\|_\|+"

" Highlight comments
syntax match objectscriptComment "//.*" contains=objectscriptTodo
syntax match objectscriptTodo "TODO"

" Highlight strings (support multiline strings)
syntax region objectscriptString start=/"/ end=/"/ skip=/\\\"/ contains=objectscriptOperator

" Highlight numbers (support floats and scientific notation)
syntax match objectscriptNumber "\<\d\+\(\.\d*\([eE][+-]\?\d\+\)\?\|\([eE][+-]\?\d\+\)\)\>"

" Highlight control structures
syntax keyword objectscriptControl If Else Continue

" Highlight comments (also multiline)
syntax region objectscriptMultilineComment start="/\*" end="\*/" contains=objectscriptComment,objectscriptTodo

" Define highlight groups
highlight link objectscriptKeyword Keyword
highlight link objectscriptClassName Type
highlight link objectscriptMethodName Function
highlight link objectscriptParameter Identifier
highlight link objectscriptDollarCommands Special
highlight link objectscriptMacro Special
highlight link objectscriptMacroWithArgs Special
highlight link objectscriptSystemCall Function
highlight link objectscriptClassConstruct Statement
highlight link objectscriptPropertyWithType Type
highlight link objectscriptOperator Operator
highlight link objectscriptComment Comment
highlight link objectscriptTodo Todo
highlight link objectscriptString String
highlight link objectscriptNumber Number
highlight link objectscriptControl Conditional
highlight link objectscriptMultilineComment Comment

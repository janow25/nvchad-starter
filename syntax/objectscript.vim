" Syntax highlighting for ObjectScript

" Define keywords
syntax keyword objectscriptKeyword Class Method ClassMethod Property Parameter As as Extends Return Storage Default
syntax keyword objectscriptKeyword Set Do Write set do write s d w Return return Quit quit q New new n ZN ZNspace

syntax match objectscriptKeyword "\v#dim" 

" Highlight ##class and ##super as separate constructs
syntax match objectscriptClassConstruct "##\(class\|super\)\>"

" Highlight the brackets inside ##class(...) or ##super(...)
syntax match objectscriptBrackets "[()]" contained

" Highlight the class name inside ##class(...) or ##super(...) without including ##class or ##super
syntax region objectscriptClassName start="##class(" end=")" contained contains=objectscriptClassConstruct,objectscriptBrackets,objectscriptInnerClassName

" Highlight the actual class name inside ##class(...) or ##super(...)
syntax match objectscriptInnerClassName "[%A-Za-z0-9_]\+" contained

" Highlight method names globally
syntax match objectscriptMethodName "[%A-Za-z0-9_]\+"
" Highlight parameters (e.g., `..param`)
"syntax match objectscriptParameter "\<\.\.[A-Za-z0-9_]\+\>"

" Highlight specific $-prefixed constructs (generic match for all $-commands)
syntax match objectscriptDollarCommands "\$[A-Za-z0-9_]\+"

" Highlight macros (e.g., $$$MACRO)
syntax match objectscriptMacro "\$\$\$[A-Za-z0-9_]\+"

" Highlight macros with arguments (e.g., $$$MACRO(arg))
"syntax match objectscriptMacroWithArgs "\$\$\$[A-Za-z0-9_]\+\s*("

" Highlight system calls (e.g., $SYSTEM.Status.GetErrorText)
syntax match objectscriptSystemCall "\$SYSTEM\.[A-Za-z0-9_\.]\+"

" Highlight `Property ... As` with `%` library types (e.g., Property ... As %Library.String)
syntax match objectscriptPropertyWithType "Property\s\+[A-Za-z0-9_]\+\s\+As\s\+%[A-Za-z0-9_\.]\+"

" Highlight operators (e.g., '==', '!=', '>=', '<=', and symbols like _ and +)
syntax match objectscriptOperator "'=\|=\|<>\|>=\|<=\|<\|>\|_\|+"

" Highlight comments
syntax match objectscriptComment "//.*" contains=objectscriptTodo
syntax match objectscriptTodo "TODO:.*" contained

" Highlight strings (support multiline strings)
syntax region objectscriptString start=/"/ end=/"/ skip=/\\\"/

" Highlight numbers (support floats and scientific notation)
syntax match objectscriptNumber "\<\d\+\(\.\d*\([eE][+-]\?\d\+\)\?\|\([eE][+-]\?\d\+\)\)\>"

" Highlight control structures
syntax keyword objectscriptControl If Else Continue

" Highlight comments (also multiline)
syntax region objectscriptMultilineComment start="/\*" end="\*/" contains=objectscriptComment,objectscriptTodo

" Define highlight groups
highlight link objectscriptKeyword Keyword
highlight link objectscriptClassConstruct Statement
highlight link objectscriptClassName Type
highlight link objectscriptInnerClassName Type
highlight link objectscriptBrackets Operator
highlight link objectscriptMethodName Function
highlight link objectscriptParameter Identifier
highlight link objectscriptDollarCommands Special
highlight link objectscriptMacro Special
highlight link objectscriptMacroWithArgs Special
highlight link objectscriptSystemCall Function
highlight link objectscriptPropertyWithType Type
highlight link objectscriptOperator Operator
highlight link objectscriptComment Comment
highlight link objectscriptTodo Todo
highlight link objectscriptString String
highlight link objectscriptNumber Number
highlight link objectscriptControl Conditional
highlight link objectscriptMultilineComment Comment
